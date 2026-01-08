import serial
import time
import random

# ========= Cấu hình UART =========
ser = serial.Serial(
    port='COM3',                 # đổi theo máy bạn
    baudrate=115200,
    bytesize=serial.EIGHTBITS,
    parity=serial.PARITY_NONE,
    stopbits=serial.STOPBITS_ONE,
    timeout=1
)

# ========== Cấu hình Frame Data =========
HEADER1 = 0xAA
HEADER2 = 0x55
PAYLOAD_LEN = 70
POLYNOMIAL = 0x07

# ========= CRC-8 =========
def calcCRC(data: bytes):
    crc = 0x00
    for b in data:
        crc ^= b
        for _ in range(8):
            if crc & 0x80:
                crc = (crc << 1) ^ POLYNOMIAL
            else:
                crc <<= 1
            crc &= 0xFF
    return crc

def send_bytes(frame: bytes):
    ser.write(frame)
    ser.flush()

def check_frame(frame: bytes) -> bool:  # Truyền vào check_frame data gồm payload + crc
    if len(frame) < 2:
        return False
    payload = frame[:-1]
    crc_received = frame[-1]
    crc_calculated = calcCRC(payload)
    return crc_received == crc_calculated

def CreateFrame():  # Tạo frame với: HEADER1 + HEADER2 + 1byte LEN + 70bytes PAYLOAD + 1byte CRC
    payload = bytes(random.getrandbits(8) for _ in range(PAYLOAD_LEN))
    length = len(payload)
    length_bytes = bytes([length])
    crc = calcCRC(payload)

    frame = bytes([HEADER1, HEADER2]) + length_bytes + payload + bytes([crc])
    return frame


def receive_frame():
    while ser.in_waiting >= 2:
        if ser.read(1)[0] == HEADER1:
            if ser.read(1)[0] == HEADER2:
                # Đã thấy Header, đọc tiếp byte Length
                len_byte = ser.read(1)[0]
                # Đọc Payload + 1 byte CRC
                remaining_data = ser.read(len_byte + 1)

                if len(remaining_data) < len_byte + 1:
                    return None                     # Không đủ dữ liệu
                return remaining_data               # Trả về payload + CRC

if __name__ == "__main__":
    OK_frame = 0
    BAD_frame = 0
    try:
        while True:
            # Gửi dữ liệu
            frame_to_send = CreateFrame()
            ser.write(frame_to_send)
            print(f"Sent frame, CRC: {frame_to_send[-1]:02X}")

            # Đợi một chút để thiết bị phản hồi (nếu cần)
            time.sleep(0.005)

            # Nhận dữ liệu
            payload_crc = receive_frame()
            is_frame_ok = check_frame(payload_crc)

            if is_frame_ok:
                OK_frame = OK_frame +1
            else:
                BAD_frame = BAD_frame +1
            print(f"Good Frame: {OK_frame}, Bad Frame: {BAD_frame}")

    except KeyboardInterrupt:
        print("Dừng chương trình")
    finally:
        ser.close()
