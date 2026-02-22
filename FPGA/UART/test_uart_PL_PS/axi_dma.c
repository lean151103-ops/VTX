/******************************************************************************
* DMA S2MM debug (simple mode):
* - Configure UART first so prints are clean
* - Disable D-cache
* - Before each transfer: fill DDR buffer with a known pattern
* - Start S2MM transfer (108B)
* - Poll with timeout
* - On timeout: dump full S2MM regs (CR/SR/DA/LEN) then reset + retry
* - On done: check how many bytes changed vs pattern + dump first 32 bytes
******************************************************************************/

#include "xparameters.h"
#include "xil_printf.h"
#include "xil_cache.h"
#include "xil_io.h"
#include "xstatus.h"
#include "platform.h"
#include "xaxidma.h"
#include "xuartps.h"

#define FRAME_SIZE 108
#define DMA_DEV_ID  XPAR_AXIDMA_0_DEVICE_ID
#define UART_DEV_ID XPAR_XUARTPS_0_DEVICE_ID

__attribute__ ((aligned(64))) static u8 FrameBuf[FRAME_SIZE];
static u8 PatternBuf[FRAME_SIZE];

static int UartInit(XUartPs *Uart)
{
    XUartPs_Config *Cfg = XUartPs_LookupConfig(UART_DEV_ID);
    if (!Cfg) return XST_FAILURE;

    int Status = XUartPs_CfgInitialize(Uart, Cfg, Cfg->BaseAddress);
    if (Status != XST_SUCCESS) return Status;

    // Match your terminal
    Status = XUartPs_SetBaudRate(Uart, 115200);
    return Status;
}

static int DmaInit(XAxiDma *AxiDma)
{
    XAxiDma_Config *Cfg = XAxiDma_LookupConfig(DMA_DEV_ID);
    if (!Cfg) return XST_FAILURE;

    int Status = XAxiDma_CfgInitialize(AxiDma, Cfg);
    if (Status != XST_SUCCESS) return Status;

    if (XAxiDma_HasSg(AxiDma)) {
        xil_printf("ERROR: DMA is SG mode (need Simple)\r\n");
        return XST_FAILURE;
    }

    XAxiDma_Reset(AxiDma);
    while (!XAxiDma_ResetIsDone(AxiDma)) {}
    return XST_SUCCESS;
}

static void DumpS2MMRegsFull(XAxiDma *AxiDma)
{
    // AXI DMA register map (standard):
    // S2MM_DMACR   0x30
    // S2MM_DMASR   0x34
    // S2MM_DA      0x48 (destination address LSB)
    // S2MM_LENGTH  0x58
    UINTPTR Base = AxiDma->RegBase;

    u32 dmacr  = Xil_In32(Base + 0x30);
    u32 dmasr  = Xil_In32(Base + 0x34);
    u32 da     = Xil_In32(Base + 0x48);
    u32 length = Xil_In32(Base + 0x58);

    xil_printf("S2MM_DMACR=0x%08x  S2MM_DMASR=0x%08x  DA=0x%08x  LEN=%u\r\n",
               dmacr, dmasr, da, length);
}

static void FillPattern(u8 *buf, u32 len, u8 seed)
{
    for (u32 i = 0; i < len; i++) buf[i] = (u8)(seed + (u8)i);
}

static int CountDiff(const u8 *a, const u8 *b, u32 len)
{
    int diff = 0;
    for (u32 i = 0; i < len; i++) if (a[i] != b[i]) diff++;
    return diff;
}

static void DumpHex(const u8 *buf, u32 len)
{
    for (u32 i = 0; i < len; i++) {
        xil_printf("%02x ", buf[i]);
        if ((i & 0x0F) == 0x0F) xil_printf("\r\n");
    }
    if ((len & 0x0F) != 0) xil_printf("\r\n");
}

int main()
{
    init_platform();

    XUartPs Uart;
    XAxiDma AxiDma;

    if (UartInit(&Uart) != XST_SUCCESS) return -1;

    xil_printf("DMA debug start\r\n");

    // Simplify coherency
    Xil_DCacheDisable();

    if (DmaInit(&AxiDma) != XST_SUCCESS) {
        xil_printf("DMA init failed\r\n");
        return -1;
    }
    xil_printf("DMA init OK\r\n");

    u32 frame_cnt = 0;
    const u32 TIMEOUT = 50000000;

    while (1) {
        xil_printf("\r\nStart RX frame %u\r\n", frame_cnt);

        // Put known pattern before DMA writes
        FillPattern(PatternBuf, FRAME_SIZE, 0xA5);
        for (u32 i = 0; i < FRAME_SIZE; i++) FrameBuf[i] = PatternBuf[i];

        // Start S2MM transfer
        int Status = XAxiDma_SimpleTransfer(&AxiDma,
                                            (UINTPTR)FrameBuf,
                                            FRAME_SIZE,
                                            XAXIDMA_DEVICE_TO_DMA);
        if (Status != XST_SUCCESS) {
            xil_printf("SimpleTransfer failed: %d\r\n", Status);
            DumpS2MMRegsFull(&AxiDma);
            continue;
        }

        // Poll busy with timeout
        u32 t = 0;
        while (XAxiDma_Busy(&AxiDma, XAXIDMA_DEVICE_TO_DMA)) {
            if (++t >= TIMEOUT) {
                xil_printf("TIMEOUT: DMA still busy\r\n");
                DumpS2MMRegsFull(&AxiDma);
                break;
            }
        }

        if (t >= TIMEOUT) {
            xil_printf("Reset DMA and retry...\r\n");
            XAxiDma_Reset(&AxiDma);
            while (!XAxiDma_ResetIsDone(&AxiDma)) {}
            continue;
        }

        // Done: verify DDR buffer actually changed
        int diff = CountDiff(FrameBuf, PatternBuf, FRAME_SIZE);
        xil_printf("DMA done. Changed bytes: %d / %d\r\n", diff, FRAME_SIZE);

        // Print header + first 32 bytes
        xil_printf("Header=%02x %02x  Seq=%02x %02x\r\n",
                   FrameBuf[0], FrameBuf[1], FrameBuf[2], FrameBuf[3]);
        xil_printf("First 32 bytes:\r\n");
        DumpHex(FrameBuf, 32);

        frame_cnt++;
    }

    // never reached
    // cleanup_platform();
    // return 0;
}
