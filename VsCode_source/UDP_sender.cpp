#include <iostream>
#include <winsock2.h>
#include <ws2tcpip.h>
#include <windows.h>
#include <cstdint>
#include <cmath>
#include <vector>
#include <random>

#pragma comment(lib, "ws2_32.lib")

#pragma pack(push, 1)
struct PAYLOAD {
    uint16_t lapCounter;
    uint16_t distance;
    uint16_t speed;
    uint16_t steering;
    uint16_t throttle;
};
#pragma pack(pop)

const uint32_t POLYMINAl = 0xEDB88320u;
const uint8_t LEN_PAYLOAD = sizeof(PAYLOAD); 

// Calculating CRC of data and then packaging in Frame
uint32_t crc32(const uint8_t data[], size_t length) {
    uint32_t crc = 0xFFFFFFFF;
    for (size_t i = 0; i < length; i++) {
        crc = crc ^ data[i];
        for (int j = 0; j < 8; j++) {
            if (crc & 1) {
                crc = (crc >> 1) ^ POLYMINAl;
            }
            else crc = (crc >> 1);
        }
    }
    return crc ^ 0xFFFFFFFFu;
}

// Separating crc32 into 4 bytes and adding into Frame (TRANS task)
void unpack_crc32_lte(const uint32_t crc, uint8_t* buffer) {
    buffer[0] = crc & 0xFF;
    buffer[1] = (crc >> 8) & 0xFF;
    buffer[2] = (crc >> 16) & 0xFF;
    buffer[3] = (crc >> 24) & 0xFF;
}

// Creating frame for sending: (2 header | 2 seq | 100 payload | 4 crc) = 108 bytes
void createFrame(std::vector<uint8_t>& frame, const uint32_t seq) {
    frame.clear();
    const uint8_t Header1 = 0xAA;
    const uint8_t Header2 = 0x55;

    frame.push_back(Header1);
    frame.push_back(Header2);
    frame.push_back((uint8_t)(seq & 0xFF));
    frame.push_back((uint8_t)((seq >> 8) & 0xFF));
    frame.push_back((uint8_t)((seq >> 16) & 0xFF)); // Little Endian: LS byte send first
    frame.push_back((uint8_t)LEN_PAYLOAD); // Payload length
    double t = GetTickCount64() / 1000.0;
    PAYLOAD s;
    
    s.lapCounter = (uint16_t)(seq % 1000);
    s.distance = (uint16_t)(1000 + 100 * std::sin(t));
    s.speed = (uint16_t)(200 + 50 * std::sin(t));
    s.steering = (uint16_t)(500 + 200 * std::sin(t * 2));
    s.throttle = (uint16_t)(800 + 200 * std::cos(t)); // 80.0

    // Little Endian: LSB send first, MSB send last
    frame.push_back(s.lapCounter & 0xFF);
    frame.push_back((s.lapCounter >> 8) & 0xFF);
    frame.push_back(s.distance & 0xFF);
    frame.push_back((s.distance >> 8) & 0xFF);
    frame.push_back(s.speed & 0xFF);
    frame.push_back((s.speed >> 8) & 0xFF);
    frame.push_back(s.steering & 0xFF);
    frame.push_back((s.steering >> 8) & 0xFF);
    frame.push_back(s.throttle & 0xFF);
    frame.push_back((s.throttle >> 8) & 0xFF);

    uint32_t crc = crc32(&frame[0], LEN_PAYLOAD + 4);
    uint8_t crcBytes[4];
    unpack_crc32_lte(crc, crcBytes);
    frame.insert(frame.end(), crcBytes, crcBytes + 4);
    // Now frame contains the complete data to be sent over UART    
}

int sendUdpLoop(const char* ip, uint16_t port, int periodMs)
{
    WSADATA wsaData{};
    if (WSAStartup(MAKEWORD(2, 2), &wsaData) != 0) {
        std::cerr << "WSAStartup failed: " << WSAGetLastError() << std::endl;
        return -1;
    }

    SOCKET sock = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);
    if (sock == INVALID_SOCKET) {
        std::cerr << "Socket creation failed: " << WSAGetLastError() << std::endl;
        WSACleanup();
        return -1;
    }

    sockaddr_in addr{};
    addr.sin_family = AF_INET;
    addr.sin_port = htons(port);

    if (inet_pton(AF_INET, ip, &addr.sin_addr) != 1) {
        std::cerr << "inet_pton failed" << std::endl;
        closesocket(sock);
        WSACleanup();
        return -1;
    }

    std::cout << "Sending UDP telemetry to " << ip << ":" << port << std::endl;


    uint24_t seq = 0;
    while (seq < 100000) {
        std::vector<uint8_t> frame;
        createFrame(frame, seq);
        int sendResult = sendto(
            sock,
            reinterpret_cast<const char*>(frame.data()),
            (int)frame.size(),
            0,
            reinterpret_cast<sockaddr*>(&addr),
            sizeof(addr)
        );

        if (sendResult == SOCKET_ERROR) {
            std::cerr << "sendto failed: " << WSAGetLastError() << std::endl;
            closesocket(sock);
            WSACleanup();
            return -1;
        }

        std::cout << "Sent frame #" << seq << std::endl;

        seq++;
        Sleep(periodMs);
    }

    closesocket(sock);
    WSACleanup();
    return 0;
}

int main()
{
    const char targetIP[] = "10.101.201.251";   // nếu app WPF chạy cùng máy
    uint16_t targetPort = 5000;

    sendUdpLoop(targetIP, targetPort, 50); // gửi mỗi 50 ms
    return 0;
}