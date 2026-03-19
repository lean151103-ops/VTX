using System;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Windows;
using GNDServer_v2.Services_user;

namespace GNDServer_v2.Viewmodels_user
{
    public class MainViewModel : IDisposable, INotifyPropertyChanged
    {
        private readonly TelemetryService _service;

        public double[] VelocityValues { get; } = new double[300];
        public double[] RPMValues { get; } = new double[300];
        public double[] IMUValues { get; } = new double[300];

        private double _currentVelocity;
        public double CurrentVelocity
        {
            get => _currentVelocity;
            set
            {
                if (_currentVelocity != value)
                {
                    _currentVelocity = value;
                    OnPropertyChanged();
                }
            }
        }

        private double _currentRPM;
        public double CurrentRPM
        {
            get => _currentRPM;
            set
            {
                if (_currentRPM != value)
                {
                    _currentRPM = value;
                    OnPropertyChanged();
                }
            }
        }

        private double _currentIMU;
        public double CurrentIMU
        {
            get => _currentIMU;
            set
            {
                if (_currentIMU != value)
                {
                    _currentIMU = value;
                    OnPropertyChanged();
                }
            }
        }

        private double _velocityAngle;
        public double VelocityAngle
        {
            get => _velocityAngle;
            set
            {
                if (_velocityAngle != value)
                {
                    _velocityAngle = value;
                    OnPropertyChanged();
                }
            }
        }

        public event EventHandler PlotsUpdated;

        public MainViewModel()
        {
            _service = new TelemetryService();
            _service.OnDataReceived += Service_OnDataReceived;
            _service.Start();
        }

        private void Service_OnDataReceived(TelemetryData data)
        {
            Application.Current.Dispatcher.BeginInvoke(new Action(() =>
            {
                Push(VelocityValues, data.Velocity);
                Push(RPMValues, data.RPM);
                Push(IMUValues, data.IMU);

                CurrentVelocity = data.Velocity;
                CurrentRPM = data.RPM;
                CurrentIMU = data.IMU;
                VelocityAngle = -120 + (CurrentVelocity / 350.0) * 240.0;

                PlotsUpdated?.Invoke(this, EventArgs.Empty);
            }));
        }

        private static void Push(double[] values, double newValue)
        {
            Array.Copy(values, 1, values, 0, values.Length - 1);
            values[values.Length - 1] = newValue;
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
