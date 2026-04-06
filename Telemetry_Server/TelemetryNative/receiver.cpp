#include "pch.h"
#include <stdio.h>
#include <iostream>
#include <vector>
#include <winsock2.h>
#include <ws2tcpip.h>
#include <windows.h>
#include <thread>
#include <atomic>
#include <mutex>

#define TELEMETRYNATIVE_EXPORTS
#include "receiver.h"
#pragma comment(lib, "Ws2_32.lib")


static std::atomic<bool> running(false);
static std::thread udpThread;
static std::atomic<unsigned int> version(0);

static std::vector<uint8_t> _data;
static std::mutex dataMutex;

static SOCKET g_sock = INVALID_SOCKET;
static std::mutex g_sockMutex;

int LEN_FRAME = 16;

uint32_t crc32(const uint8_t data[], size_t length) {
	uint32_t crc = 0xFFFFFFFF;
	for (size_t i = 0; i < length; i++) {
		crc ^= data[i];
		for (int j = 0; j < 8; j++) {
			if (crc & 1) {
				crc = (crc >> 1) ^ 0xEDB88320;
			}
			else {
				crc >>= 1;
			}
		}
	}
	return crc ^ 0xFFFFFFFFu;
}

// Merging 4 byte crc32 from Frame (RECV task)
uint32_t pack_crc32_lte(const uint8_t* buffer) {
	return ((uint32_t)buffer[0] |
		(uint32_t)buffer[1] << 8 |
		(uint32_t)buffer[2] << 16 |
		(uint32_t)buffer[3] << 24
		);
}

bool checkFrame(const std::vector<uint8_t>& recvFrame, uint8_t length) {
	if (recvFrame.size() != LEN_FRAME) return false;
	uint32_t crc_rx = pack_crc32_lte(&recvFrame[12]);
	uint32_t crc_calc = crc32(&recvFrame[0], 12);
	return (crc_rx == crc_calc);
}

bool UnpackFrame(const uint8_t recvData[], int len) {
	enum State { WAIT_H1, WAIT_H2, RECEIVE_SEQ_LEN ,RECEIVE_PAYLOAD_CRC };
	static State state = WAIT_H1;
	static std::vector<uint8_t> fullFrame;
	uint8_t length = 0;
	size_t frameSize = 0;
	static int bad = 0;
	static int good = 0;
	bool foundGoodFrame = false;
	for (int i = 0; i < len; i++) {
		uint8_t b = recvData[i];
		switch (state) {
		case WAIT_H1:
			if (b == 0xAA) {
				fullFrame.clear();
				fullFrame.push_back(b);
				state = WAIT_H2;
			}
			break;
		case WAIT_H2:
			if (b == 0x55) {
				fullFrame.push_back(b);
				state = RECEIVE_SEQ_LEN;
			}
			else if (b == 0xAA) {
				fullFrame.clear();
				fullFrame.push_back(b);
			}
			else state = WAIT_H1;
			break;
		
		case RECEIVE_SEQ_LEN:
			fullFrame.push_back(b);
			if (fullFrame.size() == 5) {
				length = fullFrame[4];
				state = RECEIVE_PAYLOAD_CRC;
				frameSize = 2 + 2 + 1 + (size_t)length + 4;
			};
			break;

		case RECEIVE_PAYLOAD_CRC:
			fullFrame.push_back(b);
			if (fullFrame.size() == frameSize) {
				if (checkFrame(fullFrame, length)) {
					{
						std::lock_guard<std::mutex> lock(dataMutex);
						_data.assign(fullFrame.begin() + 5, fullFrame.begin() + 5 + length);
						version.fetch_add(1, std::memory_order_relaxed);
					}
					good++;
					uint16_t seq = (uint16_t)fullFrame[2] | ((uint16_t)fullFrame[3] << 8);
					//std::cout << "GOODFRAME: " << seq << std::endl;
					foundGoodFrame = true;
				}
				else {
					std::cout << "BADFRAME: " << bad << std::endl;
					bad++;
				}
				state = WAIT_H1;
			}
			break;
		}
	}
	return foundGoodFrame;
}

static void recvDatafromUDP(int port, std::atomic<bool>& running) {
	WSADATA wsa;
	WSAStartup(MAKEWORD(2, 2), &wsa);
	SOCKET sock = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);
	if (sock == INVALID_SOCKET) {
		std::cout << "Error to creating socket" << std::endl;
		WSACleanup();
	}

	{
		std::lock_guard<std::mutex> lock(g_sockMutex);
		g_sock = sock;
	}

	int timeoutMs = 200;
	setsockopt(sock, SOL_SOCKET, SO_RCVTIMEO, (const char*)&timeoutMs, sizeof(timeoutMs));

	sockaddr_in addr{};
	addr.sin_family = AF_INET;
	addr.sin_port = htons(port);
	addr.sin_addr.s_addr = INADDR_ANY;

	if (bind(sock, (sockaddr*)&addr, sizeof(addr)) == SOCKET_ERROR) {
		std::cerr << "Recv ERROR" << std::endl;
		closesocket(sock);
		WSACleanup();
	}
	std::cout << "UDP server is listening on port " << port << "...\n";
	uint8_t buffer[1024];
	while (running.load()) {
		// Creating sender variable to know the IP of sender
		sockaddr_in sender{};
		int senderSize = sizeof(sender);
		int receivedBytes = recvfrom(sock, (char*)buffer, sizeof(buffer), 0, (sockaddr*)&sender, &senderSize);
		if (receivedBytes == SOCKET_ERROR) {
			int err = WSAGetLastError();
			if (err == WSAETIMEDOUT) {
				continue;
			}
			std::cerr << "Recv ERROR: " << err << std::endl;
			continue;
		}
		if (UnpackFrame(buffer, receivedBytes)) {

			char senderIp[INET_ADDRSTRLEN] = {};
			inet_ntop(AF_INET, &sender.sin_addr, senderIp, INET_ADDRSTRLEN);

			//int16_t vel = (int16_t)(_data[0] | (_data[1] << 8));
			//printf("Valid Frame from %s | Vel: %d | Payload: ", senderIp, vel);
			//for (auto b : _data) printf("%02X ", b);
			//printf("\n");
		}
		else {
			std::cout << "Invalid packet received (Size: " << receivedBytes << ")" << std::endl;
		}
	}

	{
		std::lock_guard<std::mutex> lock(g_sockMutex);
		g_sock = INVALID_SOCKET;
	}

	closesocket(sock);
	WSACleanup();
}

extern "C" TELEMETRY_API int startServer() {
	if (running.load()) {
		std::cout << "Server is already running..." << std::endl;
		return 0; // Success
	}
	running = true;
	udpThread = std::thread([&]() {
		recvDatafromUDP(5000, running);
		});
	std::cout << "Server started.\n";
	return 1;
}

extern "C" TELEMETRY_API int stopServer()
{
	if (!running.load()) {
		std::cout << "Server is already stopped.\n";
		return 0;
	}

	running = false;
	{
		std::lock_guard<std::mutex> lock(g_sockMutex);
		if (g_sock != INVALID_SOCKET) {
			closesocket(g_sock);
			g_sock = INVALID_SOCKET;
		}
	}

	if (udpThread.joinable())
		udpThread.join();
	return 1;
}

extern "C" TELEMETRY_API int getLastData(unsigned char* buffer, int maxSize, unsigned int* _version)
{
	std::lock_guard<std::mutex> lock(dataMutex);

	if (_data.empty() || buffer == nullptr || maxSize <= 0)
		return 0;

	int size = (int)((_data.size() < (size_t)maxSize) ? _data.size() : (size_t)maxSize);
	memcpy(buffer, _data.data(), size);

	if (_version != nullptr)
		*_version = version.load(std::memory_order_relaxed);
	return size;
}