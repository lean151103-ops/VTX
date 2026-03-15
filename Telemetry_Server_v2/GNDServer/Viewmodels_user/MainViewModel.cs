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

        private double _currentIMT;
        public double CurrentIMT
        {
            get => _currentIMT;
            set
            {
                if (_currentIMT != value)
                {
                    _currentIMT = value;
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
        public XyDataSeries<double, double> IMTSeries { get; private set; }
        public XyDataSeries<double, double> RPMSeries { get; private set; }

        public MainViewModel()
        {
            VelocitySeries = new XyDataSeries<double, double>();
            VelocitySeries.SeriesName = "Velocity";
            VelocitySeries.FifoCapacity = 300;

            IMTSeries = new XyDataSeries<double, double>();
            IMTSeries.SeriesName = "IMT";
            IMTSeries.FifoCapacity = 300;

            RPMSeries = new XyDataSeries<double, double>();
            RPMSeries.SeriesName = "RPM";
            RPMSeries.FifoCapacity = 300;

            _service = new TelemetryService();
            _service.OnDataReceived += Service_OnDataReceived;
            _service.Start();
        }

        private void Service_OnDataReceived(TelemetryData data)
        {
            Application.Current.Dispatcher.BeginInvoke(new Action(() =>
            {
                VelocitySeries.Append(_xIndex, data.Velocity);
                IMTSeries.Append(_xIndex, data.IMT);
                RPMSeries.Append(_xIndex, data.RPM);

                CurrentVelocity = data.Velocity;
                VelocityAngle = -120 + (CurrentVelocity / 350.0) * 240.0;
                CurrentRPM = data.RPM;
                CurrentIMT = data.IMT;

                _xIndex++;
            }));
        }

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
