//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
//Date        : Fri Jan 23 12:07:45 2026
//Host        : DESKTOP-518F4EG running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=8,numReposBlks=8,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=5,numPkgbdBlks=0,bdsource=USER,da_board_cnt=1,da_clkrst_cnt=2,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (TX_0,
    i_rx_0,
    led_0_rx_0,
    led_1_rx_0,
    led_2_tx_0,
    led_3_tx_0,
    sys_clock);
  output TX_0;
  input i_rx_0;
  output led_0_rx_0;
  output led_1_rx_0;
  output led_2_tx_0;
  output led_3_tx_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.SYS_CLOCK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.SYS_CLOCK, CLK_DOMAIN design_1_sys_clock, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input sys_clock;

  wire clk_wiz_0_clk_out1;
  wire [7:0]fifo_generator_0_dout;
  wire fifo_generator_0_empty;
  wire fifo_generator_0_full;
  wire i_rx_0_1;
  wire sys_clock_1;
  wire test_led_0_led_0_rx;
  wire test_led_0_led_1_rx;
  wire test_led_0_led_2_tx;
  wire test_led_0_led_3_tx;
  wire uart_rx_0_o_data_avail;
  wire [7:0]uart_rx_0_o_data_byte;
  wire uart_tx_0_TX;
  wire uart_tx_0_tdone;
  wire [7:0]wrapper_rx_fifo_0_din;
  wire wrapper_rx_fifo_0_wr_en;
  wire wrapper_tx_fifo_0_fifo_rd_en;
  wire [7:0]wrapper_tx_fifo_0_tx_tdin;
  wire wrapper_tx_fifo_0_tx_tenable;
  wire [0:0]xlconstant_0_dout;

  assign TX_0 = uart_tx_0_TX;
  assign i_rx_0_1 = i_rx_0;
  assign led_0_rx_0 = test_led_0_led_0_rx;
  assign led_1_rx_0 = test_led_0_led_1_rx;
  assign led_2_tx_0 = test_led_0_led_2_tx;
  assign led_3_tx_0 = test_led_0_led_3_tx;
  assign sys_clock_1 = sys_clock;
  design_1_clk_wiz_0_0 clk_wiz_0
       (.clk_in1(sys_clock_1),
        .clk_out1(clk_wiz_0_clk_out1));
  design_1_fifo_generator_0_0 fifo_generator_0
       (.clk(clk_wiz_0_clk_out1),
        .din(wrapper_rx_fifo_0_din),
        .dout(fifo_generator_0_dout),
        .empty(fifo_generator_0_empty),
        .full(fifo_generator_0_full),
        .rd_en(wrapper_tx_fifo_0_fifo_rd_en),
        .wr_en(wrapper_rx_fifo_0_wr_en));
  design_1_test_led_0_0 test_led_0
       (.data_rx(uart_rx_0_o_data_byte),
        .data_tx(wrapper_tx_fifo_0_tx_tdin),
        .led_0_rx(test_led_0_led_0_rx),
        .led_1_rx(test_led_0_led_1_rx),
        .led_2_tx(test_led_0_led_2_tx),
        .led_3_tx(test_led_0_led_3_tx));
  design_1_uart_rx_0_0 uart_rx_0
       (.clock(clk_wiz_0_clk_out1),
        .i_rx(i_rx_0_1),
        .o_data_avail(uart_rx_0_o_data_avail),
        .o_data_byte(uart_rx_0_o_data_byte));
  design_1_uart_tx_0_0 uart_tx_0
       (.TX(uart_tx_0_TX),
        .tclock(clk_wiz_0_clk_out1),
        .tdin(wrapper_tx_fifo_0_tx_tdin),
        .tdone(uart_tx_0_tdone),
        .tenable(wrapper_tx_fifo_0_tx_tenable));
  design_1_wrapper_rx_fifo_0_0 wrapper_rx_fifo_0
       (.data_byte(uart_rx_0_o_data_byte),
        .din(wrapper_rx_fifo_0_din),
        .full(fifo_generator_0_full),
        .rx_avail(uart_rx_0_o_data_avail),
        .wr_en(wrapper_rx_fifo_0_wr_en));
  design_1_wrapper_tx_fifo_0_0 wrapper_tx_fifo_0
       (.clk(clk_wiz_0_clk_out1),
        .fifo_dout(fifo_generator_0_dout),
        .fifo_empty(fifo_generator_0_empty),
        .fifo_rd_en(wrapper_tx_fifo_0_fifo_rd_en),
        .rst_n(xlconstant_0_dout),
        .tx_tdin(wrapper_tx_fifo_0_tx_tdin),
        .tx_tdone(uart_tx_0_tdone),
        .tx_tenable(wrapper_tx_fifo_0_tx_tenable));
  design_1_xlconstant_0_0 xlconstant_0
       (.dout(xlconstant_0_dout));
endmodule
