//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
//Date        : Tue Feb 10 15:42:17 2026
//Host        : TelemetryK3_07 running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=7,numReposBlks=7,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=3,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=2,da_board_cnt=1,da_clkrst_cnt=5,da_ps7_cnt=1,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (i_rx_0,
    sys_clock);
  input i_rx_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.SYS_CLOCK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.SYS_CLOCK, CLK_DOMAIN design_1_sys_clock, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input sys_clock;

  wire [7:0]fifo_generator_0_dout;
  wire fifo_generator_0_empty;
  wire fifo_generator_0_full;
  wire i_rx_0_1;
  wire processing_system7_0_FCLK_CLK0;
  wire sys_clock_1;
  wire uart_rx_0_o_data_avail;
  wire [7:0]uart_rx_0_o_data_byte;
  wire wrapper_fifo_axi_0_rd_en;
  wire [7:0]wrapper_fifo_axi_0_s_axis_TDATA;
  wire wrapper_fifo_axi_0_s_axis_TREADY;
  wire wrapper_fifo_axi_0_s_axis_TVALID;
  wire [7:0]wrapper_rx_fifo_0_din;
  wire wrapper_rx_fifo_0_wr_en;
  wire [0:0]xlconstant_0_dout;

  assign i_rx_0_1 = i_rx_0;
  assign sys_clock_1 = sys_clock;
  design_1_axis_data_fifo_0_0 axis_data_fifo_0
       (.m_axis_tready(1'b1),
        .s_axis_aclk(processing_system7_0_FCLK_CLK0),
        .s_axis_aresetn(xlconstant_0_dout),
        .s_axis_tdata(wrapper_fifo_axi_0_s_axis_TDATA),
        .s_axis_tready(wrapper_fifo_axi_0_s_axis_TREADY),
        .s_axis_tvalid(wrapper_fifo_axi_0_s_axis_TVALID));
  design_1_clk_wiz_0_0 clk_wiz_0
       (.clk_in1(sys_clock_1),
        .clk_out1(processing_system7_0_FCLK_CLK0));
  design_1_fifo_generator_0_0 fifo_generator_0
       (.clk(processing_system7_0_FCLK_CLK0),
        .din(wrapper_rx_fifo_0_din),
        .dout(fifo_generator_0_dout),
        .empty(fifo_generator_0_empty),
        .full(fifo_generator_0_full),
        .rd_en(wrapper_fifo_axi_0_rd_en),
        .wr_en(wrapper_rx_fifo_0_wr_en));
  design_1_uart_rx_0_0 uart_rx_0
       (.clock(processing_system7_0_FCLK_CLK0),
        .i_rx(i_rx_0_1),
        .o_data_avail(uart_rx_0_o_data_avail),
        .o_data_byte(uart_rx_0_o_data_byte));
  design_1_wrapper_fifo_axi_0_1 wrapper_fifo_axi_0
       (.clk(processing_system7_0_FCLK_CLK0),
        .dout(fifo_generator_0_dout),
        .empty(fifo_generator_0_empty),
        .rd_en(wrapper_fifo_axi_0_rd_en),
        .rst_n(xlconstant_0_dout),
        .s_axis_tdata(wrapper_fifo_axi_0_s_axis_TDATA),
        .s_axis_tready(wrapper_fifo_axi_0_s_axis_TREADY),
        .s_axis_tvalid(wrapper_fifo_axi_0_s_axis_TVALID));
  design_1_wrapper_rx_fifo_0_0 wrapper_rx_fifo_0
       (.data_byte(uart_rx_0_o_data_byte),
        .din(wrapper_rx_fifo_0_din),
        .full(fifo_generator_0_full),
        .rx_avail(uart_rx_0_o_data_avail),
        .wr_en(wrapper_rx_fifo_0_wr_en));
  design_1_xlconstant_0_0 xlconstant_0
       (.dout(xlconstant_0_dout));
endmodule
