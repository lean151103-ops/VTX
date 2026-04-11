using GNDServer.Viewmodels_user;
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
using WinForms = System.Windows.Forms;

namespace GNDServer
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
            //var source = PresentationSource.FromVisual(this);
            //this.Loaded += (s, e) =>
            //{
            //    var src = PresentationSource.FromVisual(this);
            //    double dpiX = src.CompositionTarget.TransformToDevice.M11;
            //    double dpiY = src.CompositionTarget.TransformToDevice.M22;
            //    MessageBox.Show($"DPI Scale: X={dpiX}, Y={dpiY}\n" +
            //                   $"Window size: {this.ActualWidth}x{this.ActualHeight}\n" +
            //                   $"Screen: {SystemParameters.PrimaryScreenWidth}x{SystemParameters.PrimaryScreenHeight}");
            //};
            RestartSimulation();
        }
        private void MainWindow_Closing(object sender, CancelEventArgs e)
        {
            if (_vm != null)
                _vm.Dispose();
        }

        // Load image to code
        private void LoadTrackImage()
        {
            BitmapImage original = new BitmapImage(
                    new Uri("D:/Downloads/map.jpg", UriKind.Absolute));
            TransformedBitmap rotated = new TransformedBitmap(original, new RotateTransform(90));
            TrackImage.Source = rotated;
        }

        private static readonly Point[] CenterlineMap = new Point[]
        {
            new Point(282.8, 61.2),
            new Point(299.6, 64.4),
            new Point(318.0, 72.4),
            new Point(329.2, 78.0),
            new Point(339.6, 86.0),
            new Point(349.2, 95.6),
            new Point(358.8, 104.4),
            new Point(368.4, 117.2),
            new Point(373.2, 126.0),
            new Point(378.0, 138.8),
            new Point(380.4, 143.6),
            new Point(382.8, 155.6),
            new Point(386.8, 168.4),
            new Point(386.8, 181.2),
            new Point(386.8, 190.8),
            new Point(387.6, 203.6),
            new Point(389.2, 218.0),
            new Point(389.2, 231.6),
            new Point(389.2, 247.6),
            new Point(387.6, 262.0),
            new Point(386.8, 274.8),
            new Point(386.8, 294.8),
            new Point(386.8, 310.8),
            new Point(386.0, 320.4),
            new Point(384.4, 339.6),
            new Point(384.4, 355.6),
            new Point(384.4, 365.2),
            new Point(383.6, 376.4),
            new Point(383.6, 389.2),
            new Point(384.4, 400.4),
            new Point(383.6, 418.0),
            new Point(384.4, 430.0),
            new Point(382.8, 441.2),
            new Point(382.8, 451.6),
            new Point(382.0, 464.4),
            new Point(381.2, 478.0),
            new Point(381.2, 489.2),
            new Point(381.2, 503.6),
            new Point(378.8, 516.4),
            new Point(378.0, 528.4),
            new Point(375.6, 538.8),
            new Point(371.6, 555.6),
            new Point(369.2, 564.4),
            new Point(365.2, 575.6),
            new Point(361.2, 585.2),
            new Point(355.6, 592.4),
            new Point(346.8, 599.6),
            new Point(338.8, 605.2),
            new Point(330.0, 610.0),
            new Point(322.8, 615.6),
            new Point(313.2, 622.0),
            new Point(304.4, 626.0),
            new Point(290.8, 629.2),
            new Point(267.6, 630.8),
            new Point(250.8, 632.4),
            new Point(233.2, 631.6),
            new Point(220.4, 632.4),
            new Point(208.4, 631.6),
            new Point(188.4, 631.6),
            new Point(166.8, 631.6),
            new Point(147.6, 630.0),
            new Point(122.8, 626.0),
            new Point(98.0, 618.8),
            new Point(84.4, 609.2),
            new Point(67.6, 591.6),
            new Point(54.8, 568.4),
            new Point(47.6, 553.2),
            new Point(39.6, 522.8),
            new Point(35.6, 492.4),
            new Point(37.2, 474.0),
            new Point(38.0, 448.4),
            new Point(38.0, 430.0),
            new Point(37.2, 413.2),
            new Point(38.0, 395.6),
            new Point(39.6, 382.8),
            new Point(39.6, 364.4),
            new Point(39.6, 345.2),
            new Point(38.8, 321.2),
            new Point(40.4, 305.2),
            new Point(42.8, 289.2),
            new Point(45.2, 275.6),
            new Point(45.2, 256.4),
            new Point(47.6, 235.6),
            new Point(47.6, 220.4),
            new Point(49.2, 205.2),
            new Point(49.2, 186.0),
            new Point(50.8, 169.2),
            new Point(55.6, 152.4),
            new Point(64.4, 131.6),
            new Point(74.8, 111.6),
            new Point(86.0, 99.6),
            new Point(102.0, 87.6),
            new Point(115.6, 78.0),
            new Point(127.6, 74.8),
            new Point(144.4, 70.0),
            new Point(157.2, 66.0),
            new Point(171.6, 62.8),
            new Point(184.4, 60.4),
            new Point(201.2, 58.0),
            new Point(214.0, 57.2),
            new Point(230.8, 56.4),
            new Point(245.2, 54.8),
            new Point(255.6, 54.8),
            new Point(269.2, 55.6),
            new Point(282.0, 58.0),
        };

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
                    double distance = _vm.Distance;
                    Point rawPos = GetPositionOnPath(distance);
                    Point canvasPos = ConvertToCanvasPoint(rawPos); 
                    Canvas.SetLeft(_carDot, canvasPos.X - 6);
                    Canvas.SetTop(_carDot, canvasPos.Y - 6);
                };
                _timer.Start();
            }
        }
        private Point ConvertToCanvasPoint(Point originalPoint)
        {
            if (TrackImage.Source == null) return originalPoint;

            double imgNaturalW = TrackImage.Source.Width;
            double imgNaturalH = TrackImage.Source.Height;
            double controlW = TrackImage.ActualWidth;
            double controlH = TrackImage.ActualHeight;

            // Tính scale với Stretch="Uniform"
            double scale = Math.Min(controlW / imgNaturalW, controlH / imgNaturalH);

            // Kích thước ảnh sau khi scale
            double renderedW = imgNaturalW * scale;
            double renderedH = imgNaturalH * scale;

            // Offset letterbox (căn giữa)
            double offsetX = (controlW - renderedW) / 2.0;
            double offsetY = (controlH - renderedH) / 2.0;

            return new Point(
                originalPoint.X * scale + offsetX,
                originalPoint.Y * scale + offsetY
            );
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
            drawnElements.Add(dot); 
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
            drawnElements.Add(tb); 
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