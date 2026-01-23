`timescale 1ns/1ps

module tb_uart_bd;

  reg  sys_clock;
  reg  i_rx_0;
  wire TX_0;

  initial begin
    sys_clock = 1'b0;
    i_rx_0    = 1'b1;
  end

  always #4 sys_clock = ~sys_clock; // 125MHz

  design_1_wrapper dut (
    .TX_0(TX_0),
    .i_rx_0(i_rx_0),
    .sys_clock(sys_clock)
  );

  parameter integer CLKS_PER_BIT = 1085;

  task wait_sys;
    input integer n;
    integer k;
    begin
      for (k = 0; k < n; k = k + 1)
        @(posedge sys_clock);
    end
  endtask

  task send_bit;
    input b;
    begin
      i_rx_0 = b;
      wait_sys(CLKS_PER_BIT);
    end
  endtask

  task send_byte;
    input [7:0] data;
    integer i;
    begin
      send_bit(1'b1);
      send_bit(1'b0);
      for (i = 0; i < 8; i = i + 1)
        send_bit(data[i]);
      send_bit(1'b1);
    end
  endtask

  initial begin
    wait_sys(CLKS_PER_BIT * 50);

    send_byte(8'h55);
    wait_sys(CLKS_PER_BIT * 20);

    send_byte(8'hA5);
    wait_sys(CLKS_PER_BIT * 20);
    
    send_byte(8'h55);
    wait_sys(CLKS_PER_BIT * 20);
    
    send_byte(8'h55);
    wait_sys(CLKS_PER_BIT * 20);

    $finish;
  end

endmodule
