//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
//Date        : Fri Jan 23 12:07:45 2026
//Host        : DESKTOP-518F4EG running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
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
  input sys_clock;

  wire TX_0;
  wire i_rx_0;
  wire led_0_rx_0;
  wire led_1_rx_0;
  wire led_2_tx_0;
  wire led_3_tx_0;
  wire sys_clock;

  design_1 design_1_i
       (.TX_0(TX_0),
        .i_rx_0(i_rx_0),
        .led_0_rx_0(led_0_rx_0),
        .led_1_rx_0(led_1_rx_0),
        .led_2_tx_0(led_2_tx_0),
        .led_3_tx_0(led_3_tx_0),
        .sys_clock(sys_clock));
endmodule
