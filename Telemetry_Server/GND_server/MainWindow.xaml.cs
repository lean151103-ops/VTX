using GNDServer.Viewmodels_user;
using System;
using System.ComponentModel;
using System.Windows;
using System.Windows.Media;

namespace GNDServer
{
    public partial class MainWindow : Window
    {
        private readonly MainViewModel _vm;

        public MainWindow()
        {
            InitializeComponent();
            _vm = new MainViewModel();
            this.DataContext = _vm;

            this.Loaded += MainWindow_Loaded;
            this.Closing += MainWindow_Closing;
        }

        private void MainWindow_Loaded(object sender, RoutedEventArgs e)
        {
            // 1. Gán mảng dữ liệu vào biểu đồ (Chỉ thực hiện 1 lần duy nhất)
            VelocityPlot.Plot.AddSignal(_vm.VelocitySeries);
            RPMPlot.Plot.AddSignal(_vm.RPMSeries);
            IMTPlot.Plot.AddSignal(_vm.IMUSeries);

            // Tùy chỉnh giao diện cho đẹp (Optional)
            VelocityPlot.Plot.Style(ScottPlot.Style.Black);
            RPMPlot.Plot.Style(ScottPlot.Style.Black);
            IMTPlot.Plot.Style(ScottPlot.Style.Black);

            // 2. QUAN TRỌNG: Đăng ký sự kiện Rendering tại đây để bắt đầu vòng lặp vẽ lại
            CompositionTarget.Rendering += OnRendering;
        }

        private void OnRendering(object sender, EventArgs e)
        {
            // Hàm này sẽ chạy liên tục theo tần số quét màn hình (60fps hoặc hơn)
            if (_vm != null)
            {
                // Ra lệnh cho các Control ScottPlot vẽ lại dựa trên dữ liệu mảng mới nhất
                VelocityPlot?.Render();
                RPMPlot?.Render();
                IMTPlot?.Render();
            }
        }

        private void MainWindow_Closing(object sender, CancelEventArgs e)
        {
            CompositionTarget.Rendering -= OnRendering;

            if (_vm != null)
                _vm.Dispose();
        }
    }
}
