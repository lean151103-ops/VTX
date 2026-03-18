using System;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Windows;
using GNDServer.Services_user;
using SciChart.Charting.Model.DataSeries;

namespace GNDServer.Viewmodels_user
{
    public class MainViewModel : IDisposable, INotifyPropertyChanged
    {
        private readonly TelemetryService _service;
        private int _xIndex = 0;

        private double _currentVelocity;
        public double CurrentVelocity
        {
            get => _currentVelocity;
            set
            {
                if (_currentVelocity != value)
                {
                    _currentVelocity = value;
                    OnPropertyChanged(nameof(CurrentVelocity));
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
                _velocityAngle = value;
                OnPropertyChanged();
            }
        }

        public XyDataSeries<double, double> VelocitySeries { get; private set; }
        public XyDataSeries<double, double> IMUSeries { get; private set; }
        public XyDataSeries<double, double> RPMSeries { get; private set; }

        public MainViewModel()
        {
            VelocitySeries = new XyDataSeries<double, double>();
            VelocitySeries.SeriesName = "Velocity";
            VelocitySeries.FifoCapacity = 300;

            IMUSeries = new XyDataSeries<double, double>();
            IMUSeries.SeriesName = "IMU";
            IMUSeries.FifoCapacity = 300;

            RPMSeries = new XyDataSeries<double, double>();
            RPMSeries.SeriesName = "RPM";
            RPMSeries.FifoCapacity = 300;

            _service = new TelemetryService();
            _service.OnDataReceived += Service_OnDataReceived; // While receiving flag OnDataReceived, calling Service_OnDataReceived (+= is registing handler function)
            _service.Start(); 
        }

        //Collecting data and calling UI-Thread to update chart & UI 
        private void Service_OnDataReceived(TelemetryData data)
        {
            //Application.Current: app WPF current -> .Dispatcher: manage UI-Thread -> .BeginInvoke: making UI-thread running this function
            Application.Current.Dispatcher.BeginInvoke(new Action(() =>
            {
                VelocitySeries.Append(_xIndex, data.Velocity);
                IMUSeries.Append(_xIndex, data.IMU);
                RPMSeries.Append(_xIndex, data.RPM);

                CurrentVelocity = data.Velocity;
                VelocityAngle = -120 + (CurrentVelocity / 350.0) * 240.0;
                CurrentRPM = data.RPM;
                CurrentIMU = data.IMU;

                _xIndex++;
            }));
        }

        // If event OnPropertyChanged then updating the property to app (CallMemberName to don't need to pass propertyName)
        public event PropertyChangedEventHandler PropertyChanged;
        protected void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        public void Dispose()
        {
            if (_service != null)
            {
                _service.Stop();
                _service.Dispose();
            }
        }
    }
}
