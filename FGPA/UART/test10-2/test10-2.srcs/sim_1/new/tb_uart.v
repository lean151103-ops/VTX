`timescale 1ns/1ps

module tb_uart;

  // ================== CLOCK + UART LINE ==================
  reg sys_clock = 1'b0;
  reg i_rx_0    = 1'b1;       // UART idle = 1

  // 125 MHz => toggle m?i 4ns
  always #4 sys_clock = ~sys_clock;

  // 115200 baud => 1 bit ~ 8680.56 ns
  localparam integer BIT_NS = 8681;

  // ================== DUT ==================
  design_1_wrapper dut (
    .sys_clock(sys_clock),
    .i_rx_0(i_rx_0)
  );

  // ================== TEST DATA ==================
  reg  [7:0]  payload_mem [0:99]; // 100 bytes
  reg  [31:0] crc;                // ?? xem trên waveform
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

  task calc_crc_payload_100;
    output [31:0] crc_out;
    integer j;
    reg [31:0] c;
    begin
      c = 32'hFFFF_FFFF;
      for (j=0; j<100; j=j+1)
        c = crc32_update_byte(c, payload_mem[j]);
      crc_out = c ^ 32'hFFFF_FFFF;
    end
  endtask

  // ================== UART SEND 1 BYTE ==================
  task uart_send_byte;
    input [7:0] b;
    integer n;
    begin
      i_rx_0 = 1'b0; #(BIT_NS);          // start
      for (n=0; n<8; n=n+1) begin        // data LSB-first
        i_rx_0 = b[n];
        #(BIT_NS);
      end
      i_rx_0 = 1'b1; #(BIT_NS);          // stop
      #(BIT_NS);                          // gap (optional)
    end
  endtask

  // ================== SEND 1 FULL FRAME ==================
  task send_frame;
    input [15:0] seq;
    reg   [31:0] c_local;
    integer j;
    begin
      // CRC trên payload
      calc_crc_payload_100(c_local);
      crc = c_local; // ?? nhìn trên waveform

      $display("Send frame: SEQ=%h CRC=%h", seq, c_local);

      // Header
      uart_send_byte(8'hAA);
      uart_send_byte(8'h55);

      // SEQ (2 bytes) little-endian
      uart_send_byte(seq[7:0]);
      uart_send_byte(seq[15:8]);

      // Payload 100 bytes
      for (j=0; j<100; j=j+1)
        uart_send_byte(payload_mem[j]);

      // CRC32 (4 bytes) LSB-first
      uart_send_byte(c_local[7:0]);
      uart_send_byte(c_local[15:8]);
      uart_send_byte(c_local[23:16]);
      uart_send_byte(c_local[31:24]);
    end
  endtask

  // ================== MAIN ==================
  initial begin
    for (i=0; i<100; i=i+1)
      payload_mem[i] = i[7:0];

    #(1_000_000); // 1ms
    send_frame(16'h0001);

    #(5_000_000); // 5ms
    $finish;
  end

endmodule
