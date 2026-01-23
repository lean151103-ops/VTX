// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Fri Jan 23 12:08:44 2026
// Host        : DESKTOP-518F4EG running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/Xilinx/Xlinx_project/test_uart_23-1/test_uart_23-1.gen/sources_1/bd/design_1/ip/design_1_wrapper_rx_fifo_0_0/design_1_wrapper_rx_fifo_0_0_stub.v
// Design      : design_1_wrapper_rx_fifo_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "wrapper_rx_fifo,Vivado 2022.2" *)
module design_1_wrapper_rx_fifo_0_0(rx_avail, data_byte, full, wr_en, din)
/* synthesis syn_black_box black_box_pad_pin="rx_avail,data_byte[7:0],full,wr_en,din[7:0]" */;
  input rx_avail;
  input [7:0]data_byte;
  input full;
  output wr_en;
  output [7:0]din;
endmodule
