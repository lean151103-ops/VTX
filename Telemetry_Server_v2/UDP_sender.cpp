#include <iostream>
#include <winsock2.h>
#include <ws2tcpip.h>
#include <windows.h>
#include <cstdint>
#include <cmath>

#pragma comment(lib, "ws2_32.lib")

#pragma pack(push, 1)
struct TelemetryPacket
{
    float Velocity;
    float IMT;
    float RPM;
};
#pragma pack(pop)

static_assert(sizeof(TelemetryPacket) == 12, "TelemetryPacket must be 12 bytes");

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

    double t = 0.0;
    const double dt = periodMs / 1000.0;

    while (true) {
        TelemetryPacket pkt{};

        // Velocity: 60 -> 300 km/h
        pkt.Velocity = 180.0f + 120.0f * (float)std::sin(t * 0.7);

        // IMT: 0 -> 100
        pkt.IMT = 50.0f + 50.0f * (float)std::sin(t * 1.3 + 1.0);

        // RPM: bám theo Velocity nhưng có dao động riêng
        pkt.RPM = 8500.0f + 2500.0f * (float)std::sin(t * 0.7)
                        + 500.0f  * (float)std::sin(t * 3.0);

        // Chặn biên cho đẹp
        if (pkt.Velocity < 0.0f) pkt.Velocity = 0.0f;
        if (pkt.IMT < 0.0f) pkt.IMT = 0.0f;
        if (pkt.IMT > 100.0f) pkt.IMT = 100.0f;
        if (pkt.RPM < 0.0f) pkt.RPM = 0.0f;

        int sendResult = sendto(
            sock,
            reinterpret_cast<const char*>(&pkt),
            sizeof(pkt),
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

        std::cout << "Sent "
                  << "Velocity=" << pkt.Velocity
                  << ", IMT=" << pkt.IMT
                  << ", RPM=" << pkt.RPM
                  << std::endl;

        t += dt;
        Sleep(periodMs);
    }

    closesocket(sock);
    WSACleanup();
    return 0;
}

int main()
{
    const char targetIP[] = "192.168.100.127";   // nếu app WPF chạy cùng máy
    uint16_t targetPort = 5000;

    sendUdpLoop(targetIP, targetPort, 50); // gửi mỗi 50 ms
    return 0;
}