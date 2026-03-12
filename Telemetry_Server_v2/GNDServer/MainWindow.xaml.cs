using GNDServer.Viewmodels_user;
using System.ComponentModel;
using System.Windows;

namespace GNDServer
{
    public partial class MainWindow : Window
    {
        private MainViewModel _vm;

        public MainWindow()
        {
            InitializeComponent();
            _vm = new MainViewModel();
            DataContext = _vm;
            Closing += MainWindow_Closing;
        }

        private void MainWindow_Closing(object sender, CancelEventArgs e)
        {
            if (_vm != null)
                _vm.Dispose();
        }
    }
}