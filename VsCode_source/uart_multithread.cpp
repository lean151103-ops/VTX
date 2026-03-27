// Multi-threaded UART_loopback with fixed LENGTH payload
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
#include <mutex>
#include <fstream>
#include <ctime>

const uint32_t POLYMINAl = 0xEDB88320u;
std::mutex uartMutex; // Mutex to protect UART access in multi-threaded environment
std::mutex logMutex;

struct logRow {
    std::string direction;
    int seq;
    bool valid;
    int badFrameCount;
    std::string note;
};

std::vector<logRow> g_logs;
std::atomic<int> badFrame{0};

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

// ================= Time + CSV Log =================
std::string csvEscape(const std::string& s) {
    std::string out = "\"";
    for (char c : s) {
        if (c == '"') {
            out += "\"\"";
        } else {
            out += c;
        }
    }
    out += "\"";
    return out;
}

void addLogRow(const char* direction, int seq, bool valid, int badCnt, const std::string& note) {
    std::lock_guard<std::mutex> lock(logMutex);
    g_logs.push_back(logRow{ direction, seq, valid, badCnt, note });
}

bool saveLogsToCSV(const char* filename) {
    std::ofstream out(filename, std::ios::out | std::ios::trunc);
    if (!out.is_open()) {
        return false;
    }

    out << "Direction,Seq,Valid,BadFrameCount,Note\n";

    std::lock_guard<std::mutex> lock(logMutex);
    for (const auto& r : g_logs) {
        out << csvEscape(r.direction) << ","
            << r.seq << ","
            << csvEscape(r.valid ? "OK" : "FAIL") << ","
            << r.badFrameCount << ","
            << csvEscape(r.note) << "\n";
    }

    out.close();
    return true;
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

    for (int i = 0; i < LEN_PAYLOAD; i++) {
        frame.push_back((uint8_t)i);
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
    DWORD bytesWritten = 0;
    // std::lock_guard<std::mutex> lock(uartMutex);
    return WriteFile(hSerial, data, len, &bytesWritten, NULL) && (bytesWritten == len);
}

bool uartReadByte(HANDLE hSerial, uint8_t& byte) {
    DWORD bytesRead = 0;

    while (true) {
        bool success;
        // {
        //     std::lock_guard<std::mutex> lock(uartMutex);
            success = ReadFile(hSerial, &byte, 1, &bytesRead, NULL);
        // }

        if (!success) return false;
        if (bytesRead == 1) return true;

        std::this_thread::yield();
    }
}

bool uartReceiveFrame(HANDLE hSerial, std::vector<uint8_t>& frame) {
    enum State {
        WAIT_H1,
        WAIT_H2,
        RECEIVE_REST
    };

    State state = WAIT_H1;
    uint8_t b = 0;

    frame.clear();

    while (true) {
        if (!uartReadByte(hSerial, b)) {
            return false;
        }

        switch (state) {
            case WAIT_H1:
                if (b == 0xAA) {
                    frame.clear();
                    frame.push_back(b);
                    state = WAIT_H2;
                }
                break;

            case WAIT_H2:
                if (b == 0x55) {
                    frame.push_back(b);
                    state = RECEIVE_REST;
                } else if (b == 0xAA) {
                    frame.clear();
                    frame.push_back(b);
                    state = WAIT_H2;
                } else {
                    frame.clear();
                    state = WAIT_H1;
                }
                break;

            case RECEIVE_REST:
                frame.push_back(b);

                if (frame.size() == 108) {
                    if (checkFrame(frame)) {
                        return true;
                    } else {
                        // CRC sai hoặc frame hỏng -> resync từ đầu
                        int seqBad = -1;
                        if (frame.size() >= 4) {
                            seqBad = (int)frame[2] | ((int)frame[3] << 8);
                        }
                        int curBad = ++badFrame;
                        badFrame++;
                        std::cout << "[RECV] Bad frame count = " << badFrame << std::endl;
                        addLogRow("RX", seqBad, false, curBad, "Bad frame / CRC error");
                        frame.clear();
                        state = WAIT_H1;
                    }
                }
                break;
        }
    }
}

void threadSend(HANDLE uart) {
    LARGE_INTEGER freq, now;
    QueryPerformanceFrequency(&freq);

    const int FRAME_BITS = 108 * 10;
    const int BAUDRATE   = 910000;

    const int64_t ticks_num = (int64_t)freq.QuadPart * FRAME_BITS;
    const int64_t ticks_int = ticks_num / BAUDRATE;
    const int64_t ticks_rem = ticks_num % BAUDRATE;

    uint16_t seq = 0;

    QueryPerformanceCounter(&now);
    int64_t next_tick = now.QuadPart;
    int64_t rem_acc = 0;

    while (seq < 50000) {
        QueryPerformanceCounter(&now);
        int64_t remain = next_tick - now.QuadPart;

        if (remain <= 0) {
            std::vector<uint8_t> tx_frame;
            createFrame(tx_frame, seq);

            if (!uartSend(uart, tx_frame.data(), (uint32_t)tx_frame.size())) {
                std::cerr << "Failed to send frame #" << seq << std::endl;
                break;
            }

            if (seq == 10000 || seq == 20000 || seq == 30000 || seq == 40000) {
                std::cout << "Sent frame #" << seq << std::endl;
            }

            seq++;

            next_tick += ticks_int;
            rem_acc += ticks_rem;
            if (rem_acc >= BAUDRATE) {
                next_tick += 1;
                rem_acc -= BAUDRATE;
            }
        }
        //else {
        //     if (remain > freq.QuadPart / 1000) {   // > ~1 ms
        //         Sleep(1);
        //     } else {
        //         SwitchToThread();
        //     }
        // }
    }
}

// // threadSend_v1
// void threadSend(HANDLE uart) {
//     uint16_t seq = 0;
//     while (seq < 50000) {
//         std::vector<uint8_t> tx_frame;
//         createFrame(tx_frame, seq);

//         if (!uartSend(uart, tx_frame.data(), (uint32_t)tx_frame.size())) {
//             std::cerr << "Failed to send frame #" << seq << std::endl;
//             break;
//         }
//         if (seq == 10000 || seq == 20000 || seq == 30000 || seq == 40000) {
//             std::cout << "Sent frame #" << seq << std::endl;
//         }
//         std::cout << "Sent frame #" << seq << std::endl;
//         seq++;
//         std::this_thread::sleep_for(std::chrono::milliseconds(1));
//     }
// }

void threadReceive(HANDLE uart) {
    while (true) {
        std::vector<uint8_t> rx_frame;
        bool ok_frameRecv = uartReceiveFrame(uart, rx_frame);

        if (!ok_frameRecv) {
            std::cout << "[RECV] UART read error." << std::endl;
            break;
        }

        uint16_t seq = (uint16_t)rx_frame[2] | ((uint16_t)rx_frame[3] << 8);

        // if (seq == 10000 || seq == 20000 || seq == 30000 || seq == 40000) {
        //     std::cout << "Received valid frame #" << seq << std::endl;
        // }
        addLogRow("RX", seq, true, badFrame.load(), "Received valid frame");
        std::cout << "Received valid frame #" << seq << std::endl;
        if (seq == 49999) {
            std::cout << "Received last expected frame #" << seq << ". Stopping receiver." << std::endl;
            break;
        }
    }
}

int main() {
    HANDLE uart = initUART("\\\\.\\COM9", 921600);
    if (uart == INVALID_HANDLE_VALUE) {
        return -1;
    }

    std::thread sender(threadSend, uart);
    std::thread receiver(threadReceive, uart);

    sender.join();
    receiver.join();

    if (saveLogsToCSV("uart_log7.csv")) {
        std::cout << "Saved CSV log: uart_log.csv" << std::endl;
    } else {
        std::cout << "Failed to save CSV log." << std::endl;
    }

    CloseHandle(uart);
    return 0;
}