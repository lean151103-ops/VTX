using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GNDServer.Services_user
{
    public class LapSummary
    {
        public int LapNumber { get; set; }
        public uint LapTimeMs { get; set; }
        public double MaxSpeed { get; set; }
        public double AvgSpeed { get; set; }
        public string LapTimeText =>
            $"{LapTimeMs / 60000}:{(LapTimeMs % 60000) / 1000:D2}.{LapTimeMs % 1000:D3}";

        public List<(ushort Distance, ushort Speed, ushort Throttle, double Steering)> Points { get; set; } = new List<(ushort Distance, ushort Speed, ushort Throttle, double Steering)>();
        public void Calculate()
        {
            if (Points.Count == 0) return;
            MaxSpeed = Points.Max(p => p.Speed);
            AvgSpeed = Points.Average(p => p.Speed);
        }
    }
}
