`timescale 1ns/1ps

module tb;

  // ================== CLOCK + UART LINE ==================
  reg sys_clock = 1'b0;
  reg i_rx_0    = 1'b1;       // UART idle = 1
  wire o_tx_0;                // N?u DUT có ??u ra TX

  // 125 MHz => toggle m?i 4ns
  always #4 sys_clock = ~sys_clock;

  // Baudrate 
  localparam integer BIT_NS = 1085;

  // ================== DUT ==================
  design_1_wrapper dut (
    .sys_clock(sys_clock),
    .i_rx_0(i_rx_0)
    // .o_tx_0(o_tx_0) // C?m vào n?u c?n quan sát ph?n h?i
  );

  // ================== TEST DATA ==================
  reg  [7:0]  payload_mem [0:255]; // T?ng lên 256 bytes ?? test ?a d?ng
  reg  [31:0] crc_display;         // ?? quan sát trên waveform
  integer i;

  // ================== CRC32 (reflected) ==================
  function [31:0] crc32_update_byte;
    input [31:0] crc_in;
    input [7:0]  data;
    integer k;
    reg [31:0] c;
    begin
      c = crc_in ^ {24'h0, data};
      for (k=0; k<8; k=k+1)
        c = c[0] ? ((c>>1) ^ 32'hEDB88320) : (c>>1);
      crc32_update_byte = c;
    end
  endfunction

  // Task tính CRC cho Frame: H1 + H2 + SEQ(2) + LEN(1) + PAYLOAD(len)
  task calc_crc_frame;
    input [15:0] seq;
    input [7:0]  len;
    output [31:0] crc_out;
    integer j;
    reg [31:0] c;
    begin
      c = 32'hFFFF_FFFF;
      c = crc32_update_byte(c, 8'hAA);   // Header1
      c = crc32_update_byte(c, 8'h55);   // Header2
      c = crc32_update_byte(c, seq[7:0]); // SEQ Low
      c = crc32_update_byte(c, seq[15:8]);// SEQ High
      c = crc32_update_byte(c, len);      // Byte Length (Quan tr?ng: ph?i có n?u code nh?n yêu c?u)
      
      for (j=0; j<len; j=j+1)
        c = crc32_update_byte(c, payload_mem[j]);

      crc_out = c ^ 32'hFFFF_FFFF;
    end
  endtask

  // ================== UART SEND 1 BYTE ==================
  task uart_send_byte;
    input [7:0] b;
    integer n;
    begin
      i_rx_0 = 1'b0; #(BIT_NS); // Start bit
      for (n=0; n<8; n=n+1) begin
        i_rx_0 = b[n];
        #(BIT_NS);
      end
      i_rx_0 = 1'b1; #(BIT_NS); // Stop bit
    end
  endtask

  // ================== SEND 1 FULL FRAME ==================
  task send_frame;
    input [15:0] seq;
    input [7:0]  len; // ?? dài payload thay ??i
    reg   [31:0] c_local;
    integer j;
    begin
      calc_crc_frame(seq, len, c_local);
      crc_display = c_local;

      $display("[%0t] Sending Frame: SEQ=%h, LEN=%d, CRC=%h", $time, seq, len, c_local);

      // Header
      uart_send_byte(8'hAA);
      uart_send_byte(8'h55);

      // SEQ (2 bytes) little-endian
      uart_send_byte(seq[7:0]);
      uart_send_byte(seq[15:8]);

      // LENGTH byte
      uart_send_byte(len);

      // Payload (s? l??ng byte d?a trên tham s? len)
      for (j=0; j<len; j=j+1)
        uart_send_byte(payload_mem[j]);

      // CRC32 (4 bytes) little-endian (LSB first)
      uart_send_byte(c_local[7:0]);
      uart_send_byte(c_local[15:8]);
      uart_send_byte(c_local[23:16]);
      uart_send_byte(c_local[31:24]);
    end
  endtask

  // ================== MAIN TEST ==================
  initial begin
    // Reset ban ??u
    i_rx_0 = 1'b1;
    #(1000);

    // -------- FRAME 1: Payload 50 bytes --------
    for (i=0; i<50; i=i+1) payload_mem[i] = i[7:0];
    #(100_000); 
    send_frame(16'h0001, 8'd3);

    // -------- FRAME 2: Payload 120 bytes --------
    #(20_000); 
    for (i=0; i<120; i=i+1) payload_mem[i] = (i + 8'h10);
    send_frame(16'h0002, 8'd4);

    // -------- FRAME 3: Payload 200 bytes --------
    #(20_000);
    for (i=0; i<200; i=i+1) payload_mem[i] = (i + 8'h20);
    send_frame(16'h0003, 8'd5);

    #(500_000);
    $display("Testbench finished at %0t", $time);
    $finish;
  end

endmodule