//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
//Date        : Wed Feb 11 14:42:03 2026
//Host        : TelemetryK3_07 running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (i_rx_0,
    sys_clock);
  input i_rx_0;
  input sys_clock;

  wire i_rx_0;
  wire sys_clock;

  design_1 design_1_i
       (.i_rx_0(i_rx_0),
        .sys_clock(sys_clock));
endmodule
