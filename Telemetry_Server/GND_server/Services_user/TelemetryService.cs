using System;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Markup;

namespace GNDServer.Services_user
{
    [StructLayout(LayoutKind.Sequential, Pack = 1)]
    public struct TelemetryData
    {
        public string clientKey;
        public string ip;
        public int port;

        public float errorRate;
        public ushort lapCounter;
        public float lapTime;
        public ushort distance;
        public ushort speed;
        public ushort throttle;
        public float steering;
        public ushort _elapsedMs;
        public ushort rpm;
        public ushort gear;
        public ushort brake;
        public ushort fuel;
        public float imuX;
        public float imuY;
        public ushort temp_brakeFL;
        public ushort temp_brakeFR;
        public ushort temp_brakeRL;
        public ushort temp_brakeRR;
        public ushort temp_tireFL;
        public ushort temp_tireFR;
        public ushort temp_tireRL;
        public ushort temp_tireRR;

        public uint lastSeq;
        public ulong totalExpected;
        public ulong totalLost;
        public uint packetDeltaMs;
    }

    internal class TelemetryService : IDisposable
    {
        private CancellationTokenSource _cts;   // Cancellation token source for stopping the capture loop
        private uint _lastVersion;              // Using for tracking the version of the last data received 
        private Task _captureTask = Task.CompletedTask; // Using for managing the capture loop thread
        public int payload_size = Marshal.SizeOf<TelemetryData>();

        private readonly System.Diagnostics.Stopwatch _thermalTimer = new System.Diagnostics.Stopwatch();
        private float _lastDt = 0.002f;
        private ushort _prevSpeed;
        private ushort _prevDistance;

        //Parameters of F1-car for simulating
        const short m = 800;            //kg
        const float L = 1.53f;          //m
        const float r_w = 0.203f;       //m
        const float muy = 1.5f;         // Hệ số ma sát lốp
        const float G_final = 3.5f;
        const float G_gear = 2.1f;
        const float h_break = 150.0f;     // W/oC
        const float m_break_disc = 1.2f; // kg
        const float C_steel = 480f;      // J/(kg*K)
        const float a_brake_max = muy * 9.81f;
        const float F_brake_max = muy * m * 9.81f;
        double[] gearRatio = { 0, 2.85, 2.05, 1.62, 1.35, 1.15, 1.00 }; // Gear ratios for 1st to 6th gear

        //Parameters of F1-Tires
        const float m_tire = 8.0f;  //kg
        const float C_tire = 1500f; // J/(kgK)
        const float h_tire = 20.0f; // W/oC
        const float F_z = m * 9.81f / 4;
        const float muy_roll = 0.015f;
        const float k_slip = 0.1f;

        // ── Fuel parameters ──
        const float rpm_max = 12000f;
        const float max_drain_rate = 0.5f;

        public event Action<TelemetryData> OnDataReceived;  // Event triggered to sending data to which need data 

        // P/Invoke declarations for native DLL functions
        [DllImport("Telemetry_Native.dll", CallingConvention = CallingConvention.Cdecl)]
        private static extern int startServer();

        [DllImport("Telemetry_Native.dll", CallingConvention = CallingConvention.Cdecl)]
        private static extern int stopServer();

        [DllImport("Telemetry_Native.dll", CallingConvention = CallingConvention.Cdecl)]
        private static extern int getLastData(byte[] buffer, int bufferSize, out uint version);

        [DllImport("Telemetry_Native.dll", CallingConvention = CallingConvention.Cdecl)]
        public static extern int getTotalClients();

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
                    Console.WriteLine($"DEBUG DATA: Address={data.clientKey}__{data.ip}:{data.port} Lapcounter={data.lapCounter} | Laptime={data.lapTime} | Dist={data.distance} | Speed={data.speed} | Steering={data.steering} | Throttle={data.throttle} | Elapsed={data._elapsedMs}");
                    OnDataReceived?.Invoke(data);  // When having flags trans data to handle ,which registed
                }
                Thread.Sleep(2);
            }
        }

        private static float T_disc = 30.0f;
        private static float T_tire = 30.0f;
        private const float T_ambient = 30.0f;
        private static float _fuelLevel = 100.0f;

        // Converts a byte array to a TelemetryData struct using GCHandle to pin the array in memory
        private TelemetryData Parse(byte[] buffer)
        {
            byte keyLen = buffer[0];
            int offset = 1 + keyLen;
            int tailOffset = offset + 18;

            string clientKey = Encoding.ASCII.GetString(buffer, 1, keyLen);

            string ip = "";
            int port = 0;

            var parts = clientKey.Split(':');
            if (parts.Length == 2)
            {
                ip = parts[0];
                int.TryParse(parts[1], out port);
            }

            float dt;
            if (_thermalTimer.IsRunning)
            {
                dt = (float)_thermalTimer.Elapsed.TotalSeconds;
                dt = Math.Max(0.003f, Math.Min(dt, 0.1f));
                _lastDt = dt;
            }
            else
            {
                dt = _lastDt;
            }
            _thermalTimer.Restart();

            // 1. Đọc dữ liệu gốc từ buffer
            ushort rawLapCounter = BitConverter.ToUInt16(buffer, offset + 0);
            uint   rawLapTime    = BitConverter.ToUInt32(buffer, offset + 2);
            ushort rawDistance   = BitConverter.ToUInt16(buffer, offset + 6);
            ushort rawSpeed      = BitConverter.ToUInt16(buffer, offset + 8);
            ushort rawThrottle   = BitConverter.ToUInt16(buffer, offset + 10);
            ushort rawSteering   = BitConverter.ToUInt16(buffer, offset + 12);
            ushort elapsedMs     = BitConverter.ToUInt16(buffer, offset + 14);

            uint  rawLastSeq        = BitConverter.ToUInt32(buffer, tailOffset);
            ulong rawTotalExpected  = BitConverter.ToUInt64(buffer, tailOffset + 4);
            ulong rawTotalLost      = BitConverter.ToUInt64(buffer, tailOffset + 12);
            uint  rawDeltaMs        = BitConverter.ToUInt32(buffer, tailOffset + 20);

            float rawErrorRate = (rawTotalExpected > 0)
                    ? (float)rawTotalLost / rawTotalExpected   // tính lại từ totalLost/totalExpected
                    : 0f;
            float rawSpeedMs = rawSpeed / 3.6f; // Convert km/h to m/s for calculations

            // 2. Tính toán các giá trị mô phỏng
            float lapTimeDecoded = rawLapTime / 1000.0f; // Convert ms to seconds
            float calculatedSteering = (float)(((int)rawSteering - 500) * 35.0 / 500.0);

            // Tính gia tốc dọc (IMU X) trước khi cập nhật _prevSpeed
            float simulatedImuX = (float)(rawSpeedMs - _prevSpeed / 3.6f) / dt;
            Console.Write($"{dt} -");
            // Tính gia tốc ngang (IMU Y)
            float steeringRadian = calculatedSteering * (float)(Math.PI / 180.0);
            float simulatedImuY = (float)(Math.Tan(steeringRadian) * rawSpeedMs * rawSpeedMs / L);

            // Giả lập Gear và RPM
            ushort simulatedGear = (ushort)(
                rawSpeed < 10 ? 1 :
                rawSpeed < 40 ? 1 :
                rawSpeed < 75 ? 2 :
                rawSpeed < 110 ? 3 :
                rawSpeed < 150 ? 4 :
                rawSpeed < 200 ? 5 : 6);
            double currentGearRatio = gearRatio[simulatedGear];
            ushort simulatedRpm = (ushort)((rawSpeedMs * 60 * currentGearRatio * G_final) / (2 * Math.PI * r_w));

            if (simulatedRpm < 800) simulatedRpm = 800;
            if (simulatedRpm > 12000) simulatedRpm = 12000;

            // Tính lực phanh và nhiệt độ 
            ushort simulatedBrake = (ushort)(rawSpeed < _prevSpeed ? Math.Abs(simulatedImuX) * 100 / a_brake_max : 0);
            if (simulatedBrake > 100) simulatedBrake = 100;

            float brakeForce = (simulatedBrake / 100.0f) * F_brake_max;
            float brakeForce_disc = brakeForce / 4.0f;
            float delta_Temp_Brake = (brakeForce_disc * rawSpeedMs - h_break * (T_disc - T_ambient)) * dt / (m_break_disc * C_steel);
            T_disc += delta_Temp_Brake;
            ushort simulatedTempBrake = (ushort)T_disc;

            // Simulation cho lốp xe
            float delta_Temp_Tire = (muy_roll * F_z * rawSpeedMs + k_slip * brakeForce_disc * rawSpeedMs - h_tire * (T_tire - T_ambient)) * dt / (m_tire * C_tire);
            T_tire += delta_Temp_Tire;
            ushort simulatedTempTire = (ushort)T_tire;

            // Giả lập xăng (Dùng rawDistance vừa đọc)
            float rpmNorm = simulatedRpm / rpm_max;            // 0~1
            float throttleNorm = rawThrottle / 100.0f;         // 0~1
            float fuelRate = max_drain_rate * rpmNorm * throttleNorm; // %/s
            _fuelLevel -= fuelRate * dt;
            _fuelLevel = Math.Max(0f, _fuelLevel);             // không âm
            ushort simulatedFuel = (ushort)_fuelLevel;         // 0~100

            // Cập nhật tốc độ cũ cho lần sau
            _prevSpeed = rawSpeed;
            _prevDistance = rawDistance;

            return new TelemetryData
            {
                clientKey = clientKey,
                ip = ip,
                port = port,

                errorRate = rawErrorRate,
                lapCounter = rawLapCounter,
                lapTime = lapTimeDecoded,
                distance = rawDistance,
                speed = rawSpeed,
                throttle = rawThrottle,
                steering = calculatedSteering,
                _elapsedMs = elapsedMs,

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
                temp_tireFL = simulatedTempTire,
                temp_tireFR = simulatedTempTire,
                temp_tireRL = simulatedTempTire,
                temp_tireRR = simulatedTempTire,

                lastSeq         = rawLastSeq,
                totalExpected   = rawTotalExpected,
                totalLost       = rawTotalLost,
                packetDeltaMs   = rawDeltaMs
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