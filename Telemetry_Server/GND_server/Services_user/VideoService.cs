using System;
using System.Net;
using System.Net.Sockets;
using System.Threading;
using System.Windows.Media.Imaging;
using System.IO;

public class VideoService
{
    private UdpClient _udpClient;
    private Thread _receiveThread;
    private bool _running;

    public event Action<BitmapImage> FrameReceived;

    public void Start(int port = 5005)
    {
        _udpClient = new UdpClient(port);
        _running = true;
        _receiveThread = new Thread(ReceiveLoop) { IsBackground = true };
        _receiveThread.Start();
    }

    public void Stop()
    {
        _running = false;
        _udpClient?.Close();
    }

    private void ReceiveLoop()
    {
        IPEndPoint remote = new IPEndPoint(IPAddress.Any, 0);
        while (_running)
        {
            try
            {
                byte[] data = _udpClient.Receive(ref remote);

                // Decode JPEG bytes -> BitmapImage
                var bitmap = new BitmapImage();
                using (var ms = new MemoryStream(data))
                {
                    bitmap.BeginInit();
                    bitmap.CacheOption = BitmapCacheOption.OnLoad;
                    bitmap.StreamSource = ms;
                    bitmap.EndInit();
                    bitmap.Freeze(); // bắt buộc để dùng cross-thread
                }

                FrameReceived?.Invoke(bitmap);
            }
            catch { /* socket đóng hoặc lỗi packet, bỏ qua */ }
        }
    }
}