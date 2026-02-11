`timescale 1ns/1ps

module tb;

  reg sys_clock = 1'b0;
  reg i_rx_0    = 1'b1;   // UART idle high

  // 100MHz
  always #4 sys_clock = ~sys_clock;

  // DUT (??i tên port n?u wrapper khác)
  design_1_wrapper dut (
    .sys_clock(sys_clock),
    .i_rx_0(i_rx_0)
  );

  // 115200 baud
  localparam integer BIT_NS = 8681;

  // payload global 100 bytes
  reg [7:0] payload_mem [0:99];

  // CRC32 vars
  reg [31:0] crc;

  integer i;

  // ===== CRC32 update 1 byte (poly 0xEDB88320) =====
  function [31:0] crc32_update_byte;
    input [31:0] crc_in;
    input [7:0]  data;
    integer k;
    reg [31:0] c;
    begin
      c = crc_in ^ {24'h0, data};
      for (k = 0; k < 8; k = k + 1) begin
        if (c[0]) c = (c >> 1) ^ 32'hEDB88320;
        else      c = (c >> 1);
      end
      crc32_update_byte = c;
    end
  endfunction

  // ===== compute CRC over payload_mem[0..99] =====
  task calc_crc32_payload_100;
    output [31:0] crc_out;
    integer j;
    reg [31:0] c;
    begin
      c = 32'hFFFF_FFFF;
      for (j = 0; j < 100; j = j + 1) begin
        c = crc32_update_byte(c, payload_mem[j]);
      end
      crc_out = c ^ 32'hFFFF_FFFF;
    end
  endtask

  // ===== UART send byte =====
  task uart_send_byte;
    input [7:0] b;
    integer n;
    begin
      // start
      i_rx_0 = 1'b0; #(BIT_NS);

      // data LSB-first
      for (n = 0; n < 8; n = n + 1) begin
        i_rx_0 = b[n];
        #(BIT_NS);
      end

      // stop
      i_rx_0 = 1'b1; #(BIT_NS);

      // gap
      #(BIT_NS);
    end
  endtask

  // ===== send one full frame using payload_mem + computed crc =====
  task send_one_frame;
    input [15:0] seq;
    integer j;
    reg [31:0] c_local;
    begin
      calc_crc32_payload_100(c_local);

      $display("=== Send 1 frame ===");
      $display("SEQ = 0x%04h", seq);
      $display("CRC(payload) = 0x%08h", c_local);

      // Header
      uart_send_byte(8'hAA);
      uart_send_byte(8'h55);

      // SEQ 2 bytes little-endian
      uart_send_byte(seq[7:0]);
      uart_send_byte(seq[15:8]);

      // Payload 100 bytes
      for (j = 0; j < 100; j = j + 1)
        uart_send_byte(payload_mem[j]);

      // CRC32 4 bytes LSB-first
      uart_send_byte(c_local[7:0]);
      uart_send_byte(c_local[15:8]);
      uart_send_byte(c_local[23:16]);
      uart_send_byte(c_local[31:24]);
    end
  endtask

  initial begin
    // init payload: 0..99
    for (i = 0; i < 100; i = i + 1)
      payload_mem[i] = i[7:0];

    // wait settle
    #(1_000_000); // 1ms

    // send
    send_one_frame(16'h0001);

    #(5_000_000); // 5ms
    $finish;
  end

endmodule
