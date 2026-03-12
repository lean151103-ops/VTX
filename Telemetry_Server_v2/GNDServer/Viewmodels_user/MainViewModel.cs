using GNDServer.Services_user;
using SciChart.Charting.Model.DataSeries;
using System;
using System.Windows;

namespace GNDServer.Viewmodels_user
{
    public class MainViewModel : IDisposable
    {
        private readonly TelemetryService _service;
        private int _xIndex = 0;

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
                _xIndex++;
            }));
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