using System;
using System.Runtime.InteropServices;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Markup;

namespace GNDServer2.Services_user
{
    [StructLayout(LayoutKind.Sequential, Pack = 1)]
    public struct TelemetryData
    {
        public ushort lapCounter;
        public uint   lapTime;
        public ushort distance;
        public ushort speed;
        public ushort throttle;
        public float  steering;
        public ushort rpm;
        public ushort gear;
        public ushort brake;
        public ushort fuel;
        public ushort imuX;
        public ushort imuY;
        public ushort temp_brakeFL;
        public ushort temp_brakeFR;
        public ushort temp_brakeRL;
        public ushort temp_brakeRR;
        public ushort temp_tireFL;
        public ushort temp_tireFR;
        public ushort temp_tireRL;
        public ushort temp_tireRR;
    }

    internal class TelemetryService : IDisposable
    {
        private CancellationTokenSource _cts;   // Cancellation token source for stopping the capture loop
        private uint _lastVersion;              // Using for tracking the version of the last data received 
        private Task _captureTask = Task.CompletedTask; // Using for managing the capture loop thread
        public int payload_size = Marshal.SizeOf<TelemetryData>();
        private ushort _prevSpeed;

        public event Action<TelemetryData> OnDataReceived;  // Event triggered to sending data to which need data 

        // P/Invoke declarations for native DLL functions
        [DllImport("Telemetry_Native2.dll", CallingConvention = CallingConvention.Cdecl)]
        private static extern int startServer();

        [DllImport("Telemetry_Native2.dll", CallingConvention = CallingConvention.Cdecl)]
        private static extern int stopServer();

        [DllImport("Telemetry_Native2.dll", CallingConvention = CallingConvention.Cdecl)]
        private static extern int getLastData(byte[] buffer, int bufferSize, out uint version);


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
                Console.WriteLine("Error while stopping");
            }

            stopServer();
        }

        // Continuously retrieves telemetry data (getting newest data by latest version) until cancellation is requested
        private void CaptureLoop(CancellationToken token)
        {
            byte[] buffer = new byte[payload_size];

            while (!token.IsCancellationRequested)
            {
                int result = getLastData(buffer, buffer.Length, out uint version);
                //Console.WriteLine($"C# Check: Result={result}, Version={version}, LastVersion={_lastVersion}"); // Debug with result number version and lastVersion
                if (version != _lastVersion)
                //if (result >= payload_size && version != _lastVersion)
                {
                    _lastVersion = version;
                    TelemetryData data = Parse(buffer);
                    Console.WriteLine($"DEBUG DATA: Lapcounter={data.lapCounter} | Laptime={data.lapTime} | Dist={data.distance} | Speed={data.speed} | Steering={data.steering} | Throttle={data.throttle}");
                    OnDataReceived?.Invoke(data);  // When having flags trans data to handle ,which registed
                }

                Thread.Sleep(2);
            }
        }

        // Converts a byte array to a TelemetryData struct using GCHandle to pin the array in memory
        private TelemetryData Parse(byte[] buffer)
        {
            // 1. Đọc dữ liệu gốc từ buffer
            ushort rawLapCounter = BitConverter.ToUInt16(buffer, 0);
            uint rawLapTime = BitConverter.ToUInt32(buffer, 2);
            ushort rawDistance = BitConverter.ToUInt16(buffer, 6);
            ushort rawSpeed = BitConverter.ToUInt16(buffer, 8);
            ushort rawThrottle = BitConverter.ToUInt16(buffer, 10);
            ushort rawSteering = BitConverter.ToUInt16(buffer, 12);

            // 2. Tính toán các giá trị mô phỏng
            float calculatedSteering = (float)(((int)rawSteering - 500) * 35.0 / 500.0);

            // Tính gia tốc dọc (IMU X) trước khi cập nhật _prevSpeed
            int accelDelta = (rawSpeed - _prevSpeed) * 100;
            ushort simulatedImuX = (ushort)(accelDelta); // 32768 là điểm 0G

            // Tính gia tốc ngang (IMU Y)
            ushort simulatedImuY = (ushort)(calculatedSteering * rawSpeed * 0.5);

            // Tính lực phanh và nhiệt độ (Lưu ý: dùng _prevSpeed trước khi cập nhật)
            ushort simulatedBrake = (ushort)(rawSpeed < _prevSpeed ? (_prevSpeed - rawSpeed) * 50 : 0);
            ushort simulatedTempBrake = (ushort)(60 + (simulatedBrake * 0.8) - (rawSpeed * 0.1));
            if (simulatedTempBrake < 40) simulatedTempBrake = 40;

            // Cập nhật tốc độ cũ cho lần sau
            _prevSpeed = rawSpeed;

            // Giả lập Gear và RPM
            ushort simulatedGear = (ushort)(
                rawSpeed < 10 ? 1 :
                rawSpeed < 40 ? 1 :
                rawSpeed < 75 ? 2 :
                rawSpeed < 110 ? 3 :
                rawSpeed < 150 ? 4 :
                rawSpeed < 200 ? 5 : 6);
            double gearFactor = simulatedGear * 35.0;
            ushort simulatedRpm = (ushort)(800 + (rawSpeed % gearFactor) * (9000 / gearFactor));
            if (simulatedRpm > 9000) simulatedRpm = 9000;

            // Giả lập xăng (Dùng rawDistance vừa đọc)
            ushort simulatedFuel = (ushort)(100 - (rawDistance / 1000.0) * 0.1);
            if (simulatedFuel > 100) simulatedFuel = 0; 
            return new TelemetryData
            {
                lapCounter = rawLapCounter,
                lapTime = rawLapTime,
                distance = rawDistance,
                speed = rawSpeed,
                throttle = rawThrottle,
                steering = calculatedSteering,

                // CÁC GIÁ TRỊ MÔ PHỎNG (Không đọc từ buffer nữa)
                rpm = simulatedRpm,
                gear = simulatedGear,
                brake = simulatedBrake,
                fuel = simulatedFuel,
                imuX = simulatedImuX,   // accX
                imuY = simulatedImuY,   // accY

                // Nhiệt độ
                temp_brakeFL = simulatedTempBrake,
                temp_brakeFR = simulatedTempBrake,
                temp_brakeRL = simulatedTempBrake,
                temp_brakeRR = simulatedTempBrake,

                // Lốp (giả lập nóng theo tốc độ)
                temp_tireFL = (ushort)(50 + rawSpeed * 0.2),
                temp_tireFR = (ushort)(50 + rawSpeed * 0.2),
                temp_tireRL = (ushort)(50 + rawSpeed * 0.2),
                temp_tireRR = (ushort)(50 + rawSpeed * 0.2)
            };
        }

        // Another method to stop the thread saftely
        public void Dispose()
        {
            Stop();
            _cts?.Dispose();
        }
    }
}