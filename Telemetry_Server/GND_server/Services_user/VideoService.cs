using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Threading;
using System.Windows.Media.Imaging;

public class VideoService
{
    private UdpClient _udpClient;
    private Thread _receiveThread;
    private bool _running;

    // Lưu trữ các mảnh của frame: Dictionary<frameId, danh sách các mảnh>
    private readonly Dictionary<uint, byte[][]> _frameBuffers = new Dictionary<uint, byte[][]>();
    private readonly Dictionary<uint, int> _chunksReceived = new Dictionary<uint, int>();

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
                byte[] packet = _udpClient.Receive(ref remote);
                if (packet.Length < 8) continue;

                uint fid = ((uint)packet[0] << 24) | ((uint)packet[1] << 16) | ((uint)packet[2] << 8) | packet[3];
                ushort chunkIndex = (ushort)(((ushort)packet[4] << 8) | packet[5]);
                ushort totalChunks = (ushort)(((ushort)packet[6] << 8) | packet[7]);

                ProcessChunk(fid, chunkIndex, totalChunks, packet.Skip(8).ToArray());
            }
            catch { /* Socket đóng hoặc lỗi */ }
        }
    }

    private void ProcessChunk(uint fid, ushort index, ushort total, byte[] payload)
    {
        if (!_frameBuffers.ContainsKey(fid))
        {
            _frameBuffers[fid] = new byte[total][];
            _chunksReceived[fid] = 0;

            if (_frameBuffers.Count > 5)
            {
                var oldest = _frameBuffers.Keys.Min();
                _frameBuffers.Remove(oldest);
                _chunksReceived.Remove(oldest);
            }
        }
        if (_frameBuffers[fid][index] == null)
        {
            _frameBuffers[fid][index] = payload;
            _chunksReceived[fid]++;
        }
        if (_chunksReceived[fid] == total)
        {
            AssembleAndDispatch(fid);
        }
    }

    private void AssembleAndDispatch(uint fid)
    {
        try
        {
            // Ghép tất cả các mảnh lại thành một mảng byte duy nhất
            byte[] completeFrame;
            using (MemoryStream ms = new MemoryStream())
            {
                foreach (var chunk in _frameBuffers[fid])
                {
                    ms.Write(chunk, 0, chunk.Length);
                }
                completeFrame = ms.ToArray();
            }
            var bitmap = new BitmapImage();
            using (var ms = new MemoryStream(completeFrame))
            {
                bitmap.BeginInit();
                bitmap.CacheOption = BitmapCacheOption.OnLoad;
                bitmap.StreamSource = ms;
                bitmap.EndInit();
                bitmap.Freeze();
            }

            FrameReceived?.Invoke(bitmap);
        }
        catch (Exception ex)
        {
            Console.WriteLine("Lỗi giải mã frame: " + ex.Message);
        }
        finally
        {
            _frameBuffers.Remove(fid);
            _chunksReceived.Remove(fid);
        }
    }
}