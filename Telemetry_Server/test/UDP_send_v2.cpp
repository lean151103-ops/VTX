#include <iostream>
#include <winsock2.h>
#include <ws2tcpip.h>
#include <windows.h>
#include <cstdint>
#include <cmath>
#include <vector>
#include <algorithm>

#pragma comment(lib, "ws2_32.lib")

#pragma pack(push, 1)
struct PAYLOAD {
    uint16_t lapCounter;
    uint32_t lapTime;
    uint16_t distance;   // 0..4999 m
    uint16_t speed;      // km/h
    uint16_t steering;   // encoded 0..1000, 500 = 0 deg
    uint16_t throttle;   // 0..100 <=> 0.0%..100.0%
};
#pragma pack(pop)

const uint32_t POLYMINAl = 0xEDB88320u;
const uint8_t LEN_PAYLOAD = sizeof(PAYLOAD);
const double PI = 3.14159265358979323846;
const double LAP_DISTANCE_M = 5000.0;

// ================= CRC =================
uint32_t crc32(const uint8_t data[], size_t length) {
    uint32_t crc = 0xFFFFFFFFu;
    for (size_t i = 0; i < length; i++) {
        crc ^= data[i];
        for (int j = 0; j < 8; j++) {
            if (crc & 1) crc = (crc >> 1) ^ POLYMINAl;
            else         crc = (crc >> 1);
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

// ================= TABLE MÔ PHỎNG =================
struct SimPoint {
    double time;       // s
    double speed;      // km/h
    double steering;   // degree
};

// Chu kỳ 30 giây, sau đó lặp lại bằng fmod()
static const SimPoint simTable[] = {
    {  0,   0,   0 },
    {  2,  40,   2 },
    {  4,  80,   4 },
    {  6, 120,   6 },
    {  8, 160,   4 },
    { 10, 200,   2 },
    { 12, 240,   1 },
    { 14, 280,   0 },
    { 16, 300,   0 },
    { 18, 260,  -2 },
    { 20, 220,  -5 },
    { 22, 180,  -8 },
    { 24, 140, -10 },
    { 26, 100,  -6 },
    { 28,  60,  -3 },
    { 30,  20,   0 }
};

int getSimTableSize() {
    return static_cast<int>(sizeof(simTable) / sizeof(simTable[0]));
}

SimPoint getInterpolatedPoint(double t) {
    int n = getSimTableSize();

    if (t <= simTable[0].time) return simTable[0];
    if (t >= simTable[n - 1].time) return simTable[n - 1];

    for (int i = 0; i < n - 1; i++) {
        if (t >= simTable[i].time && t <= simTable[i + 1].time) {
            double t0 = simTable[i].time;
            double t1 = simTable[i + 1].time;
            double ratio = (t - t0) / (t1 - t0);

            SimPoint p{};
            p.time = t;
            p.speed = simTable[i].speed +
                      ratio * (simTable[i + 1].speed - simTable[i].speed);
            p.steering = simTable[i].steering +
                         ratio * (simTable[i + 1].steering - simTable[i].steering);
            return p;
        }
    }

    return simTable[n - 1];
}

// ================= HÀM MAP =================

// 0..300 km/h -> 0..100%
uint16_t simulateThrottleFromSpeed(double speedKmh) {
    speedKmh = std::clamp(speedKmh, 0.0, 300.0);
    return static_cast<uint16_t>((speedKmh / 300.0) * 100.0);
}

// map steeringDeg từ khoảng -35..35 sang 0..1000
uint16_t encodeSteering(double steeringDeg) {
    steeringDeg = std::clamp(steeringDeg, -35.0, 35.0);
    double encoded = 500.0 + (steeringDeg / 35.0) * 500.0;
    encoded = std::clamp(encoded, 0.0, 1000.0);
    return static_cast<uint16_t>(encoded);
}

// ================= TRẠNG THÁI MÔ PHỎNG =================
struct SimState {
    double distance = 0.0;       // m, trong 1 lap: 0..4999
    uint16_t lapCounter = 0;
    uint64_t lastTick = 0;
    double LapTime = 0.0;         // s
};

// ================= TẠO FRAME =================
void createFrame(std::vector<uint8_t>& frame, const uint32_t seq, SimState& sim) {
    frame.clear();

    const uint8_t Header1 = 0xAA;
    const uint8_t Header2 = 0x55;

    uint64_t now = GetTickCount64(); // ms
    if (sim.lastTick == 0) sim.lastTick = now;

    double dt = (now - sim.lastTick) / 1000.0; //s
    sim.lastTick = now;
    sim.LapTime += dt; //s

    double t = now / 1000.0; //s
    double tCycle = std::fmod(t, 30.0);

    SimPoint p = getInterpolatedPoint(tCycle);

    double speedKmh = p.speed;
    double steeringDeg = p.steering;
    uint16_t throttle = simulateThrottleFromSpeed(speedKmh);

    double speedMs = speedKmh / 3.6;
    double steeringRad = steeringDeg * PI / 180.0;
    sim.distance += speedMs * std::cos(steeringRad) * dt;

    while (sim.distance >= LAP_DISTANCE_M) {
        sim.distance -= LAP_DISTANCE_M;
        sim.lapCounter++;
        sim.LapTime = 0.0;
    }

    PAYLOAD s{};
    s.lapCounter = sim.lapCounter;
    s.lapTime    = static_cast<uint32_t>(sim.LapTime * 1000.0); // ms
    s.distance   = static_cast<uint16_t>(sim.distance); // m
    s.speed      = static_cast<uint16_t>(speedKmh); // km/h
    s.steering   = encodeSteering(steeringDeg); // Encoded value 0 -> 1000
    s.throttle   = throttle; // 0 -> 100 %

    frame.push_back(Header1);
    frame.push_back(Header2);
    frame.push_back(static_cast<uint8_t>(seq & 0xFF));
    frame.push_back(static_cast<uint8_t>((seq >> 8) & 0xFF));
    frame.push_back(static_cast<uint8_t>((seq >> 16) & 0xFF));
    frame.push_back(static_cast<uint8_t>((seq >> 24) & 0xFF)); 
    frame.push_back(LEN_PAYLOAD);

    frame.push_back(s.lapCounter & 0xFF);
    frame.push_back((s.lapCounter >> 8) & 0xFF);

    frame.push_back(s.lapTime & 0xFF);
    frame.push_back((s.lapTime >> 8) & 0xFF);
    frame.push_back((s.lapTime >> 16) & 0xFF);
    frame.push_back((s.lapTime >> 24) & 0xFF);

    frame.push_back(s.distance & 0xFF);
    frame.push_back((s.distance >> 8) & 0xFF);

    frame.push_back(s.speed & 0xFF);
    frame.push_back((s.speed >> 8) & 0xFF);

    frame.push_back(s.steering & 0xFF);
    frame.push_back((s.steering >> 8) & 0xFF);

    frame.push_back(s.throttle & 0xFF);
    frame.push_back((s.throttle >> 8) & 0xFF);

    // CRC tính trên toàn bộ phần trước CRC
    uint32_t crc = crc32(frame.data(), frame.size());
    uint8_t crcBytes[4];
    unpack_crc32_lte(crc, crcBytes);
    frame.insert(frame.end(), crcBytes, crcBytes + 4);
}

// ================= UDP LOOP =================
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

    uint32_t seq = 0;
    SimState sim;

    while (seq < 100000) {
        std::vector<uint8_t> frame;
        createFrame(frame, seq, sim);

        int sendResult = sendto(
            sock,
            reinterpret_cast<const char*>(frame.data()),
            static_cast<int>(frame.size()),
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

        std::cout
            << "Sent frame #" << seq
            << " | lap=" << sim.lapCounter
            << " | dist=" << sim.distance
            << std::endl;

        seq++;
        Sleep(periodMs);
    }

    closesocket(sock);
    WSACleanup();
    return 0;
}

int main()
{
    const char targetIP[] = "10.101.201.251";
    uint16_t targetPort = 5000;

    sendUdpLoop(targetIP, targetPort, 50);
    return 0;
}