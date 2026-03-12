using System;
using System.Runtime.InteropServices;
using System.Threading;
using System.Threading.Tasks;

namespace GNDServer.Services_user
{
    [StructLayout(LayoutKind.Sequential, Pack = 1)]
    public struct TelemetryData
    {
        public float Velocity;
        public float IMT;
        public float RPM;
    }

    internal class TelemetryService : IDisposable
    {
        private readonly int _dataSize;         // Size of TelemetryData struct in bytes
        private CancellationTokenSource _cts;   // Cancellation token source for stopping the capture loop
        private uint _lastVersion;              // Using for tracking the version of the last data received 
        private Task _captureTask = Task.CompletedTask; // Using for managing the capture loop thread

        public event Action<TelemetryData> OnDataReceived;  // Event triggered when new telemetry data is received

        // P/Invoke declarations for native DLL functions
        [DllImport("Telemetry_Native.dll", CallingConvention = CallingConvention.Cdecl)]
        private static extern int startServer();

        [DllImport("Telemetry_Native.dll", CallingConvention = CallingConvention.Cdecl)]
        private static extern int stopServer();

        [DllImport("Telemetry_Native.dll", CallingConvention = CallingConvention.Cdecl)]
        private static extern int getLastData(byte[] buffer, int bufferSize, out uint version);

        // Constructor initializes the size of the TelemetryData struct
        public TelemetryService()
        {
            _dataSize = Marshal.SizeOf<TelemetryData>();
        }

        // Starts the telemetry server and create _cts to cancel capture loop when stopping & Start the capture loop in a separate task
        public void Start()
        {
            int result = startServer();
            if (result != 1)
                return;

            _cts = new CancellationTokenSource();
            _captureTask = Task.Run(() => CaptureLoop(_cts.Token));
        }

        // Stops the telemetry server, cancels the capture loop, and waits for it to finish
        public void Stop()
        {
            _cts?.Cancel();

            try
            {
                _captureTask?.Wait(500);
            }
            catch
            {
            }

            stopServer();
        }

        // Continuously retrieves telemetry data (getting newest data by latest version) until cancellation is requested
        private void CaptureLoop(CancellationToken token)
        {
            byte[] buffer = new byte[_dataSize];

            while (!token.IsCancellationRequested)
            {
                int result = getLastData(buffer, buffer.Length, out uint version);

                if (result >= _dataSize && version != _lastVersion)
                {
                    _lastVersion = version;
                    TelemetryData data = ByteArrayToStruct(buffer);
                    OnDataReceived?.Invoke(data);
                }

                Thread.Sleep(10);
            }
        }

        // Converts a byte array to a TelemetryData struct using GCHandle to pin the array in memory
        private TelemetryData ByteArrayToStruct(byte[] bytes)
        {
            GCHandle handle = GCHandle.Alloc(bytes, GCHandleType.Pinned);
            try
            {
                return Marshal.PtrToStructure<TelemetryData>(handle.AddrOfPinnedObject());
            }
            finally
            {
                handle.Free();
            }
        }

        // Another method to stop the thread saftely
        public void Dispose()
        {
            Stop();
            _cts?.Dispose();
        }
    }
}