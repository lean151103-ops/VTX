using System;
using System.ComponentModel;
using System.Drawing;
using System.Windows;
using GNDServer_v2.Viewmodels_user;

namespace GNDServer_v2
{
    public partial class MainWindow : Window
    {
        private readonly MainViewModel _vm;

        private ScottPlot.Plot _velocityPlotModel;
        private ScottPlot.Plot _rpmPlotModel;
        private ScottPlot.Plot _imuPlotModel;

        public MainWindow()
        {
            InitializeComponent();

            _vm = new MainViewModel();
            DataContext = _vm;
            _vm.PlotsUpdated += Vm_PlotsUpdated;
        }

        private void MainWindow_Loaded(object sender, RoutedEventArgs e)
        {
            _velocityPlotModel = CreatePlot(
                _vm.VelocityValues,
                "#4FA3E3",
                hideBottomAxis: true);

            _rpmPlotModel = CreatePlot(
                _vm.RPMValues,
                "#F26B2D",
                hideBottomAxis: true);

            _imuPlotModel = CreatePlot(
                _vm.IMUValues,
                "#7ED957",
                hideBottomAxis: false);

            VelocityPlot.Reset(_velocityPlotModel);
            RPMPlot.Reset(_rpmPlotModel);
            IMUPlot.Reset(_imuPlotModel);

            VelocityPlot.Refresh();
            RPMPlot.Refresh();
            IMUPlot.Refresh();
        }

        private static ScottPlot.Plot CreatePlot(double[] values, string hexColor, bool hideBottomAxis)
        {
            var plt = new ScottPlot.Plot();

            Color bg = ColorTranslator.FromHtml("#25303D");
            Color line = ColorTranslator.FromHtml(hexColor);

            plt.Style(figureBackground: bg, dataBackground: bg);
            var sig = plt.AddSignal(values, color: line);
            sig.LineWidth = 1;
            plt.Grid(enable: true);

            if (hideBottomAxis)
            {
                plt.XAxis.Hide();
                plt.XAxis2.Hide();
            }

            plt.YAxis2.Hide();
            plt.AxisAuto();

            return plt;
        }

        private void Vm_PlotsUpdated(object sender, EventArgs e)
        {
            _velocityPlotModel.AxisAuto();
            _rpmPlotModel.AxisAuto();
            _imuPlotModel.AxisAuto();

            VelocityPlot.Refresh();
            RPMPlot.Refresh();
            IMUPlot.Refresh();
        }

        private void MainWindow_Closing(object sender, CancelEventArgs e)
        {
            _vm.PlotsUpdated -= Vm_PlotsUpdated;
            _vm.Dispose();
        }
    }
}
