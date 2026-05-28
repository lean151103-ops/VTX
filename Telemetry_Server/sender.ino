#include <Arduino.h>
#include <math.h>

// ─────────────────────────────────────────────
//  UART2 → Zigbee CC2530
// ─────────────────────────────────────────────
HardwareSerial ZigbeeSerial(2);

#define ZIGBEE_RX    16
#define ZIGBEE_TX    17
#define ZIGBEE_BAUD  115200

#define SEND_PERIOD_US  10000UL   // 10ms = 10000µs
// ─────────────────────────────────────────────
//  CONSTANTS
// ─────────────────────────────────────────────
#define LAP_DISTANCE_M  4000.0
#define PI_VAL          3.14159265358979

const uint32_t POLY_CRC32 = 0xEDB88320u;

// ─────────────────────────────────────────────
//  ═══════════════════════════════════════════
//  LAYER 1 – NGUỒN DỮ LIỆU
//  Hiện tại: giả lập từ bảng nội suy
//           getSensorSpeed() / getSensorSteering() / getSensorThrottle()
//  ═══════════════════════════════════════════
// ─────────────────────────────────────────────

// Bảng mô phỏng tốc độ & góc lái, chu kỳ 30 s
#define SIM_TABLE_SIZE 16
float simTime[SIM_TABLE_SIZE]     = {  0,  2,  4,  6,  8, 10, 12, 14, 16, 18,  20,  22,  24,  26, 28, 30 };
float simSpeed[SIM_TABLE_SIZE]    = {  0, 40, 80,120,160,200,240,280,300,260, 220, 180, 140, 100, 60, 20 };
float simSteering[SIM_TABLE_SIZE] = {  0,  2,  4,  6,  4,  2,  1,  0,  0, -2,  -5,  -8, -10,  -6, -3,  0 };

float _interpolate(float t, float* tArr, float* vArr, int n) {
  if (t <= tArr[0])   return vArr[0];
  if (t >= tArr[n-1]) return vArr[n-1];
  for (int i = 0; i < n - 1; i++) {
    if (t >= tArr[i] && t <= tArr[i+1]) {
      float ratio = (t - tArr[i]) / (tArr[i+1] - tArr[i]);
      return vArr[i] + ratio * (vArr[i+1] - vArr[i]);
    }
  }
  return vArr[n-1];
}

// -- Hàm lấy dữ liệu đầu vào --
float getSensorSpeed() {
  // Giả lập: nội suy từ bảng theo chu kỳ 30 s
  float tCycle = fmod(millis() / 1000.0f, 30.0f);
  return _interpolate(tCycle, simTime, simSpeed, SIM_TABLE_SIZE);
}

float getSensorSteering() {
  // Giả lập: nội suy từ bảng theo chu kỳ 30 s
  // Trả về độ, âm = trái, dương = phải, range -35..35
  float tCycle = fmod(millis() / 1000.0f, 30.0f);
  return _interpolate(tCycle, simTime, simSteering, SIM_TABLE_SIZE);
}

float getSensorThrottle() {
  // Giả lập: tỉ lệ thuận với speed (0..300 km/h → 0..100%)
  // Thực tế: đọc từ cảm biến bàn đạp ga
  return constrain(getSensorSpeed() / 300.0f * 100.0f, 0.0f, 100.0f);
}

// ─────────────────────────────────────────────
//  ═══════════════════════════════════════════
//  LAYER 2 – TÍNH TOÁN DỰA TRÊN SENSOR
//  distance, lapTime, lapCounter
//  ═══════════════════════════════════════════
// ─────────────────────────────────────────────

double   distance   = 0.0;
uint16_t lapCounter = 0;
double   lapTime    = 0.0;   // s
uint32_t lastMs     = 0;

void updateLapData(float speedKmh, float steerDeg, double dt) {
  lapTime += dt;

  // distance = tích phân (tốc độ theo hướng thẳng) × dt
  // cos(steering) chiếu tốc độ về hướng tiến thẳng của xe
  double speedMs  = speedKmh / 3.6;
  double steerRad = steerDeg * PI_VAL / 180.0;
  distance += speedMs * cos(steerRad) * dt;

  // Qua vạch đích → sang lap mới
  while (distance >= LAP_DISTANCE_M) {
    distance   -= LAP_DISTANCE_M;
    lapCounter++;
    lapTime     = 0.0;
  }
}

// ─────────────────────────────────────────────
//  ENCODING HELPERS
// ─────────────────────────────────────────────

// steering -35..35 ° → 0..1000  (500 = 0°)
uint16_t encodeSteering(float deg) {
  deg = constrain(deg, -35.0f, 35.0f);
  return (uint16_t)constrain(500.0f + (deg / 35.0f) * 500.0f, 0.0f, 1000.0f);
}

// CRC-32 
uint32_t crc32(uint8_t* data, uint8_t len) {
  uint32_t crc = 0xFFFFFFFFu;
  for (uint8_t i = 0; i < len; i++) {
    crc ^= data[i];
    for (int j = 0; j < 8; j++)
      crc = (crc & 1) ? ((crc >> 1) ^ POLY_CRC32) : (crc >> 1);
  }
  return crc ^ 0xFFFFFFFFu;
}

// ─────────────────────────────────────────────
//  BUILD & SEND FRAME
// ─────────────────────────────────────────────
unsigned long last_time = 0;
uint32_t seqNum = 0;

void sendFrame() {
  uint32_t nowMs = millis();

  // Delta time
  if (lastMs == 0) lastMs = nowMs;
  double dt = (nowMs - lastMs) / 1000.0;
  lastMs = nowMs;

  // ── Layer 1: lấy giá trị đầu vào ──
  float speedKmh  = getSensorSpeed();
  float steerDeg  = getSensorSteering();
  float throttle  = getSensorThrottle();

  // ── Layer 2: tính lap data từ layer 1 ──
  updateLapData(speedKmh, steerDeg, dt);

  // ── Encode ──
  uint16_t uSpeed    = (uint16_t)speedKmh;
  uint16_t uThrottle = (uint16_t)throttle;
  uint16_t uSteering = encodeSteering(steerDeg);
  uint16_t uDist     = (uint16_t)distance;
  uint32_t uLapTime  = (uint32_t)(lapTime * 1000.0);

  // ── Build frame (25 bytes) ──
  // AA 55 | SEQ 4B | LEN=14 | lapCounter 2B | lapTime 4B
  // | distance 2B | speed 2B | throttle 2B | steering 2B | CRC 4B
  uint8_t frame[29];
  uint8_t i = 0;

  frame[i++] = 0xAA;
  frame[i++] = 0x55;

  frame[i++] = (seqNum >>  0) & 0xFF;
  frame[i++] = (seqNum >>  8) & 0xFF;
  frame[i++] = (seqNum >> 16) & 0xFF;
  frame[i++] = (seqNum >> 24) & 0xFF;

  frame[i++] = 18;  // LEN_PAYLOAD

  frame[i++] = (lapCounter >>  0) & 0xFF;
  frame[i++] = (lapCounter >>  8) & 0xFF;

  frame[i++] = (uLapTime >>  0) & 0xFF;
  frame[i++] = (uLapTime >>  8) & 0xFF;
  frame[i++] = (uLapTime >> 16) & 0xFF;
  frame[i++] = (uLapTime >> 24) & 0xFF;

  frame[i++] = (uDist >>  0) & 0xFF;
  frame[i++] = (uDist >>  8) & 0xFF;

  frame[i++] = (uSpeed >>  0) & 0xFF;
  frame[i++] = (uSpeed >>  8) & 0xFF;

  frame[i++] = (uThrottle >>  0) & 0xFF;
  frame[i++] = (uThrottle >>  8) & 0xFF;

  frame[i++] = (uSteering >>  0) & 0xFF;
  frame[i++] = (uSteering >>  8) & 0xFF;

  unsigned long tx_timestamp = micros();
  unsigned long elapsed = tx_timestamp - last_time;
  last_time = tx_timestamp;

  frame[i++] = (elapsed >> 0) & 0xFF;
  frame[i++] = (elapsed >> 8) & 0xFF;
  frame[i++] = (elapsed >> 16) & 0xFF;
  frame[i++] = (elapsed >> 24) & 0xFF;

  uint32_t crc = crc32(frame, i);
  frame[i++] = (crc >>  0) & 0xFF;
  frame[i++] = (crc >>  8) & 0xFF;
  frame[i++] = (crc >> 16) & 0xFF;
  frame[i++] = (crc >> 24) & 0xFF;

  // ── Gửi ra UART2 → Zigbee CC2530 ──
  ZigbeeSerial.write(frame, i);

  // ── Debug USB Serial Monitor ──
  // Serial.print("Tx #");               Serial.print(seqNum);
  // Serial.print(" | lap=");            Serial.print(lapCounter);
  // Serial.print(" | lapTime=");        Serial.print(uLapTime);     Serial.print("ms");
  // Serial.print(" | dist=");           Serial.print(uDist);        Serial.print("m");
  // Serial.print(" | spd=");            Serial.print(uSpeed);       Serial.print("km/h");
  // Serial.print(" | thr=");            Serial.print(uThrottle);    Serial.print("%");
  // Serial.print(" | elapsed = ");      Serial.print(elapsed);      Serial.print(" micro s");
  // Serial.print(" | steer=");          Serial.print(steerDeg, 1);  Serial.println("°");
  seqNum++;
}

// ─────────────────────────────────────────────
//  SETUP / LOOP
// ─────────────────────────────────────────────
void setup() {
  Serial.begin(115200);
  ZigbeeSerial.begin(ZIGBEE_BAUD, SERIAL_8N1, ZIGBEE_RX, ZIGBEE_TX);
  Serial.println("ESP32 Telemetry started | TX=GPIO17  RX=GPIO16");
  lastMs = millis();
}

void loop() {
  static uint32_t nextSend = 0;

  uint32_t now = micros();
  if ((int32_t)(now - nextSend) >= 0) {
    nextSend += SEND_PERIOD_US;
    sendFrame();
  }
}
