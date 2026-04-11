using GNDServer.Services_user;
using OpenCvSharp;
using OpenCvSharp.WpfExtensions;
using SciChart.Charting.Model.DataSeries;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;

namespace GNDServer.Viewmodels_user
{
    public class MainViewModel : IDisposable, INotifyPropertyChanged
    {
        protected bool SetField<T>(ref T field, T value, [CallerMemberName] string propertyName = null)
        {
            if (EqualityComparer<T>.Default.Equals(field, value))
                return false;

            field = value;
            OnPropertyChanged(propertyName);
            return true;
        }

        private Brush GetBrakeBrush(double temp)
        {
            if (temp < 100) return Brushes.LightBlue;
            if (temp < 300) return Brushes.Yellow;
            if (temp < 500) return Brushes.Orange;
            return Brushes.Red;
        }

        private readonly TelemetryService _service;
        private int _xIndex = 0;

        private double _LapCounter;
        public double LapCounter
        {
            get => _LapCounter;
            set => SetField(ref _LapCounter, value);
        }

        private double _Distance;
        public double Distance
        {
            get => _Distance;
            set => SetField(ref _Distance, value);
        }

        private double _Speed;
        public double Speed
        {
            get => _Speed;
            set => SetField(ref _Speed, value);
        }

        private double _Throttle;
        public double Throttle
        {
            get => _Throttle;
            set => SetField(ref _Throttle, value);
        }

        private double _RPM;
        public double RPM
        {
            get => _RPM;
            set => SetField(ref _RPM, value);
        }

        private double _Steering;
        public double Steering
        {
            get => _Steering;
            set => SetField(ref _Steering, value);
        }

        private double _IMUx;
        public double IMUx
        {
            get => _IMUx;
            set => SetField(ref _IMUx, value);
        }
        private double _IMUy;
        public double IMUy
        {
            get => _IMUy;
            set => SetField(ref _IMUy, value);
        }

        private double _TempBrakeDisc;
        public double TempBrakeDisc
        {
            get => _TempBrakeDisc;
            set => SetField(ref _TempBrakeDisc, value);
        }

        private double _LapTimeText;
        public double LapTimeText
        {
            get => _LapTimeText;
            set => SetField(ref _LapTimeText, value);
        }

        private double _BrakeFLTemp;
        public double BrakeFLTemp
        {
            get => _BrakeFLTemp;
            set => SetField(ref _BrakeFLTemp, value);
        }
        private Brush _brakeFLBrush = Brushes.LightBlue;
        public Brush BrakeFLBrush
        {
            get => _brakeFLBrush;
            set => SetField(ref _brakeFLBrush, value);
        }

        private double _BrakeFRTemp;
        public double BrakeFRTemp
        {
            get => _BrakeFRTemp;
            set => SetField(ref _BrakeFRTemp, value);
        }
        private Brush _brakeFRBrush = Brushes.LightBlue;
        public Brush BrakeFRBrush
        {
            get => _brakeFRBrush;
            set => SetField(ref _brakeFRBrush, value);
        }

        private double _BrakeRLTemp;
        public double BrakeRLTemp
        {
            get => _BrakeRLTemp;
            set => SetField(ref _BrakeRLTemp, value);
        }
        private Brush _brakeRLBrush = Brushes.LightBlue;
        public Brush BrakeRLBrush
        {
            get => _brakeRLBrush;
            set => SetField(ref _brakeRLBrush, value);
        }

        private double _BrakeRRTemp;
        public double BrakeRRTemp
        {
            get => _BrakeRRTemp;
            set => SetField(ref _BrakeRRTemp, value);
        }
        private Brush _brakeRRBrush = Brushes.LightBlue;
        public Brush BrakeRRBrush
        {
            get => _brakeRRBrush;
            set => SetField(ref _brakeRRBrush, value);
        }

        private double _TireFLTemp;
        public double TireFLTemp
        {
            get => _TireFLTemp;
            set => SetField(ref _TireFLTemp, value);
        }
        private Brush _TireFLBrush = Brushes.LightBlue;
        public Brush TireFLBrush
        {
            get => _TireFLBrush;
            set => SetField(ref _TireFLBrush, value);
        }

        private double _TireFRTemp;
        public double TireFRTemp
        {
            get => _TireFRTemp;
            set => SetField(ref _TireFRTemp, value);
        }
        private Brush _TireFRBrush = Brushes.LightBlue;
        public Brush TireFRBrush
        {
            get => _TireFRBrush;
            set => SetField(ref _TireFRBrush, value);
        }

        private double _TireRLTemp;
        public double TireRLTemp
        {
            get => _TireRLTemp;
            set => SetField(ref _TireRLTemp, value);
        }
        private Brush _TireRLBrush = Brushes.LightBlue;
        public Brush TireRLBrush
        {
            get => _TireRLBrush;
            set => SetField(ref _TireRLBrush, value);
        }

        private double _TireRRTemp;
        public double TireRRTemp
        {
            get => _TireRRTemp;
            set => SetField(ref _TireRRTemp, value);
        }
        private Brush _TireRRBrush = Brushes.LightBlue;
        public Brush TireRRBrush
        {
            get => _TireRRBrush;
            set => SetField(ref _TireRRBrush, value);
        }

        private double _Gear;
        public double Gear
        {
            get => _Gear;
            set => SetField(ref _Gear, value);
        }

        private BitmapImage _videoFrame;
        public BitmapImage VideoFrame
        {
            get => _videoFrame;
            set { _videoFrame = value; OnPropertyChanged(nameof(VideoFrame)); }
        }
        private VideoService _videoService = new VideoService();

        public XyDataSeries<double, double> TrackBaseSeries { get; private set; }
        public XyDataSeries<double, double> CarMakersSeries { get; private set; }
        public XyDataSeries<double, double> IMUxSeries { get; private set; }
        public XyDataSeries<double, double> IMUySeries { get; private set; }
        public XyDataSeries<double, double> ThrottleDataSeries { get; private set; }
        public XyDataSeries<double, double> BrakeDataSeries { get; private set; }
        public XyDataSeries<double, double> FuelDataSeries { get; private set; }

        public MainViewModel()
        {
            TrackBaseSeries = new XyDataSeries<double, double>();
            CarMakersSeries = new XyDataSeries<double, double>();

            TrackBaseSeries.Append(0, 0);
            TrackBaseSeries.Append(5000, 0);

            IMUxSeries = new XyDataSeries<double, double>();
            IMUxSeries.SeriesName = "IMUx";
            IMUxSeries.FifoCapacity = 300;

            IMUySeries = new XyDataSeries<double, double>();
            IMUySeries.SeriesName = "IMUy";
            IMUySeries.FifoCapacity = 300;

            ThrottleDataSeries = new XyDataSeries<double, double>();
            ThrottleDataSeries.Append(0, 0);

            BrakeDataSeries = new XyDataSeries<double, double>();
            BrakeDataSeries.Append(0, 0);

            FuelDataSeries = new XyDataSeries<double, double>();
            FuelDataSeries.Append(0, 0);

            _service = new TelemetryService();
            _service.OnDataReceived += Service_OnDataReceived; // While receiving flag OnDataReceived, calling Service_OnDataReceived (+= is registing handler function)
            _service.Start();
            _videoService.FrameReceived += frame =>
            {
                App.Current.Dispatcher.Invoke(() => VideoFrame = frame);
            };
            _videoService.Start(5005);
        }

        //Collecting data and calling UI-Thread to update chart & UI 
        private void Service_OnDataReceived(TelemetryData data)
        {
            //Application.Current: app WPF current -> .Dispatcher: manage UI-Thread -> .BeginInvoke: making UI-thread running this function
            Application.Current.Dispatcher.InvokeAsync(async () =>
            {
                // SciChart DataSeries
                CarMakersSeries.Clear();
                CarMakersSeries.Append(data.distance, 0);
                IMUxSeries.Append(_xIndex, data.imuX);
                IMUySeries.Append(_xIndex, data.imuY);

                if (ThrottleDataSeries.Count > 0)
                    ThrottleDataSeries.Update(0, (double)data.throttle);
                else
                    ThrottleDataSeries.Append(0, data.throttle);

                if (BrakeDataSeries.Count > 0)
                    BrakeDataSeries.Update(0, (double)data.brake);
                else
                    BrakeDataSeries.Append(0, data.brake);

                if (FuelDataSeries.Count > 0)
                    FuelDataSeries.Update(0, (double)data.fuel);
                else
                    FuelDataSeries.Append(0, data.fuel);

                // XAML properties
                LapCounter = data.lapCounter;
                LapTimeText = data.lapTime;
                Distance = data.distance;
                Speed = data.speed;
                Throttle = data.throttle;
                RPM = data.rpm;
                Steering = data.steering;
                TempBrakeDisc = data.temp_brakeFL; // Tạm 
                Gear = data.gear;
                IMUx = data.imuX;
                IMUy = data.imuY;

                BrakeFLTemp = data.temp_brakeFL;
                BrakeFLBrush = GetBrakeBrush(data.temp_brakeFL);
                BrakeFRTemp = data.temp_brakeFR;
                BrakeFRBrush = GetBrakeBrush(data.temp_brakeFR);
                BrakeRLTemp = data.temp_brakeRL;
                BrakeRLBrush = GetBrakeBrush(data.temp_brakeRL);
                BrakeRRTemp = data.temp_brakeRR;
                BrakeRRBrush = GetBrakeBrush(data.temp_brakeRR);

                TireFLTemp = data.temp_tireFL;
                TireFLBrush = GetBrakeBrush(data.temp_tireFL);
                TireFRTemp = data.temp_tireFR;
                TireFRBrush = GetBrakeBrush(data.temp_tireFR);
                TireRLTemp = data.temp_tireRL;
                TireRLBrush = GetBrakeBrush(data.temp_tireRL);
                TireRRTemp = data.temp_tireRR;
                TireRRBrush = GetBrakeBrush(data.temp_tireRR);
                _xIndex++;
            });
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
                _service.OnDataReceived -= Service_OnDataReceived;
                _videoService.Stop();
            }
        }
    }
}