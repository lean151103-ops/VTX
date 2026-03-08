#include <iostream>
#include <winsock2.h>
#include <ws2tcpip.h>
#include <windows.h>
#include <cstdint>

#pragma comment(lib, "ws2_32.lib")

int sendUdpLoop(const char* ip, uint16_t port, const char* data, int length, int periodMs)
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

    while (true) {
        int sendResult = sendto(
            sock,
            data,
            length,
            0,
            (sockaddr*)&addr,
            sizeof(addr)
        );

        if (sendResult == SOCKET_ERROR) {
            std::cerr << "sendto failed: " << WSAGetLastError() << std::endl;
            closesocket(sock);
            WSACleanup();
            return -1;
        }

        std::cout << "Sent " << sendResult << " bytes to "
                  << ip << ":" << port << std::endl;

        Sleep(periodMs);
    }

    closesocket(sock);
    WSACleanup();
    return 0;
}

int main()
{
    const char targetIP[] = "192.168.100.127";
    uint16_t targetPort = 5000;
    uint8_t frame[] = {0xAA, 0x55, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08}; // Example frame data

    sendUdpLoop(targetIP, targetPort, (const char*)frame, sizeof(frame), 100);

    return 0;
}