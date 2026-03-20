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
std::atomic<bool> keepRunning(true);

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
        std::cout << "Open COM failed. Error: " << GetLastError() << std::endl;
        system("pause");
        return INVALID_HANDLE_VALUE;
    }
    else
    {
        std::cout << "COM opened successfully\n";
    }
    uint8_t testData[1000];
    memset(testData, 0xAA, 1000); // Dien du lieu test
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
    timeouts.ReadTotalTimeoutConstant = 0;
    timeouts.ReadTotalTimeoutMultiplier = 0;
    SetCommTimeouts(hSerial, &timeouts);
    return hSerial;
}

uint32_t crc32(const uint8_t data[], size_t length) {
    uint32_t crc = 0xFFFFFFFF;
    for (size_t i = 0; i < length; i++) {
        crc = crc ^ data[i];
        for (int j = 0; j < 8; j++) {
            if (crc & 1) crc = (crc >> 1) ^ POLYMINAl;
            else crc = (crc >> 1);
        }
    }
    return crc ^ 0xFFFFFFFFu;
}

void unpack_crc32_lte(const uint32_t crc, uint8_t* buffer) {
    buffer[0] = crc & 0xFF;
    buffer[1] = (crc >> 8) & 0xFF;
    buffer[2] = (crc >> 16) & 0xFF;
    buffer[3] = (crc >> 24) & 0xFF;
}

uint32_t pack_crc32_lte(const uint8_t* buffer) {
    return ((uint32_t)buffer[0] |
            (uint32_t)buffer[1] << 8 |
            (uint32_t)buffer[2] << 16 |
            (uint32_t)buffer[3] << 24);
}

void createFrame(std::vector<uint8_t>& frame, const uint16_t seq) {
    frame.clear();
    const int LEN_PAYLOAD = 100;
    frame.push_back(0xAA);
    frame.push_back(0x55);
    frame.push_back((uint8_t)(seq & 0xFF));
    frame.push_back((uint8_t)((seq >> 8) & 0xFF));
    for (int i = 0; i < LEN_PAYLOAD; i++) {
        frame.push_back((uint8_t)i);
    }
    uint32_t crc = crc32(&frame[0], 2 + 2 + LEN_PAYLOAD);
    uint8_t crcBytes[4];
    unpack_crc32_lte(crc, crcBytes);
    frame.insert(frame.end(), crcBytes, crcBytes + 4);
}

bool checkFrame(const std::vector<uint8_t>& recvFrame) {
    const int LEN_PAYLOAD = 100;
    if (recvFrame.size() != 108) return false;
    if (recvFrame[0] != 0xAA || recvFrame[1] != 0x55) return false;
    uint32_t crc_rx = pack_crc32_lte(&recvFrame[104]);
    uint32_t crc_calculated = crc32(&recvFrame[0], 104);
    return (crc_rx == crc_calculated);
}

void threadSend(HANDLE uart) {
    LARGE_INTEGER freq, now;
    QueryPerformanceFrequency(&freq);

    constexpr int BAUDRATE = 921600;
    constexpr int FRAME_SIZE = 108;
    // Tính toán số tick cần thiết cho 1 frame (108 byte * 10 bit/byte)
    double secondsPerFrame = (double)(FRAME_SIZE * 10) / BAUDRATE;
    int64_t ticksPerFrame = (int64_t)(secondsPerFrame * freq.QuadPart);

    uint16_t seq = 0;
    LARGE_INTEGER start;
    QueryPerformanceCounter(&start);
    int64_t nextTick = start.QuadPart;

    std::cout << "[SENDER] Starting...\n";
    while (seq < 50000) {
        QueryPerformanceCounter(&now);
        if (now.QuadPart >= nextTick) {
            std::vector<uint8_t> tx_frame;
            createFrame(tx_frame, seq);

            DWORD bytesWritten = 0;
            bool ok = WriteFile(uart, tx_frame.data(), (DWORD)tx_frame.size(), &bytesWritten, NULL);

            if (!ok) {
                std::cerr << "Error writing to UART\n";
            } else if (bytesWritten != tx_frame.size()) {
                std::cerr << "Partial write to UART\n";
            }
            if (seq % 5000 == 0) std::cout << "Sent: " << seq << "\n";
            
            seq++;
            nextTick += ticksPerFrame;
        } else {
            // Nếu còn xa deadline thì nhường CPU một chút
            if (nextTick - now.QuadPart > freq.QuadPart / 1000) Sleep(1);
            else SwitchToThread();
        }
    }
    std::cout << "[SENDER] Done 50000 frames.\n";
    // std::this_thread::sleep_for(std::chrono::milliseconds(200)); // Đợi nốt dữ liệu về
    keepRunning = false;
}

void threadReceive(HANDLE uart) {
    std::vector<uint8_t> readBuffer(4096);
    std::vector<uint8_t> currentFrame;
    currentFrame.reserve(108);
    
    enum State { WAIT_H1, WAIT_H2, RECEIVE_REST };
    State state = WAIT_H1;
    int bad = 0;
    int good = 0;

    while (keepRunning) {
        DWORD bytesRead = 0;
        if (ReadFile(uart, readBuffer.data(), (DWORD)readBuffer.size(), &bytesRead, NULL) && bytesRead > 0) {
            for (DWORD i = 0; i < bytesRead; i++) {
                uint8_t b = readBuffer[i];
                switch (state) {
                    case WAIT_H1:
                        if (b == 0xAA) {
                            currentFrame.clear();
                            currentFrame.push_back(b);
                            state = WAIT_H2;
                        }
                        break;
                    case WAIT_H2:
                        if (b == 0x55) {
                            currentFrame.push_back(b);
                            state = RECEIVE_REST;
                        } else if (b == 0xAA) {
                            currentFrame.clear();
                            currentFrame.push_back(b);
                        } else {
                            state = WAIT_H1;
                        }
                        break;
                    case RECEIVE_REST:
                        currentFrame.push_back(b);
                        if (currentFrame.size() == 108) {
                            if (checkFrame(currentFrame)) {
                                good++;
                                uint16_t seq = (uint16_t)currentFrame[2] | ((uint16_t)currentFrame[3] << 8);
                                // if (good % 1000 == 0)
                                // {
                                //     std::cout << "OK frames: " << good << "Sequence: " << seq << "\n";
                                // }
                            } else {
                                bad++;
                                std::cout << "\nBAD FRAME: " << bad << "\n";
                            }
                            state = WAIT_H1;
                        }
                        break;
                }
            }
        }
    }
}

int main() {
    HANDLE uart = initUART("\\\\.\\COM9", 921600);
    if (uart == INVALID_HANDLE_VALUE) return -1;

    std::thread sender(threadSend, uart);
    std::thread receiver(threadReceive, uart);

    sender.join();
    receiver.join();

    CloseHandle(uart);
    return 0;
}