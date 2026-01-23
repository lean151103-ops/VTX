// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Fri Jan 23 12:08:45 2026
// Host        : DESKTOP-518F4EG running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/Xilinx/Xlinx_project/test_uart_23-1/test_uart_23-1.gen/sources_1/bd/design_1/ip/design_1_uart_tx_0_0/design_1_uart_tx_0_0_stub.v
// Design      : design_1_uart_tx_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "uart_tx,Vivado 2022.2" *)
module design_1_uart_tx_0_0(tclock, tenable, tdin, tdone, TX)
/* synthesis syn_black_box black_box_pad_pin="tclock,tenable,tdin[7:0],tdone,TX" */;
  input tclock;
  input tenable;
  input [7:0]tdin;
  output tdone;
  output TX;
endmodule
