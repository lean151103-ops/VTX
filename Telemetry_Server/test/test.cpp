#include <stdio.h>
#include <iostream>
#include <vector>
//#include "receiver.h"
#include <winsock2.h>
#include <ws2tcpip.h>
#include <windows.h>
#include <thread>
#include <atomic>

#pragma comment(lib, "Ws2_32.lib")
//#define TELEMETRYNATIVE_EXPORTS

std::vector<uint8_t> recvDatafromUDP(int port, std::atomic<bool>& running) {
	std::vector<uint8_t> data;
	WSADATA wsa;
	WSAStartup(MAKEWORD(2, 2), &wsa);
	SOCKET sock = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);
	if (sock == INVALID_SOCKET) {
		std::cout << "Error to creating socket" << std::endl;
		WSACleanup();
		return data;
	}
	int timeoutMs = 5000;
	setsockopt(sock, SOL_SOCKET, SO_RCVTIMEO, (const char*)&timeoutMs, sizeof(timeoutMs));
	sockaddr_in addr{};
	addr.sin_family = AF_INET;
	addr.sin_port = htons(port);
	addr.sin_addr.s_addr = INADDR_ANY;
	if (bind(sock, (sockaddr*)&addr, sizeof(addr)) == SOCKET_ERROR) {
		std::cerr << "Recv ERROR" << std::endl;
		closesocket(sock);
		WSACleanup();
		return data;
	}
	std::cout << "UDP server is listening on port " << port << "...\n";
	uint8_t buffer[1024];
	while (running) {
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
		data.assign(buffer, buffer + sizeof(buffer));
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
	closesocket(sock);
	WSACleanup();
	return data;
}

int main() {
	std::atomic<bool> running(true);
	std::thread udpThread([&]() {
		recvDatafromUDP(5000, running);
		});
	std::cout << "Nhan Enter de dung server...\n";
	std::cin.get();

	running = false;

	if (udpThread.joinable())
	{
		udpThread.join();
	}

	std::cout << "Server stopped.\n";
	return 0;
}



//extern "C" TELEMETRY_API int startServer() {
//
//}
//
//extern "C" TELEMETRY_API int stopServer() {
//}


