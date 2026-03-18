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

            _vm.OnDataUpdated += Vm_OnDataUpdated;
        }

        private void MainWindow_Loaded(object sender, RoutedEventArgs e)
        {
            // ===== ADD SIGNAL =====
            var vel = VelocityPlot.Plot.AddSignal(_vm.VelocitySeries);
            vel.Color = System.Drawing.Color.DeepSkyBlue;

            var rpm = RPMPlot.Plot.AddSignal(_vm.RPMSeries);
            rpm.Color = System.Drawing.Color.Orange;

            var imu = IMTPlot.Plot.AddSignal(_vm.IMUSeries);
            imu.Color = System.Drawing.Color.LimeGreen;

            VelocityPlot.Plot.Style(ScottPlot.Style.Black);
            RPMPlot.Plot.Style(ScottPlot.Style.Black);
            IMTPlot.Plot.Style(ScottPlot.Style.Black);

            VelocityPlot.Plot.Grid(color: System.Drawing.Color.FromArgb(40, 200, 200, 200));
            RPMPlot.Plot.Grid(color: System.Drawing.Color.FromArgb(40, 200, 200, 200));
            IMTPlot.Plot.Grid(color: System.Drawing.Color.FromArgb(40, 200, 200, 200));
        }

        private void Vm_OnDataUpdated()
        {
            Dispatcher.Invoke(() =>
            {
                VelocityPlot.Render();
                RPMPlot.Render();
                IMTPlot.Render();
            });
        }

        private void MainWindow_Closing(object sender, CancelEventArgs e)
        {
            if (_vm != null)
                _vm.Dispose();
        }
    }
}
