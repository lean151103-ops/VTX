#include <iostream>
#include <cstring>
#include <windows.h>
#include <stdint.h>
#include <vector>
#include <random>

HANDLE initUART(const char* portName, int baudrate) {
    HANDLE hSerial = CreateFileA(
        portName,
        GENERIC_READ | GENERIC_WRITE,
        0,
        NULL,
        OPEN_EXISTING,
        FILE_ATTRIBUTE_NORMAL,
        NULL
    );
    if(hSerial == INVALID_HANDLE_VALUE) {
        std::cerr << "Error opening serial port: " << portName << std::endl;
        return INVALID_HANDLE_VALUE;
    }
    DCB dcb{};
    dcb.DCBlength = sizeof(dcb);

    GetCommState(hSerial, &dcb);

    dcb.BaudRate = baudrate;
    dcb.ByteSize = 8;
    dcb.StopBits = ONESTOPBIT;
    dcb.Parity = NOPARITY;

    SetCommState(hSerial, &dcb);

    COMMTIMEOUTS timeouts = {};
    timeouts.ReadIntervalTimeout = 50;
    timeouts.ReadTotalTimeoutConstant = 50;
    timeouts.ReadTotalTimeoutMultiplier = 10;
    SetCommTimeouts(hSerial, &timeouts);

    return hSerial;
}

bool uartSend(HANDLE hSerial, const uint8_t* data, uint32_t len) {
    DWORD bytesWritten;
    return WriteFile(hSerial, data, len, &bytesWritten, NULL);
}

uint32_t crc32(const uint8_t data[], size_t length) {
    uint32_t crc = 0xFFFFFFFF;
    for (size_t i = 0; i < length; i++) {
        crc ^= data[i];
        for(int j=0; j< 8; j++) {
            if(crc & 1) {
                crc = (crc >> 1) ^ 0xEDB88320u;
            }
            else crc >>= 1;
        }
    }
    return crc ^ 0xFFFFFFFFu;
}

void pack_crc_lte(uint32_t crc, uint8_t* buffer) {
    buffer[0] = crc & 0xFF;
    buffer[1] = (crc >> 8) & 0xFF;
    buffer[2] = (crc >> 16) & 0xFF;
    buffer[3] = (crc >> 24) & 0xFF;
}

uint32_t unpack_crc_lte(const uint8_t* buffer) {
    return  ((uint32_t) buffer[0]) |
            ((uint32_t) buffer[1] << 8)  |
            ((uint32_t) buffer[2] << 16) |
            ((uint32_t) buffer[3] << 24);
}

std::vector<uint8_t> buildFrame() {
    const uint8_t LEN_PAYLOAD = 100;
    std::vector<uint8_t> frame;
    frame.reserve(2+1+LEN_PAYLOAD+4);
    frame.push_back(0xAA);
    frame.push_back(0x55);
    frame.push_back(LEN_PAYLOAD);
    static std::mt19937 rng((unsigned)std::random_device{}());
    static std::uniform_int_distribution<int> dist(0, 255);

    for (int i = 0; i < LEN_PAYLOAD; i++) {
        frame.push_back((uint8_t)dist(rng));
    }
    uint32_t crc = crc32(&frame[3], LEN_PAYLOAD);
    uint8_t crcBytes[4];
    pack_crc_lte(crc, crcBytes);
    frame.insert(frame.end(), crcBytes, crcBytes + 4);
    return frame;
}

bool recvFrame(HANDLE hSerial, std::vector<uint8_t>& outFrame, DWORD timeoutMs) {
    outFrame.assign(107, 0);

    uint32_t got = 0;
    DWORD start = GetTickCount();

    while (got < (uint32_t)outFrame.size()) {
        DWORD bytesRead = 0;
        BOOL ok = ReadFile(hSerial,
                           outFrame.data() + got,
                           (DWORD)(outFrame.size() - got),
                           &bytesRead,
                           NULL);
        //std::cout << "ReadFile returned " << ok << ", bytesRead=" << bytesRead << std::endl;
        if (!ok) return false;
        got += (uint32_t)bytesRead;     // bytesRead có thể = 0

        if (GetTickCount() - start > timeoutMs) {
            std::cerr << "Timeout receiving full Frame_data\n";
            return false;
        }
    }
    return true;
}

bool checkFrame(const std::vector<uint8_t>&recvData) {
    const uint8_t LEN_PAYLOAD = 100;
    if(recvData.size() != 2 + 1 + LEN_PAYLOAD + 4) return false;
    if(recvData[0] != 0xAA || recvData[1] != 0x55) return false;

    uint32_t crc_rx   = unpack_crc_lte(&recvData[2 + 1 + LEN_PAYLOAD]);
    uint32_t crc_calc = crc32(&recvData[2 + 1], LEN_PAYLOAD);
    return crc_rx == crc_calc;
}

void delay_us(long long us)
{
    LARGE_INTEGER freq, start, now;
    QueryPerformanceFrequency(&freq);
    QueryPerformanceCounter(&start);

    long long ticks = us * freq.QuadPart / 1000000LL;

    do {
        QueryPerformanceCounter(&now);
    } while ((now.QuadPart - start.QuadPart) < ticks);
}

LARGE_INTEGER qpc_freq;
void init_timer()
{
    QueryPerformanceFrequency(&qpc_freq);
}

inline int64_t timestamp_ticks()
{
    LARGE_INTEGER t;
    QueryPerformanceCounter(&t);
    return t.QuadPart;
}

inline double elapsed_us(int64_t start, int64_t end)
{
    return (double)(end - start) * 1e6 / qpc_freq.QuadPart;
}

int main() {
    init_timer();
    HANDLE uart = initUART("\\\\.\\COM9", 921600);
    if (uart == INVALID_HANDLE_VALUE) return -1;

    int bad = 0;
    int ok = 0;
    for(int i=0; i <1000000; i++) {
        std::vector<uint8_t> tx_frame = buildFrame();
        PurgeComm(uart, PURGE_RXCLEAR); 

        int64_t t0 = timestamp_ticks();
        if(!uartSend(uart, tx_frame.data(), tx_frame.size())) {
            std::cerr << "Failed to send data" << std::endl;
            continue;
        }
         // Wait for data to be sent and processed
        std::vector<uint8_t> rx_frame(tx_frame.size());
        if (!recvFrame(uart, rx_frame, 500)) {
            std::cerr << "Recv timeout\n";
            bad++;
            continue;
        }
        int64_t t1 = timestamp_ticks();
        double rtt_us = elapsed_us(t0, t1);
        // for (uint8_t b : rx_frame) {
        //     std::cout << std::hex << (int)b << " ";
        // }
        std::cout << "Time for 1 loopback: " << rtt_us << std::endl;
        bool frame_ok = checkFrame(rx_frame);
        if(frame_ok) ok++;
        else bad++;
        std::cout << "i=" << i << " OK=" << ok << " BAD=" << bad << std::endl;
    }
    CloseHandle(uart);
    return 0;
}
