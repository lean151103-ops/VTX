using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Runtime.InteropServices;
using System.Text;

namespace GND_server.Services
{
    class TelemetryNativeService
    {
        private const int BufferSize = 1024;
        private static class NativeMethods
        {
            [DllImport("TelemetryNative.dll", CallingConvention = CallingConvention.Cdecl)]
            public static extern int StartServer();

            [DllImport("TelemetryNative.dll", CallingConvention = CallingConvention.Cdecl)]
            public static extern int EndServer();
            [DllImport("TelemetryNative.dll", CallingConvention = CallingConvention.Cdecl)]
            public static extern int getLastestData(StringBuilder buffer, int bufferSize);
        }
    }
}
