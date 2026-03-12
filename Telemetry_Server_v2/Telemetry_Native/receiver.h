#pragma once

#ifdef TELEMETRYNATIVE_EXPORTS
#define TELEMETRY_API __declspec(dllexport)
#else
#define TELEMETRY_API __declspec(dllimport)
#endif // !TELEMETRYNATIVE_EXPORTS

extern "C" TELEMETRY_API int startServer();
extern "C" TELEMETRY_API int stopServer();
extern "C" TELEMETRY_API int getLastData(unsigned char* buffer, int maxSize, unsigned int* version);


