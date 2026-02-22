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

bool recvFrame(HANDLE hSerial, std::vector<uint8_t>& outFrame, DWORD timeoutMs) {
    // New frame size: 2 header + 2 seq + 100 payload + 4 crc = 108 bytes
    outFrame.assign(108, 0);

    uint32_t got = 0;
    DWORD start = GetTickCount();

    while (got < (uint32_t)outFrame.size()) {
        DWORD bytesRead = 0;
        BOOL ok = ReadFile(hSerial,
                           outFrame.data() + got,
                           (DWORD)(outFrame.size() - got),
                           &bytesRead,
                           NULL);
        if (!ok) return false;
        got += (uint32_t)bytesRead;

        if (GetTickCount() - start > timeoutMs) {
            std::cerr << "Timeout receiving full Frame_data\n";
            return false;
        }
    }
    return true;
}

uint32_t crc32(const uint8_t data[], size_t length) {
    uint32_t crc = 0xFFFFFFFF;
    for (size_t i = 0; i < length; i++) {
        crc ^= data[i];
        for(int j=0; j< 8; j++) {
            if(crc & 1) crc = (crc >> 1) ^ 0xEDB88320u;
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

static inline void pack_u16_le(uint16_t v, uint8_t* b) {
    b[0] = (uint8_t)(v & 0xFF);
    b[1] = (uint8_t)((v >> 8) & 0xFF);
}

static inline uint16_t unpack_u16_le(const uint8_t* b) {
    return (uint16_t)((uint16_t)b[0] | ((uint16_t)b[1] << 8));
}

std::vector<uint8_t> buildFrame(uint16_t seq) {
    const uint16_t LEN_PAYLOAD = 100;

    std::vector<uint8_t> frame;
    // 2 header + 2 seq + 100 payload + 4 crc = 108
    frame.reserve(2 + 2 + LEN_PAYLOAD + 4);

    frame.push_back(0xAA);
    frame.push_back(0x55);

    uint8_t seqBytes[2];
    pack_u16_le(seq, seqBytes);
    frame.push_back(seqBytes[0]);
    frame.push_back(seqBytes[1]);

    static std::mt19937 rng((unsigned)std::random_device{}());
    static std::uniform_int_distribution<int> dist(0, 255);

    for (int i = 0; i < (int)LEN_PAYLOAD; i++) {
        frame.push_back((uint8_t)dist(rng));
    }

    // CRC over payload only (giữ nguyên logic như cũ), payload bắt đầu từ index 4
    uint32_t crc = crc32(&frame[4], LEN_PAYLOAD);
    uint8_t crcBytes[4];
    pack_crc_lte(crc, crcBytes);
    frame.insert(frame.end(), crcBytes, crcBytes + 4);

    return frame;
}

int main() {
    HANDLE uart = initUART("\\\\.\\COM5", 115200);
    if (uart == INVALID_HANDLE_VALUE) return -1;

    for (int i = 0; i < 1000; i++) {
        uint16_t seq = (uint16_t)(i + 1);
        std::vector<uint8_t> tx_frame = buildFrame(seq);

        PurgeComm(uart, PURGE_RXCLEAR);

        if (!uartSend(uart, tx_frame.data(), (uint32_t)tx_frame.size())) {
            std::cerr << "Failed to send data" << std::endl;
            continue;
        }

        std::cout << "Sent frame " << (i + 1) << " (seq=" << seq << ")\n";
        Sleep(5);
    }

    CloseHandle(uart);
    return 0;
}
