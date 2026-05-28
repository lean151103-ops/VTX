// Updating multiple clients but not completed 
#include "pch.h"
#include <stdio.h>
#include <iostream>
#include <vector>
//#include <winsock2.h>
//#include <ws2tcpip.h>
#include <windows.h>
#include <thread>
#include <atomic>
#include <mutex>
#include <unordered_map>
#include <string>
#include <queue>

#define TELEMETRYNATIVE_EXPORTS
#include "receiver.h"
#pragma comment(lib, "Ws2_32.lib")

// ─────────────────────────────────────────────
//  CONFIG UART
// ─────────────────────────────────────────────
#define UART_PORT   "COM5"
#define UART_BAUD   115200

static std::atomic<bool> running(false);
static std::thread udpThread;
static std::atomic<unsigned int> version(0);

static std::queue<std::vector<uint8_t>> _dataQueue;
static std::vector<uint8_t> _data;
static std::mutex dataMutex;

static HANDLE g_hSerial = INVALID_HANDLE_VALUE;
static std::mutex g_serialMutex;

struct ClientContext {
	enum State { WAIT_H1, WAIT_H2, RECEIVE_SEQ_LEN, RECEIVE_PAYLOAD_CRC };
	State state = WAIT_H1;
	std::vector<uint8_t> fullFrame;
	uint8_t length = 0;
	size_t frameSize = 0;
	std::vector<uint8_t> lastPayload; 
	unsigned int version = 0;
	ULONGLONG lastSeenTick = 0;
	ULONGLONG lastPacketTick = 0;

	// Tracking sequence numbers for error rate calculation
	uint32_t lastSeq = UINT32_MAX;
	uint64_t totalExpected = 0;
	uint64_t totalLost = 0;
	float    errorRate = 0.0f;
};

static std::unordered_map<std::string, ClientContext> _clientMap; // key = "ip:port"
static std::mutex clientsMutex;

static LARGE_INTEGER g_timerFreq = { 0 };
static bool g_timerInit = false;

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

bool checkFrame(const std::vector<uint8_t>& recvFrame, size_t frameSize) {
	if (recvFrame.size() != frameSize) return false;
	uint32_t crc_rx = pack_crc32_lte(&recvFrame[frameSize - 4]);
	uint32_t crc_calc = crc32(&recvFrame[0], frameSize - 4);
	return (crc_rx == crc_calc);
}

bool UnpackFrame(const uint8_t recvData[], int len, const std::string& clientKey) {
	/*std::lock_guard<std::mutex> lock(clientsMutex);*/
	ClientContext& ctx = _clientMap[clientKey];
	ctx.lastSeenTick = GetTickCount64();
	bool foundGoodFrame = false;
	for (int i = 0; i < len; i++) {
		uint8_t b = recvData[i];
		switch (ctx.state) {
		case ClientContext::WAIT_H1:
			if (b == 0xAA) {
				ctx.fullFrame.clear();
				ctx.fullFrame.push_back(b);
				ctx.state = ClientContext::WAIT_H2;
			}
			break;
		case ClientContext::WAIT_H2:
			if (b == 0x55) {
				ctx.fullFrame.push_back(b);
				ctx.state = ClientContext::RECEIVE_SEQ_LEN;
			}
			else if (b == 0xAA) {
				ctx.fullFrame.clear();
				ctx.fullFrame.push_back(b);
			}
			else ctx.state = ClientContext::WAIT_H1;
			break;

		case ClientContext::RECEIVE_SEQ_LEN:
			ctx.fullFrame.push_back(b);
			if (ctx.fullFrame.size() == 7) {
				ctx.length = ctx.fullFrame[6];
				ctx.state = ClientContext::RECEIVE_PAYLOAD_CRC;
				ctx.frameSize = 2 + 4 + 1 + (size_t)ctx.length + 4; // 2 header + 4 seq + 1 len + payload + 4 crc
			};
			break;

		case ClientContext::RECEIVE_PAYLOAD_CRC:
			ctx.fullFrame.push_back(b);
			if (ctx.fullFrame.size() == ctx.frameSize) {

				uint32_t seq = (uint8_t)ctx.fullFrame[2]
					| ((uint8_t)ctx.fullFrame[3] << 8)
					| ((uint8_t)ctx.fullFrame[4] << 16)
					| ((uint8_t)ctx.fullFrame[5] << 24);

				bool isGood = checkFrame(ctx.fullFrame, ctx.frameSize);

				if (isGood) {
					bool isFirstFrame = (ctx.lastSeq == UINT32_MAX);
					if (!isFirstFrame) {
						uint32_t expectedSeq = ctx.lastSeq + 1;
						if (seq >= expectedSeq) {
							uint32_t lostCount = seq - expectedSeq;
							ctx.totalLost += lostCount;
							ctx.totalExpected += lostCount;
						}
					}
					ctx.lastSeq = seq;
					ctx.totalExpected += 1;
				}
				else {
					ctx.totalExpected += 1;
					ctx.totalLost += 1;
					/*std::cout << "BADFRAME seq: " << seq << std::endl;*/
				}
				ctx.errorRate = (float)ctx.totalLost / (float)ctx.totalExpected;

				if (isGood) {
					std::lock_guard<std::mutex> datalock(dataMutex);
					ctx.lastPayload.assign(ctx.fullFrame.begin() + 7, ctx.fullFrame.begin() + 7 + ctx.length);
					ctx.version++;
					ctx.lastSeenTick = GetTickCount64();

					LARGE_INTEGER nowTickQPC;
					QueryPerformanceCounter(&nowTickQPC);

					uint32_t deltaMs = 0;
					if (ctx.lastPacketTick != 0) {
						ULONGLONG diffTicks = nowTickQPC.QuadPart - ctx.lastPacketTick;
						deltaMs = (uint32_t)((diffTicks * 1000) / g_timerFreq.QuadPart);
					}
					ctx.lastPacketTick = nowTickQPC.QuadPart;

					// Packaging _data: [keyLen][key][payload][errorRate 4 byte][deltaMs 4 byte]
					std::vector<uint8_t> packet;
					uint8_t keyLen = (uint8_t)clientKey.size();
					packet.push_back(keyLen);
					packet.insert(packet.end(), clientKey.begin(), clientKey.end());

					packet.insert(packet.end(), ctx.lastPayload.begin(), ctx.lastPayload.end());

					packet.push_back((ctx.lastSeq >> 0) & 0xFF);
					packet.push_back((ctx.lastSeq >> 8) & 0xFF);
					packet.push_back((ctx.lastSeq >> 16) & 0xFF);
					packet.push_back((ctx.lastSeq >> 24) & 0xFF);

					uint64_t totalExp = ctx.totalExpected;
					packet.push_back((totalExp >> 0) & 0xFF);
					packet.push_back((totalExp >> 8) & 0xFF);
					packet.push_back((totalExp >> 16) & 0xFF);
					packet.push_back((totalExp >> 24) & 0xFF);
					packet.push_back((totalExp >> 32) & 0xFF);
					packet.push_back((totalExp >> 40) & 0xFF);
					packet.push_back((totalExp >> 48) & 0xFF);
					packet.push_back((totalExp >> 56) & 0xFF);

					uint64_t totalLost = ctx.totalLost;
					packet.push_back((totalLost >> 0) & 0xFF);
					packet.push_back((totalLost >> 8) & 0xFF);
					packet.push_back((totalLost >> 16) & 0xFF);
					packet.push_back((totalLost >> 24) & 0xFF);
					packet.push_back((totalLost >> 32) & 0xFF);
					packet.push_back((totalLost >> 40) & 0xFF);
					packet.push_back((totalLost >> 48) & 0xFF);
					packet.push_back((totalLost >> 56) & 0xFF);

					// Append deltaMs (4 byte little-endian)
					packet.push_back((deltaMs >> 0) & 0xFF);
					packet.push_back((deltaMs >> 8) & 0xFF);
					packet.push_back((deltaMs >> 16) & 0xFF);
					packet.push_back((deltaMs >> 24) & 0xFF);

					if (_dataQueue.size() > 500)   
						_dataQueue.pop();
					_dataQueue.push(packet);

					version.fetch_add(1, std::memory_order_relaxed);
					//std::cout << "Received valid frame from " << clientKey
					//	<< " | Payload: " << (int)ctx.length << " bytes"
					//	<< " | ErrorRate: " << ctx.errorRate
					//	<< " | DeltaMs: " << deltaMs << std::endl;   // ← LOG thêm
					foundGoodFrame = true;
				}

				ctx.state = ClientContext::WAIT_H1;
			}
			break;
		}
	}
	return foundGoodFrame;
}

// ─────────────────────────────────────────────
//  Config UART
// ─────────────────────────────────────────────
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

static void recvDataFromUART(const char* port, int baud, std::atomic<bool>& running) {
	HANDLE h = initUART(port, baud);
	if (h == INVALID_HANDLE_VALUE) return;

	{
		std::lock_guard<std::mutex> lock(g_serialMutex);
		g_hSerial = h;
	}
	const std::string ip = std::string(port);
	const int clientPort = 1;
	const std::string clientKey = ip + ":" + std::to_string(clientPort);

	uint8_t buffer[256];

	std::cout << "[UART] Listening on " << port << "...\n";

	while (running.load()) {
		DWORD bytesRead = 0;
		BOOL ok = ReadFile(h, buffer, sizeof(buffer), &bytesRead, NULL);

		if (!ok) {
			std::cerr << "[UART] ReadFile error " << GetLastError() << "\n";
			break;
		}
		if (bytesRead == 0) {
			continue;
		}

		UnpackFrame(buffer, (int)bytesRead, clientKey);
	}
	{
		std::lock_guard<std::mutex> lock(g_serialMutex);
		g_hSerial = INVALID_HANDLE_VALUE;
	}
	CloseHandle(h);
	std::cout << "[UART] Closed " << port << "\n";
}

extern "C" TELEMETRY_API int startServer() {
	if (running.load()) {
		std::cout << "Server is already running..." << std::endl;
		return 0; // Success
	}

	if (!g_timerInit) {
		QueryPerformanceFrequency(&g_timerFreq);
		g_timerInit = true;
	}

	running = true;
	udpThread = std::thread([&]() {
		recvDataFromUART("COM5", 115200, running);
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
	if (udpThread.joinable())
		udpThread.join();
	return 1;
}

extern "C" TELEMETRY_API int getLastData(unsigned char* buffer, int maxSize, unsigned int* _version)
{
	std::lock_guard<std::mutex> lock(dataMutex);

	if (_dataQueue.empty() || buffer == nullptr || maxSize <= 0)
		return 0;

	const auto& front = _dataQueue.front();
	int size = (front.size() < (size_t)maxSize) ? (int)front.size() : maxSize;
	memcpy(buffer, front.data(), size);
	_dataQueue.pop();

	if (_version != nullptr)
		*_version = version.load(std::memory_order_relaxed);
	return size;
}

extern "C" TELEMETRY_API int getActiveClients(int timeoutMs)
{
	std::lock_guard<std::mutex> lock(clientsMutex);
	ULONGLONG now = GetTickCount64();
	int count = 0;
	for (const auto& kv : _clientMap) {
		const ClientContext& ctx = kv.second;
		if ((now - ctx.lastSeenTick) <= (ULONGLONG)timeoutMs) {
			count++;
		}
	}
	return count;
}