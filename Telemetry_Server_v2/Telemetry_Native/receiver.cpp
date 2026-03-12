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

static std::vector<uint8_t> data;
static std::mutex dataMutex;

static SOCKET g_sock = INVALID_SOCKET;
static std::mutex g_sockMutex;

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
		{
			std::lock_guard<std::mutex> lock(dataMutex);
			data.assign(buffer, buffer + receivedBytes);
			version.fetch_add(1, std::memory_order_relaxed);
		}
		char senderIp[INET_ADDRSTRLEN] = {};
		inet_ntop(AF_INET, &sender.sin_addr, senderIp, INET_ADDRSTRLEN);
		std::cout << "Received " << receivedBytes
			<< " bytes from " << senderIp
			<< ":" << ntohs(sender.sin_port) << " -> ";

		for (int i = 0; i < receivedBytes; i++)
		{
			printf("%02X ", data[i]);
		}
		std::cout << std::endl;
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

	if (data.empty() || buffer == nullptr || maxSize <= 0)
		return 0;

	int size = (int)((data.size() < (size_t)maxSize) ? data.size() : (size_t)maxSize);
	memcpy(buffer, data.data(), size);

	if (_version != nullptr)
		*_version = version.load(std::memory_order_relaxed);
	return size;
}

