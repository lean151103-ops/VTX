using System;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Windows;
using GNDServer.Services_user;

namespace GNDServer.Viewmodels_user
{
    public class MainViewModel : IDisposable, INotifyPropertyChanged
    {
        private readonly TelemetryService _service;

        // --- GIỮ NGUYÊN TÊN BIẾN CŨ CỦA BẠN ---
        private double _currentVelocity;
        public double CurrentVelocity
        {
            get => _currentVelocity;
            set { _currentVelocity = value; OnPropertyChanged(); }
        }

        private double _currentRPM;
        public double CurrentRPM
        {
            get => _currentRPM;
            set { _currentRPM = value; OnPropertyChanged(); }
        }

        private double _currentIMU;
        public double CurrentIMU
        {
            get => _currentIMU;
            set { _currentIMU = value; OnPropertyChanged(); }
        }

        private double _velocityAngle;
        public double VelocityAngle
        {
            get => _velocityAngle;
            set { _velocityAngle = value; OnPropertyChanged(); }
        }

        // --- THAY ĐỔI: Dùng mảng double để ScottPlot có thể vẽ ---
        // Tôi vẫn giữ tên "Series" nếu bạn muốn, nhưng kiểu dữ liệu phải là double[]
        public double[] VelocitySeries { get; } = new double[300];
        public double[] RPMSeries { get; } = new double[300];
        public double[] IMUSeries { get; } = new double[300];

        public MainViewModel()
        {
            _service = new TelemetryService();
            _service.OnDataReceived += Service_OnDataReceived;
            _service.Start();
        }

        private void Service_OnDataReceived(TelemetryData data)
        {
            // Cập nhật dữ liệu từ luồng UDP/C++ sang UI Thread
            Application.Current.Dispatcher.BeginInvoke(new Action(() =>
            {
                // 1. Hiệu ứng cuộn biểu đồ (Dịch chuyển mảng)
                Array.Copy(VelocitySeries, 1, VelocitySeries, 0, VelocitySeries.Length - 1);
                VelocitySeries[VelocitySeries.Length - 1] = data.Velocity;

                Array.Copy(RPMSeries, 1, RPMSeries, 0, RPMSeries.Length - 1);
                RPMSeries[RPMSeries.Length - 1] = data.RPM;

                Array.Copy(IMUSeries, 1, IMUSeries, 0, IMUSeries.Length - 1);
                IMUSeries[IMUSeries.Length - 1] = data.IMU;

                // 2. Cập nhật các con số hiển thị (Binding)
                CurrentVelocity = data.Velocity;
                CurrentRPM = data.RPM;
                CurrentIMU = data.IMU;

                // 3. Tính toán góc kim đồng hồ (Dải đo 0-350 tương ứng -120 đến +120 độ)
                VelocityAngle = -120 + (CurrentVelocity / 350.0) * 240.0;
            }));
        }

        public event PropertyChangedEventHandler PropertyChanged;
        protected void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        public void Dispose()
        {
            _service?.Stop();
            _service?.Dispose();
        }
    }
}
