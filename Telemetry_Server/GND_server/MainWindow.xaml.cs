using GNDServer2.Viewmodels_user;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using System.Windows.Threading;

namespace GNDServer2
{
    public partial class MainWindow : Window
    {
        private MainViewModel _vm;
        private List<Point> centerlinePoints = new List<Point>();
        private List<UIElement> drawnElements = new List<UIElement>();

        private Ellipse _carDot;
        private DispatcherTimer _timer;
        private double _totalLength;
        public MainWindow()
        {
            InitializeComponent();
            LoadTrackImage();
            _vm = new MainViewModel();
            DataContext = _vm;
            Closing += MainWindow_Closing;

            KeyDown += (s, e) =>
            {
                if (e.Key == Key.Z && Keyboard.Modifiers == ModifierKeys.Control)
                    UndoPoint_Click(s, e);
            };
            RestartSimulation(); 
        }
        private void MainWindow_Closing(object sender, CancelEventArgs e)
        {
            if (_vm != null)
                _vm.Dispose();
        }
        private static readonly Point[] CenterlineMap = new Point[]
        {
            new Point(247.0, 46.6),
            new Point(262.0, 46.6),
            new Point(279.0, 47.6),
            new Point(301.0, 48.6),
            new Point(316.0, 54.6),
            new Point(327.0, 62.6),
            new Point(333.0, 68.6),
            new Point(343.0, 75.6),
            new Point(349.0, 85.6),
            new Point(354.0, 90.6),
            new Point(359.0, 97.6),
            new Point(364.0, 100.6),
            new Point(367.0, 108.6),
            new Point(371.0, 116.6),
            new Point(374.0, 124.6),
            new Point(376.0, 131.6),
            new Point(380.0, 143.6),
            new Point(380.0, 151.6),
            new Point(382.0, 161.6),
            new Point(382.0, 174.6),
            new Point(382.0, 186.6),
            new Point(382.0, 198.6),
            new Point(383.0, 210.6),
            new Point(383.0, 221.6),
            new Point(383.0, 230.6),
            new Point(383.0, 240.6),
            new Point(382.0, 251.6),
            new Point(382.0, 260.6),
            new Point(382.0, 268.6),
            new Point(381.0, 276.6),
            new Point(382.0, 282.6),
            new Point(382.0, 293.6),
            new Point(381.0, 300.6),
            new Point(382.0, 305.6),
            new Point(382.0, 317.6),
            new Point(382.0, 328.6),
            new Point(382.0, 337.6),
            new Point(381.0, 345.6),
            new Point(381.0, 353.6),
            new Point(381.0, 364.6),
            new Point(381.0, 378.6),
            new Point(381.0, 388.6),
            new Point(381.0, 394.6),
            new Point(381.0, 404.6),
            new Point(382.0, 411.6),
            new Point(382.0, 420.6),
            new Point(382.0, 432.6),
            new Point(382.0, 443.6),
            new Point(380.0, 453.6),
            new Point(379.0, 466.6),
            new Point(377.0, 475.6),
            new Point(375.0, 487.6),
            new Point(372.0, 496.6),
            new Point(365.0, 509.6),
            new Point(362.0, 517.6),
            new Point(358.0, 524.6),
            new Point(349.0, 533.6),
            new Point(344.0, 538.6),
            new Point(339.0, 542.6),
            new Point(330.0, 547.6),
            new Point(324.0, 554.6),
            new Point(312.0, 559.6),
            new Point(305.0, 562.6),
            new Point(291.0, 565.6),
            new Point(279.0, 566.6),
            new Point(264.0, 570.6),
            new Point(244.0, 570.6),
            new Point(229.0, 571.6),
            new Point(215.0, 571.6),
            new Point(203.0, 571.6),
            new Point(193.0, 568.6),
            new Point(173.0, 568.6),
            new Point(155.0, 566.6),
            new Point(140.0, 562.6),
            new Point(123.0, 555.6),
            new Point(107.0, 544.6),
            new Point(97.0, 538.6),
            new Point(85.0, 527.6),
            new Point(78.0, 510.6),
            new Point(75.0, 494.6),
            new Point(75.0, 475.6),
            new Point(75.0, 454.6),
            new Point(75.0, 427.6),
            new Point(77.0, 406.6),
            new Point(78.0, 385.6),
            new Point(78.0, 367.6),
            new Point(79.0, 350.6),
            new Point(80.0, 331.6),
            new Point(81.0, 312.6),
            new Point(81.0, 297.6),
            new Point(81.0, 287.6),
            new Point(81.0, 271.6),
            new Point(83.0, 259.6),
            new Point(86.0, 245.6),
            new Point(86.0, 233.6),
            new Point(87.0, 219.6),
            new Point(87.0, 207.6),
            new Point(89.0, 192.6),
            new Point(90.0, 179.6),
            new Point(90.0, 167.6),
            new Point(91.0, 152.6),
            new Point(91.0, 136.6),
            new Point(94.0, 124.6),
            new Point(97.0, 113.6),
            new Point(104.0, 103.6),
            new Point(112.0, 91.6),
            new Point(120.0, 81.6),
            new Point(130.0, 72.6),
            new Point(137.0, 66.6),
            new Point(145.0, 61.6),
            new Point(155.0, 55.6),
            new Point(164.0, 52.6),
            new Point(172.0, 51.6),
            new Point(184.0, 48.6),
            new Point(196.0, 47.6),
            new Point(205.0, 47.6),
            new Point(217.0, 46.6),
            new Point(229.0, 46.6),
            new Point(240.0, 45.6),
        };

        // Load image to code
        private void LoadTrackImage()
        {
            BitmapImage original = new BitmapImage(
                    new Uri("C:/Users/TelemetryK3_06/Downloads/map.jpg", UriKind.Absolute));
            TransformedBitmap rotated = new TransformedBitmap(original, new RotateTransform(90));
            TrackImage.Source = rotated;
        }

        private double CalculateTotalLength()
        {
            double total = 0;
            for (int i = 1; i < CenterlineMap.Length; i++)
            {
                double dx = CenterlineMap[i].X - CenterlineMap[i - 1].X;
                double dy = CenterlineMap[i].Y - CenterlineMap[i - 1].Y;
                total += Math.Sqrt(dx * dx + dy * dy);
            }
            return total;
        }
        private static readonly double LapDistance = 4000.0; // 1 lap = 4000 mét thực

        // Calculating car positions on path    
        private Point GetPositionOnPath(double distanceMeters)
        {
            if (CenterlineMap.Length < 2) return new Point(0, 0);
            // Tỉ lệ: xe đi được bao nhiêu % của 1 lap
            double ratio = (distanceMeters % LapDistance) / LapDistance;
            // Quy ra pixel trên đường vẽ
            double pixelDistance = ratio * _totalLength;

            double traveled = pixelDistance;
            for (int i = 1; i < CenterlineMap.Length; i++)
            {
                double dx = CenterlineMap[i].X - CenterlineMap[i - 1].X;
                double dy = CenterlineMap[i].Y - CenterlineMap[i - 1].Y;
                double segLen = Math.Sqrt(dx * dx + dy * dy);

                if (traveled <= segLen)
                {
                    double t = traveled / segLen;
                    return new Point(
                        CenterlineMap[i - 1].X + t * dx,
                        CenterlineMap[i - 1].Y + t * dy);
                }
                traveled -= segLen;
            }

            return CenterlineMap[CenterlineMap.Length - 1];
        }
        private void RestartSimulation()
        {
            if (CenterlineMap.Length < 2) return;

            _totalLength = CalculateTotalLength();

            if (_carDot == null)
            {
                _carDot = new Ellipse
                {
                    Width = 12,
                    Height = 12,
                    Fill = Brushes.Lime,
                    Stroke = Brushes.White,
                    StrokeThickness = 2
                };
                OverlayCanvas.Children.Add(_carDot);
            }
            if (_timer == null)
            {
                _timer = new DispatcherTimer();
                _timer.Interval = TimeSpan.FromMilliseconds(50);
                _timer.Tick += (s, e) =>
                {
                    double distance = _vm.Distance; // mét thực từ ViewModel
                    Point pos = GetPositionOnPath(distance);
                    Canvas.SetLeft(_carDot, pos.X - 6);
                    Canvas.SetTop(_carDot, pos.Y - 6);
                };
                _timer.Start();
            }
        }

        // Handle click to get Tracking Points and draw lines && calling RestartSimulation
        private void TrackImage_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            Point p = e.GetPosition(TrackImage);
            centerlinePoints.Add(p);
            DrawPoint(p);
            DrawLabel(p, centerlinePoints.Count);

            if (centerlinePoints.Count >= 2)
            {
                DrawLine(centerlinePoints[centerlinePoints.Count - 2], centerlinePoints[centerlinePoints.Count - 1]);
            }
            RestartSimulation();
        }
        private void DrawPoint(Point p)
        {
            Ellipse dot = new Ellipse
            {
                Width = 6,
                Height = 6,
                Fill = Brushes.Red
            };
            Canvas.SetLeft(dot, p.X - 3);
            Canvas.SetTop(dot, p.Y - 3);
            OverlayCanvas.Children.Add(dot);
            drawnElements.Add(dot); // ← THÊM
        }
        private void DrawLabel(Point p, int index)
        {
            TextBlock tb = new TextBlock
            {
                Text = $"{index}: ({p.X:F0}, {p.Y:F0})",
                Foreground = Brushes.Cyan,
                FontSize = 11,
                Background = new SolidColorBrush(Color.FromArgb(120, 0, 0, 0))
            };
            Canvas.SetLeft(tb, p.X + 6);
            Canvas.SetTop(tb, p.Y - 10);
            OverlayCanvas.Children.Add(tb);
            drawnElements.Add(tb); // ← THÊM
        }
        private void DrawLine(Point p1, Point p2)
        {
            Line line = new Line
            {
                X1 = p1.X,
                Y1 = p1.Y,
                X2 = p2.X,
                Y2 = p2.Y,
                Stroke = Brushes.Yellow,
                StrokeThickness = 2
            };
            OverlayCanvas.Children.Add(line);
            drawnElements.Add(line); // ← THÊM
        }
        // Ctrl+Z 
        private void UndoPoint_Click(object sender, RoutedEventArgs e)
        {
            if (centerlinePoints.Count == 0) return;

            int removeCount = centerlinePoints.Count == 1 ? 2 : 3;
            for (int i = 0; i < removeCount; i++)
            {
                if (drawnElements.Count == 0) break;
                UIElement last = drawnElements[drawnElements.Count - 1];
                OverlayCanvas.Children.Remove(last);
                drawnElements.RemoveAt(drawnElements.Count - 1);
            }
            centerlinePoints.RemoveAt(centerlinePoints.Count - 1);
            // Dừng timer nếu còn ít hơn 2 điểm
            if (centerlinePoints.Count < 2)
            {
                _timer?.Stop();
                _timer = null;
                if (_carDot != null)
                {
                    OverlayCanvas.Children.Remove(_carDot);
                    _carDot = null;
                }
            }
            else
            {
                _totalLength = CalculateTotalLength(); // Cập nhật lại độ dài
            }
        }
        private void ClearPoints_Click(object sender, RoutedEventArgs e)
        {
            centerlinePoints.Clear();
            drawnElements.Clear();
            OverlayCanvas.Children.Clear();

            _timer?.Stop();
            _timer = null;
            _carDot = null;
            _totalLength = 0;
        }
        private void CopyCode_Click(object sender, RoutedEventArgs e)
        {
            if (centerlinePoints.Count < 2)
            {
                MessageBox.Show("Chưa đủ điểm!");
                return;
            }

            var sb = new System.Text.StringBuilder();
            sb.AppendLine("private static readonly Point[] CenterlineMap = new Point[]");
            sb.AppendLine("{");
            foreach (var p in centerlinePoints)
                sb.AppendLine($"    new Point({p.X:F1}, {p.Y:F1}),");
            sb.AppendLine("};");
            string code = sb.ToString();
            // Copy vào clipboard
            Clipboard.SetText(code);
            // Lưu ra file txt cạnh exe
            string filePath = System.IO.Path.Combine(
                AppDomain.CurrentDomain.BaseDirectory, "centerline_points.txt");
            System.IO.File.WriteAllText(filePath, code);
            MessageBox.Show($"✅ Đã copy {centerlinePoints.Count} điểm!\n📁 Lưu tại: {filePath}");
        }
    }
}