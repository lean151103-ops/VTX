# VTX
8/1/2026
FPGA/UART: 2 IP core uart_rx and  uart_tx
- Test 23-1: UART loopback in PC : uart_rx_IP + wrapper_Rx_fifo + FIFO generator + wrapper_Tx_fifo + uart_tx_IP
- Test_PL_PS 22-2: UART through PC -> Zybo_PL -> DDR -> Zybo_PS
- Uart_loop_back: ip uart_rx -> wrapperRx_fifo -> fifo generator -> wrapperTx_fifo -> uart_tx
- fifoCheckframe: Loopback-uart project but replace fifoGenerator by fifoCheckframe (user build)
18/3/2026: Telemetry_Server Project
 - Version 1: Using Scotplott 4.1.70 Library
 - Version 2: Using Scichart Library
20/3/2026:
  - VsCode_source is including source code for testing
