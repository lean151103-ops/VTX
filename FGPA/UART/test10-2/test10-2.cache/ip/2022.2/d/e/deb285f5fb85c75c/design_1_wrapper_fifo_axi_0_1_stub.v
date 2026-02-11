// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Tue Feb 10 15:43:14 2026
// Host        : TelemetryK3_07 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_wrapper_fifo_axi_0_1_stub.v
// Design      : design_1_wrapper_fifo_axi_0_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "wrapper_fifo_axi,Vivado 2022.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(clk, rst_n, empty, dout, rd_en, s_axis_tdata, 
  s_axis_tvalid, s_axis_tready)
/* synthesis syn_black_box black_box_pad_pin="clk,rst_n,empty,dout[7:0],rd_en,s_axis_tdata[7:0],s_axis_tvalid,s_axis_tready" */;
  input clk;
  input rst_n;
  input empty;
  input [7:0]dout;
  output rd_en;
  output [7:0]s_axis_tdata;
  output s_axis_tvalid;
  input s_axis_tready;
endmodule
