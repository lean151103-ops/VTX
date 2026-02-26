// Multi-threaded UART communication example in C++
#include <stdio.h>
#include <stdlib.h>
#include <windows.h>
#include <stdint.h>
#include <vector>
#include <iostream>
#include <random>
#include <thread>
#include <atomic>
#include <chrono>

const uint32_t POLYMINAl = 0xEDB88320u;
// This fucntion setting and init UART COMM
HANDLE initUART(const char* portName, int baudrate){
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
        std::cerr << "Error opening serial port:" << portName << std::endl;
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
timeouts.ReadIntervalTimeout = MAXDWORD; 
timeouts.ReadTotalTimeoutConstant = 0;
timeouts.ReadTotalTimeoutMultiplier = 0;
    SetCommTimeouts(hSerial, &timeouts);
    return hSerial;
}


// Calculating CRC of data and then packaging in Frame
uint32_t crc32(const uint8_t data[], size_t length) {
    uint32_t crc = 0xFFFFFFFF;
    for (size_t i=0; i < length; i++) {
        crc = crc ^ data[i];
        for(int j=0; j <8; j++) {
            if(crc & 1) {
                crc = (crc >> 1) ^ POLYMINAl;
            }
            else crc = (crc >> 1);
        }
    }
    return crc ^ 0xFFFFFFFFu;
}

// Separating crc32 into 4 bytes and adding into Frame (TRANS task)
void unpack_crc32_lte (const uint32_t crc, uint8_t* buffer) {
    buffer[0] = crc & 0xFF;
    buffer[1] = (crc >> 8) & 0xFF;
    buffer[2] = (crc >> 16) & 0xFF;
    buffer[3] = (crc >> 24) & 0xFF;
} 

// Merging 4 byte crc32 from Frame (RECV task)
uint32_t pack_crc32_lte(const uint8_t* buffer) {
    return ((uint32_t) buffer[0] |
            (uint32_t) buffer[1] << 8 |
            (uint32_t) buffer[2] << 16 |
            (uint32_t) buffer[3] << 24
            );
}

// Creating frame for sending: (2 header | 2 seq | 100 payload | 4 crc) = 108 bytes
void createFrame(std::vector<uint8_t>& frame, const uint16_t seq) {
    frame.clear();
    const int LEN_PAYLOAD = 100;
    const uint8_t Header1 = 0xAA;
    const uint8_t Header2 = 0x55;

    frame.push_back(Header1);
    frame.push_back(Header2);
    frame.push_back((uint8_t)(seq & 0xFF));
    frame.push_back((uint8_t)((seq >> 8) & 0xFF));

    static std::mt19937 rng((unsigned)std::random_device{}());
    static std::uniform_int_distribution<int> dist(0, 255);

    for (int i = 0; i < LEN_PAYLOAD; i++) {
        frame.push_back((uint8_t)dist(rng));
    }
    uint32_t crc = crc32(&frame[0], LEN_PAYLOAD+4);
    uint8_t crcBytes[4];
    unpack_crc32_lte(crc, crcBytes);
    frame.insert(frame.end(), crcBytes, crcBytes + 4);
    // Now frame contains the complete data to be sent over UART    
}


// Checking the received frame for correct header and crc (RECV task)
bool checkFrame(const std::vector<uint8_t>& recvFrame) {
    const int LEN_PAYLOAD = 100;
    if(recvFrame.size() != 2 + 2 + LEN_PAYLOAD + 4) return false;
    if(recvFrame[0] != 0xAA || recvFrame[1] != 0x55) return false;
    uint32_t crc_rx = pack_crc32_lte(&recvFrame[2 + 2 + LEN_PAYLOAD]);
    uint32_t crc_calculated = crc32(&recvFrame[0], 2 + 2 + LEN_PAYLOAD);
    if(crc_rx != crc_calculated) return false;
    return true;
}

bool uartSend(HANDLE hSerial, const uint8_t* data, uint32_t len) {
    DWORD bytesWritten;
    return WriteFile(hSerial, data, len, &bytesWritten, NULL);
}

bool uartReceive(HANDLE hSerial, std::vector<uint8_t>& buffer, uint32_t len) {
    uint32_t totalGot = 0;
    buffer.resize(len);
    
    while(totalGot < len) {
        DWORD bytesRead;
        // Đọc bất cứ thứ gì đang có trong buffer ngay lập tức
        if (ReadFile(hSerial, buffer.data() + totalGot, len - totalGot, &bytesRead, NULL)) {
            if (bytesRead > 0) {
                totalGot += bytesRead;
            } else {
                // Nếu chưa có dữ liệu, nhường CPU một chút rồi thử lại
                std::this_thread::yield(); 
            }
        } else {
            return false;
        }
    }
    return true;
}

void threadSend(HANDLE uart) {
    uint16_t seq = 0;
    while (true) {
        std::vector<uint8_t> tx_frame;
        createFrame(tx_frame, seq);
        if (!uartSend(uart, tx_frame.data(), tx_frame.size())) {
            std::cerr << "Failed to send frame" << std::endl;
        } else {
            std::cout << "Frame sent successfully" << std::endl;
        }
        seq++;
        //std::this_thread::sleep_for(std::chrono::milliseconds(0.1)); // Send a frame every 100ms
    }
}

void threadReceive(HANDLE uart) {
    while (true) {
        std::vector<uint8_t> rx_frame;
        if (uartReceive(uart, rx_frame, 108)) { 
            if (checkFrame(rx_frame)) {
                uint16_t seq = (uint16_t)rx_frame[2] | ((uint16_t)rx_frame[3] << 8);
                std::cout << "[RECV] Valid Frame #" << seq << " received!" << std::endl;
            } else {
                std::cout << "[RECV] CRC Error or Invalid Header" << std::endl;
            }
        } else {
            std::cout << "[RECV] Timeout/Error - Waiting for data..." << std::endl;
        }
    }
}

int main() {
    HANDLE uart = initUART("\\\\.\\COM5", 921600);
    if (uart == INVALID_HANDLE_VALUE) {
        return -1;
    }

    std::thread sender(threadSend, uart);
    std::thread receiver(threadReceive, uart);

    sender.join();
    receiver.join();

    CloseHandle(uart);
    return 0;
}
