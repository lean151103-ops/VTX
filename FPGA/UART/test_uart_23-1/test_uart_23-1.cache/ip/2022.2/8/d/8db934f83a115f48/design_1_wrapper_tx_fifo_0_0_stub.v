// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Fri Jan 23 12:08:44 2026
// Host        : DESKTOP-518F4EG running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_wrapper_tx_fifo_0_0_stub.v
// Design      : design_1_wrapper_tx_fifo_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "wrapper_tx_fifo,Vivado 2022.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(clk, rst_n, fifo_empty, fifo_dout, fifo_rd_en, 
  tx_tenable, tx_tdin, tx_tdone)
/* synthesis syn_black_box black_box_pad_pin="clk,rst_n,fifo_empty,fifo_dout[7:0],fifo_rd_en,tx_tenable,tx_tdin[7:0],tx_tdone" */;
  input clk;
  input rst_n;
  input fifo_empty;
  input [7:0]fifo_dout;
  output fifo_rd_en;
  output tx_tenable;
  output [7:0]tx_tdin;
  input tx_tdone;
endmodule
