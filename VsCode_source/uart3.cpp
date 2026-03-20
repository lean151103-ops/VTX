#include <iostream>
#include <windows.h>
#include <stdint.h>
#include <vector>
#include <iomanip>

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
    if (hSerial == INVALID_HANDLE_VALUE) {
        std::cerr << "Error opening serial port: " << portName << std::endl;
        return INVALID_HANDLE_VALUE;
    }

    DCB dcb{};
    dcb.DCBlength = sizeof(dcb);
    GetCommState(hSerial, &dcb);

    dcb.BaudRate = baudrate;
    dcb.ByteSize = 8;
    dcb.StopBits = ONESTOPBIT;
    dcb.Parity   = NOPARITY;
    SetCommState(hSerial, &dcb);

    COMMTIMEOUTS timeouts = {};
    timeouts.ReadIntervalTimeout        = 50;
    timeouts.ReadTotalTimeoutConstant   = 50;
    timeouts.ReadTotalTimeoutMultiplier = 10;
    SetCommTimeouts(hSerial, &timeouts);

    return hSerial;
}

bool uartSend(HANDLE hSerial, const uint8_t* data, uint32_t len) {
    DWORD bytesWritten = 0;
    return WriteFile(hSerial, data, len, &bytesWritten, NULL) && (bytesWritten == len);
}

uint32_t crc32(const uint8_t data[], size_t length) {
    uint32_t crc = 0xFFFFFFFF;
    for (size_t i = 0; i < length; i++) {
        crc ^= data[i];
        for (int j = 0; j < 8; j++) {
            if (crc & 1) crc = (crc >> 1) ^ 0xEDB88320u;
            else crc >>= 1;
        }
    }
    return crc ^ 0xFFFFFFFFu;
}

static inline void pack_u16_le(uint16_t v, uint8_t* b) {
    b[0] = (uint8_t)(v & 0xFF);
    b[1] = (uint8_t)((v >> 8) & 0xFF);
}

static inline void pack_u32_le(uint32_t v, uint8_t* b) {
    b[0] = (uint8_t)(v & 0xFF);
    b[1] = (uint8_t)((v >> 8) & 0xFF);
    b[2] = (uint8_t)((v >> 16) & 0xFF);
    b[3] = (uint8_t)((v >> 24) & 0xFF);
}

// Frame: AA 55 + seq(2B LE) + payload(100B: 1..100) + crc32(payload)(4B LE) = 108B
std::vector<uint8_t> buildFrame_seqPayload(uint16_t seq) {
    const int LEN_PAYLOAD = 100;

    std::vector<uint8_t> frame;
    frame.reserve(2 + 2 + LEN_PAYLOAD + 4);

    // Header
    frame.push_back(0xAA);
    frame.push_back(0x55);

    // Seq
    uint8_t seqBytes[2];
    pack_u16_le(seq, seqBytes);
    frame.push_back(seqBytes[0]);
    frame.push_back(seqBytes[1]);

    // Payload: 1..100
    for (int i = 1; i <= LEN_PAYLOAD; i++) {
        frame.push_back((uint8_t)i); // 1,2,...,100
    }

    // CRC over payload only (payload bắt đầu từ index 4)
    uint32_t crc = crc32(&frame[4], LEN_PAYLOAD);
    uint8_t crcBytes[4];
    pack_u32_le(crc, crcBytes);
    frame.insert(frame.end(), crcBytes, crcBytes + 4);

    return frame;
}

int main() {
    HANDLE uart = initUART("\\\\.\\COM9", 921600);
    if (uart == INVALID_HANDLE_VALUE) return -1;

    uint16_t seq = 1; // muốn seq nào thì đổi ở đây
    std::vector<uint8_t> tx_frame = buildFrame_seqPayload(seq);

    PurgeComm(uart, PURGE_RXCLEAR);

    if (!uartSend(uart, tx_frame.data(), (uint32_t)tx_frame.size())) {
        std::cerr << "Failed to send frame\n";
        CloseHandle(uart);
        return -1;
    }
    else { std::cout << "Frame sended:" << std::hex;
        for (size_t i = 0; i < tx_frame.size(); i++) {
        std::cout << " " << std::hex << std::setw(2) << std::setfill('0') 
                        << (int)tx_frame[i];
        }
        std::cout << std::dec << "\n";
    }

    std::cout << "Sent 1 frame (seq=" << seq << "), payload=1..100, total=" << tx_frame.size() << " bytes\n";

    CloseHandle(uart);
    return 0;
}