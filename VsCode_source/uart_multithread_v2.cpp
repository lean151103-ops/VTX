// Multi-threaded UART-loopback with unfixed length PAYLOAD 
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

const int BAUDRATE = 1500000;
const char PORT[] = "\\\\.\\COM5";

const uint32_t POLYMINAl = 0xEDB88320u;
std::mutex uartMutex; // Mutex to protect UART access in multi-threaded environment
std::mutex logMutex;
std::atomic<long long> g_total_BytesSend{0};
double g_total_time = 0;

struct txLogRow {
    int seq;
    int payloadLength;
    std::string note;
};

struct rxLogRow {
    int seq;
    int payloadLength;
    bool valid;
    int badFrameCount;
    std::string note;
};

std::vector<txLogRow> g_txLogs;
std::vector<rxLogRow> g_rxLogs;
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

void addTxLogRow(int seq, int payloadLength, const std::string& note) {
    std::lock_guard<std::mutex> lock(logMutex);
    g_txLogs.push_back(txLogRow{ seq, payloadLength, note });
}

void addRxLogRow(int seq, int payloadLength, bool valid, int badCnt, const std::string& note) {
    std::lock_guard<std::mutex> lock(logMutex);
    g_rxLogs.push_back(rxLogRow{ seq, payloadLength, valid, badCnt, note });
}

bool saveTxLogsToCSV(const char* filename) {
    std::ofstream out(filename, std::ios::out | std::ios::trunc);
    if (!out.is_open()) return false;

    out << "TX_Direction,TX_Seq,TX_PayloadLength,Note\n";

    {
        std::lock_guard<std::mutex> lock(logMutex);
        for (const auto& r : g_txLogs) {
            out << csvEscape("TX") << ","
                << r.seq << ","
                << r.payloadLength << ","
                << csvEscape(r.note) << "\n";
        }
    }

    double total_sec = g_total_time / 1e6;
    double data_rate_bps = (total_sec > 0) ? (g_total_BytesSend.load()) / total_sec : 0;
    double data_rate_kbps = (total_sec > 0) ? (g_total_BytesSend.load() / 1024.0) / total_sec : 0;

    out << "\n--- SUMMARY ---\n";
    out << "Metric,Value,Unit\n";
    out << "Total Time," << total_sec << ",Seconds\n";
    out << "Total Bytes Sent," << g_total_BytesSend.load() << ",Bytes\n";
    out << "Throughput (byte/s)," << data_rate_bps << ",Bps\n";
    out << "Throughput (KB/s)," << data_rate_kbps << ",KBps\n";
    out << "Total Bad Frames," << badFrame.load() << ",Frames\n";

    out.close();
    return true;
}

bool saveRxLogsToCSV(const char* filename) {
    std::ofstream out(filename, std::ios::out | std::ios::trunc);
    if (!out.is_open()) return false;

    out << "RX_Direction,RX_Seq,RX_PayloadLength,Valid,BadFrameCount,Note\n";

    {
        std::lock_guard<std::mutex> lock(logMutex);
        for (const auto& r : g_rxLogs) {
            out << csvEscape("RX") << ","
                << r.seq << ","
                << r.payloadLength << ","
                << csvEscape(r.valid ? "OK" : "FAIL") << ","
                << r.badFrameCount << ","
                << csvEscape(r.note) << "\n";
        }
    }

    out << "\n--- SUMMARY ---\n";
    out << "Metric,Value,Unit\n";
    out << "Total Bad Frames," << badFrame.load() << ",Frames\n";

    out.close();
    return true;
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
void createFrame(std::vector<uint8_t>& frame, const uint16_t seq, uint8_t LENGTH) {
    frame.clear();
    const uint8_t Header1 = 0xAA;
    const uint8_t Header2 = 0x55;

    frame.push_back(Header1);
    frame.push_back(Header2);
    frame.push_back((uint8_t)(seq & 0xFF));
    frame.push_back((uint8_t)((seq >> 8) & 0xFF));
    frame.push_back(LENGTH);

    // static std::mt19937 rng((unsigned)std::random_device{}());
    // static std::uniform_int_distribution<int> dist(0, 255);

    for (int i = 0; i < LENGTH; i++) {
        frame.push_back((uint8_t)i);
    }
    uint32_t crc = crc32(&frame[0], LENGTH+5);
    uint8_t crcBytes[4];
    unpack_crc32_lte(crc, crcBytes);
    frame.insert(frame.end(), crcBytes, crcBytes + 4);
    // Now frame contains the complete data to be sent over UART    
}

bool uartSend(HANDLE hSerial, const uint8_t* data, uint32_t len) {
    DWORD bytesWritten = 0;
    // std::lock_guard<std::mutex> lock(uartMutex);
    return WriteFile(hSerial, data, len, &bytesWritten, NULL) && (bytesWritten == len);
}

// Checking the received frame for correct header and crc (RECV task)
bool checkFrame(const std::vector<uint8_t>& recvFrame, uint8_t length) {
    size_t frameSize = 2 + 2 + 1 + (size_t)length + 4;
    // if(recvFrame.size() != frameSize) return false;
    // if(recvFrame[0] != 0xAA || recvFrame[1] != 0x55) return false;

    uint32_t crc_rx = pack_crc32_lte(&recvFrame[frameSize - 4]);
    uint32_t crc_calculated = crc32(&recvFrame[0], frameSize - 4);
    if(crc_rx != crc_calculated) return false;
    return true;
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
        RECEIVE_SEQ_LEN,
        RECEIVE_PAYLOAD_CRC
    };

    State state = WAIT_H1;
    uint8_t b = 0;
    uint8_t length = 0;
    size_t frameSize = 0;
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
                    length = 0;
                    state = RECEIVE_SEQ_LEN;
                } else if (b == 0xAA) {
                    frame.clear();
                    frame.push_back(b);
                    state = WAIT_H2;
                } else {
                    frame.clear();
                    state = WAIT_H1;
                }
                break;

            case RECEIVE_SEQ_LEN:
                frame.push_back(b);
                if(frame.size()==5) {
                    length = frame[4];
                    state = RECEIVE_PAYLOAD_CRC;
                    frameSize = 2 + 2 + 1 + (size_t)length + 4;
                };
                break;

            case RECEIVE_PAYLOAD_CRC:
                frame.push_back(b);

                if (frame.size() == frameSize) {
                    if (checkFrame(frame, length)) {
                        return true;
                    } else {
                        // CRC sai hoặc frame hỏng -> resync từ đầu
                        int seqBad = -1;
                        if (frame.size() >= 4) {
                            seqBad = (int)frame[2] | ((int)frame[3] << 8);
                        }
                        badFrame++;
                        std::cout << "[RECV] Bad frame count = " << badFrame << std::endl;
                        addRxLogRow(seqBad, length, false, badFrame.load(), "Bad frame / CRC error");
                        frame.clear();
                        state = WAIT_H1;
                    }
                }
                break;
        }
    }
}

void threadSend(HANDLE uart) {
    LARGE_INTEGER freq, now, start, last;
    QueryPerformanceFrequency(&freq);

    const int64_t guard_ticks = (int64_t)((double)freq.QuadPart* 10.0/ 1000000.0);
    int64_t rem_acc = 0;

    uint16_t seq = 0;
    static uint8_t length = 100;

    QueryPerformanceCounter(&now);
    int64_t next_tick = now.QuadPart;
    QueryPerformanceCounter(&start);

    while (seq < 5000) {
        QueryPerformanceCounter(&now);
        int64_t remain = next_tick - now.QuadPart;

        if (remain <= 0) {
            std::vector<uint8_t> tx_frame;
            createFrame(tx_frame, seq, length);

            if (!uartSend(uart, tx_frame.data(), (uint32_t)tx_frame.size())) {
                std::cerr << "Failed to send frame #" << seq << std::endl;
                break;
            }

            addTxLogRow(seq, length, "Frame sent");

            //TIMING 
            int frame_byte = tx_frame.size();
            g_total_BytesSend += frame_byte;
            int frame_bits = frame_byte*10;
            int64_t ticks_per_frame = (int64_t)freq.QuadPart * frame_bits / BAUDRATE;
            int64_t tick_rem = (int64_t)freq.QuadPart * frame_bits % BAUDRATE;
            seq++;
            length++;

            if(length >= 200) {
                length = 100;
            }

            next_tick = now.QuadPart + ticks_per_frame + guard_ticks;
            rem_acc += tick_rem;
            if (rem_acc >= BAUDRATE) {
                next_tick += 1;
                rem_acc -= BAUDRATE;
            } 
        }
        else {
            if (remain > freq.QuadPart / 1000) {   
                Sleep(0.01);
            } else {
                SwitchToThread();
            }
        }
    }
    QueryPerformanceCounter(&last);
    g_total_time = (double)(last.QuadPart - start.QuadPart)*1e6 / (double)freq.QuadPart;
}

void threadReceive(HANDLE uart) {
    while (true) {
        std::vector<uint8_t> rx_frame;
        bool ok_frameRecv = uartReceiveFrame(uart, rx_frame);

        if (!ok_frameRecv) {
            std::cout << "[RECV] UART read error." << std::endl;
            break;
        }

        uint16_t seq = (uint16_t)rx_frame[2] | ((uint16_t)rx_frame[3] << 8);
        uint8_t payloadLength = rx_frame[4];

        addRxLogRow(seq, payloadLength, true, badFrame.load(), "Received valid frame");
        std::cout << "Received valid frame #" << seq << std::endl;
        if (seq == 4999) {
            std::cout << "Received last expected frame #" << seq << ". Stopping receiver." << std::endl;
            break;
        }
    }
}

int main() {
    HANDLE uart = initUART(PORT, BAUDRATE);
    if (uart == INVALID_HANDLE_VALUE) {
        return -1;
    }

    std::thread sender(threadSend, uart);
    std::thread receiver(threadReceive, uart);

    sender.join();
    receiver.join();

    if (saveTxLogsToCSV("tx_log.csv")) {
        std::cout << "Saved TX CSV log: tx_log.csv" << std::endl;
    } else {
        std::cout << "Failed to save TX CSV log." << std::endl;
    }

    if (saveRxLogsToCSV("rx_log.csv")) {
        std::cout << "Saved RX CSV log: rx_log.csv" << std::endl;
    } else {
        std::cout << "Failed to save RX CSV log." << std::endl;
    }

    CloseHandle(uart);
    return 0;
}