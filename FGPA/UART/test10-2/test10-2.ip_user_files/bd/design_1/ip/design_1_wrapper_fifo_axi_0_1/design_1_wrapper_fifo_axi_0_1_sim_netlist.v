// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Tue Feb 10 15:43:14 2026
// Host        : TelemetryK3_07 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/Xlinx/A_project/test10-2/test10-2.gen/sources_1/bd/design_1/ip/design_1_wrapper_fifo_axi_0_1/design_1_wrapper_fifo_axi_0_1_sim_netlist.v
// Design      : design_1_wrapper_fifo_axi_0_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_wrapper_fifo_axi_0_1,wrapper_fifo_axi,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "wrapper_fifo_axi,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module design_1_wrapper_fifo_axi_0_1
   (clk,
    rst_n,
    empty,
    dout,
    rd_en,
    s_axis_tdata,
    s_axis_tvalid,
    s_axis_tready);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_BUSIF s_axis, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst_n RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input rst_n;
  input empty;
  input [7:0]dout;
  output rd_en;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TDATA" *) output [7:0]s_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TVALID" *) output s_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 125000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, LAYERED_METADATA undef, INSERT_VIP 0" *) input s_axis_tready;

  wire clk;
  wire [7:0]dout;
  wire empty;
  wire rd_en;
  wire rst_n;
  wire [7:0]s_axis_tdata;
  wire s_axis_tready;
  wire s_axis_tvalid;

  design_1_wrapper_fifo_axi_0_1_wrapper_fifo_axi inst
       (.clk(clk),
        .dout(dout),
        .empty(empty),
        .rd_en(rd_en),
        .rst_n(rst_n),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid_reg_0(s_axis_tvalid));
endmodule

(* ORIG_REF_NAME = "wrapper_fifo_axi" *) 
module design_1_wrapper_fifo_axi_0_1_wrapper_fifo_axi
   (s_axis_tdata,
    s_axis_tvalid_reg_0,
    rd_en,
    rst_n,
    dout,
    clk,
    empty,
    s_axis_tready);
  output [7:0]s_axis_tdata;
  output s_axis_tvalid_reg_0;
  output rd_en;
  input rst_n;
  input [7:0]dout;
  input clk;
  input empty;
  input s_axis_tready;

  wire Frame_buf;
  wire Frame_buf_reg_i_1_n_0;
  wire Frame_buf_reg_i_2_n_0;
  wire Frame_buf_reg_i_3_n_0;
  wire Frame_buf_reg_i_5_n_0;
  wire Frame_buf_reg_i_6_n_0;
  wire Frame_buf_reg_i_7_n_0;
  wire Frame_buf_reg_i_8_n_0;
  wire clk;
  wire [31:0]crc_calc;
  wire \crc_calc[0]_i_1_n_0 ;
  wire \crc_calc[10]_i_1_n_0 ;
  wire \crc_calc[11]_i_1_n_0 ;
  wire \crc_calc[12]_i_1_n_0 ;
  wire \crc_calc[13]_i_1_n_0 ;
  wire \crc_calc[14]_i_1_n_0 ;
  wire \crc_calc[15]_i_1_n_0 ;
  wire \crc_calc[16]_i_1_n_0 ;
  wire \crc_calc[17]_i_1_n_0 ;
  wire \crc_calc[18]_i_1_n_0 ;
  wire \crc_calc[18]_i_2_n_0 ;
  wire \crc_calc[19]_i_1_n_0 ;
  wire \crc_calc[1]_i_1_n_0 ;
  wire \crc_calc[20]_i_1_n_0 ;
  wire \crc_calc[21]_i_1_n_0 ;
  wire \crc_calc[21]_i_2_n_0 ;
  wire \crc_calc[22]_i_1_n_0 ;
  wire \crc_calc[23]_i_1_n_0 ;
  wire \crc_calc[23]_i_2_n_0 ;
  wire \crc_calc[24]_i_1_n_0 ;
  wire \crc_calc[24]_i_2_n_0 ;
  wire \crc_calc[25]_i_1_n_0 ;
  wire \crc_calc[25]_i_2_n_0 ;
  wire \crc_calc[26]_i_1_n_0 ;
  wire \crc_calc[26]_i_2_n_0 ;
  wire \crc_calc[27]_i_1_n_0 ;
  wire \crc_calc[27]_i_2_n_0 ;
  wire \crc_calc[27]_i_3_n_0 ;
  wire \crc_calc[28]_i_1_n_0 ;
  wire \crc_calc[28]_i_2_n_0 ;
  wire \crc_calc[29]_i_1_n_0 ;
  wire \crc_calc[29]_i_2_n_0 ;
  wire \crc_calc[29]_i_3_n_0 ;
  wire \crc_calc[2]_i_1_n_0 ;
  wire \crc_calc[30]_i_1_n_0 ;
  wire \crc_calc[30]_i_2_n_0 ;
  wire \crc_calc[31]_i_1_n_0 ;
  wire \crc_calc[31]_i_2_n_0 ;
  wire \crc_calc[3]_i_1_n_0 ;
  wire \crc_calc[4]_i_1_n_0 ;
  wire \crc_calc[5]_i_1_n_0 ;
  wire \crc_calc[6]_i_1_n_0 ;
  wire \crc_calc[7]_i_1_n_0 ;
  wire \crc_calc[8]_i_1_n_0 ;
  wire \crc_calc[9]_i_1_n_0 ;
  wire [2:0]crc_cnt;
  wire \crc_cnt[0]_i_1_n_0 ;
  wire \crc_cnt[1]_i_1_n_0 ;
  wire \crc_cnt[2]_i_1_n_0 ;
  wire \crc_cnt[2]_i_2_n_0 ;
  wire \crc_cnt[2]_i_3_n_0 ;
  wire [31:0]crc_rx;
  wire \crc_rx[15]_i_1_n_0 ;
  wire \crc_rx[23]_i_1_n_0 ;
  wire \crc_rx[24]_i_1_n_0 ;
  wire \crc_rx[25]_i_1_n_0 ;
  wire \crc_rx[26]_i_1_n_0 ;
  wire \crc_rx[27]_i_1_n_0 ;
  wire \crc_rx[28]_i_1_n_0 ;
  wire \crc_rx[29]_i_1_n_0 ;
  wire \crc_rx[30]_i_1_n_0 ;
  wire \crc_rx[31]_i_1_n_0 ;
  wire \crc_rx[31]_i_2_n_0 ;
  wire \crc_rx[31]_i_3_n_0 ;
  wire \crc_rx[31]_i_4_n_0 ;
  wire \crc_rx[7]_i_1_n_0 ;
  wire [6:1]data0;
  wire [7:0]dout;
  wire empty;
  wire [15:7]p_2_in;
  wire [7:0]p_2_in__0;
  wire [7:0]payload_cnt;
  wire \payload_cnt[4]_i_2_n_0 ;
  wire \payload_cnt[4]_i_3_n_0 ;
  wire \payload_cnt[4]_i_4_n_0 ;
  wire \payload_cnt[4]_i_5_n_0 ;
  wire \payload_cnt[5]_i_2_n_0 ;
  wire \payload_cnt[6]_i_2_n_0 ;
  wire \payload_cnt[7]_i_1_n_0 ;
  wire \payload_cnt[7]_i_3_n_0 ;
  wire \payload_cnt[7]_i_4_n_0 ;
  wire \payload_cnt[7]_i_5_n_0 ;
  wire rd_en;
  wire rd_en_i_1_n_0;
  wire [15:7]rd_ptr;
  wire [15:1]rd_ptr0;
  wire \rd_ptr[0]_i_1_n_0 ;
  wire \rd_ptr[15]_i_1_n_0 ;
  wire \rd_ptr[15]_i_3_n_0 ;
  wire \rd_ptr[1]_i_1_n_0 ;
  wire \rd_ptr[2]_i_1_n_0 ;
  wire \rd_ptr[3]_i_1_n_0 ;
  wire \rd_ptr[4]_i_1_n_0 ;
  wire \rd_ptr[5]_i_1_n_0 ;
  wire \rd_ptr[6]_i_1_n_0 ;
  wire \rd_ptr_reg[12]_i_2_n_0 ;
  wire \rd_ptr_reg[12]_i_2_n_1 ;
  wire \rd_ptr_reg[12]_i_2_n_2 ;
  wire \rd_ptr_reg[12]_i_2_n_3 ;
  wire \rd_ptr_reg[15]_i_4_n_2 ;
  wire \rd_ptr_reg[15]_i_4_n_3 ;
  wire \rd_ptr_reg[1]_i_2_n_0 ;
  wire \rd_ptr_reg[1]_i_2_n_1 ;
  wire \rd_ptr_reg[1]_i_2_n_2 ;
  wire \rd_ptr_reg[1]_i_2_n_3 ;
  wire \rd_ptr_reg[8]_i_2_n_0 ;
  wire \rd_ptr_reg[8]_i_2_n_1 ;
  wire \rd_ptr_reg[8]_i_2_n_2 ;
  wire \rd_ptr_reg[8]_i_2_n_3 ;
  wire [6:0]rd_ptr_reg_rep;
  wire rst_n;
  wire [7:0]s_axis_tdata;
  wire s_axis_tready;
  wire s_axis_tvalid_i_1_n_0;
  wire s_axis_tvalid_i_2_n_0;
  wire s_axis_tvalid_i_3_n_0;
  wire s_axis_tvalid_i_4_n_0;
  wire s_axis_tvalid_i_5_n_0;
  wire s_axis_tvalid_i_6_n_0;
  wire s_axis_tvalid_i_7_n_0;
  wire s_axis_tvalid_reg_0;
  wire [1:0]seq_cnt;
  wire \seq_cnt[0]_i_1_n_0 ;
  wire \seq_cnt[1]_i_1_n_0 ;
  wire \seq_cnt[1]_i_2_n_0 ;
  wire \seq_cnt[1]_i_3_n_0 ;
  wire st1_carry__0_i_1_n_0;
  wire st1_carry__0_i_2_n_0;
  wire st1_carry__0_i_3_n_0;
  wire st1_carry__0_i_4_n_0;
  wire st1_carry__0_n_0;
  wire st1_carry__0_n_1;
  wire st1_carry__0_n_2;
  wire st1_carry__0_n_3;
  wire st1_carry__1_i_1_n_0;
  wire st1_carry__1_i_2_n_0;
  wire st1_carry__1_i_3_n_0;
  wire st1_carry__1_n_1;
  wire st1_carry__1_n_2;
  wire st1_carry__1_n_3;
  wire st1_carry_i_1_n_0;
  wire st1_carry_i_2_n_0;
  wire st1_carry_i_3_n_0;
  wire st1_carry_i_4_n_0;
  wire st1_carry_n_0;
  wire st1_carry_n_1;
  wire st1_carry_n_2;
  wire st1_carry_n_3;
  wire \st[0]_i_1_n_0 ;
  wire \st[0]_i_2_n_0 ;
  wire \st[0]_i_3_n_0 ;
  wire \st[0]_i_4_n_0 ;
  wire \st[0]_i_5_n_0 ;
  wire \st[1]_i_1_n_0 ;
  wire \st[1]_i_2_n_0 ;
  wire \st[2]_i_1_n_0 ;
  wire \st[2]_i_2_n_0 ;
  wire \st[2]_i_3_n_0 ;
  wire \st_reg_n_0_[0] ;
  wire \st_reg_n_0_[1] ;
  wire \st_reg_n_0_[2] ;
  wire wr_ptr0_carry__0_n_3;
  wire wr_ptr0_carry_n_0;
  wire wr_ptr0_carry_n_1;
  wire wr_ptr0_carry_n_2;
  wire wr_ptr0_carry_n_3;
  wire \wr_ptr[0]_i_1_n_0 ;
  wire \wr_ptr[1]_i_1_n_0 ;
  wire \wr_ptr[2]_i_1_n_0 ;
  wire \wr_ptr[3]_i_1_n_0 ;
  wire \wr_ptr[4]_i_1_n_0 ;
  wire \wr_ptr[5]_i_1_n_0 ;
  wire \wr_ptr[6]_i_1_n_0 ;
  wire \wr_ptr[6]_i_2_n_0 ;
  wire \wr_ptr[6]_i_3_n_0 ;
  wire \wr_ptr[6]_i_4_n_0 ;
  wire \wr_ptr[6]_i_5_n_0 ;
  wire \wr_ptr_reg_n_0_[0] ;
  wire \wr_ptr_reg_n_0_[1] ;
  wire \wr_ptr_reg_n_0_[2] ;
  wire \wr_ptr_reg_n_0_[3] ;
  wire \wr_ptr_reg_n_0_[4] ;
  wire \wr_ptr_reg_n_0_[5] ;
  wire \wr_ptr_reg_n_0_[6] ;
  wire [15:0]NLW_Frame_buf_reg_DOADO_UNCONNECTED;
  wire [15:8]NLW_Frame_buf_reg_DOBDO_UNCONNECTED;
  wire [1:0]NLW_Frame_buf_reg_DOPADOP_UNCONNECTED;
  wire [1:0]NLW_Frame_buf_reg_DOPBDOP_UNCONNECTED;
  wire [3:2]\NLW_rd_ptr_reg[15]_i_4_CO_UNCONNECTED ;
  wire [3:3]\NLW_rd_ptr_reg[15]_i_4_O_UNCONNECTED ;
  wire [3:0]NLW_st1_carry_O_UNCONNECTED;
  wire [3:0]NLW_st1_carry__0_O_UNCONNECTED;
  wire [3:3]NLW_st1_carry__1_CO_UNCONNECTED;
  wire [3:0]NLW_st1_carry__1_O_UNCONNECTED;
  wire [3:1]NLW_wr_ptr0_carry__0_CO_UNCONNECTED;
  wire [3:2]NLW_wr_ptr0_carry__0_O_UNCONNECTED;

  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d8" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d8" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "864" *) 
  (* RTL_RAM_NAME = "inst/Frame_buf_reg" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "896" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "7" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    Frame_buf_reg
       (.ADDRARDADDR({1'b1,1'b1,1'b1,\wr_ptr_reg_n_0_[6] ,\wr_ptr_reg_n_0_[5] ,\wr_ptr_reg_n_0_[4] ,\wr_ptr_reg_n_0_[3] ,\wr_ptr_reg_n_0_[2] ,\wr_ptr_reg_n_0_[1] ,\wr_ptr_reg_n_0_[0] ,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,1'b1,1'b1,rd_ptr_reg_rep,1'b1,1'b1,1'b1,1'b1}),
        .CLKARDCLK(clk),
        .CLKBWRCLK(clk),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dout}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0}),
        .DOADO(NLW_Frame_buf_reg_DOADO_UNCONNECTED[15:0]),
        .DOBDO({NLW_Frame_buf_reg_DOBDO_UNCONNECTED[15:8],s_axis_tdata}),
        .DOPADOP(NLW_Frame_buf_reg_DOPADOP_UNCONNECTED[1:0]),
        .DOPBDOP(NLW_Frame_buf_reg_DOPBDOP_UNCONNECTED[1:0]),
        .ENARDEN(Frame_buf_reg_i_1_n_0),
        .ENBWREN(Frame_buf_reg_i_2_n_0),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(Frame_buf_reg_i_3_n_0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({Frame_buf,Frame_buf}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
  LUT6 #(
    .INIT(64'hF0FFF0FEF0FEF0FE)) 
    Frame_buf_reg_i_1
       (.I0(\st_reg_n_0_[1] ),
        .I1(\st_reg_n_0_[2] ),
        .I2(Frame_buf_reg_i_5_n_0),
        .I3(empty),
        .I4(\st_reg_n_0_[0] ),
        .I5(Frame_buf_reg_i_6_n_0),
        .O(Frame_buf_reg_i_1_n_0));
  LUT4 #(
    .INIT(16'h08FF)) 
    Frame_buf_reg_i_2
       (.I0(\st_reg_n_0_[2] ),
        .I1(\st_reg_n_0_[1] ),
        .I2(\st_reg_n_0_[0] ),
        .I3(rst_n),
        .O(Frame_buf_reg_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    Frame_buf_reg_i_3
       (.I0(rst_n),
        .O(Frame_buf_reg_i_3_n_0));
  LUT4 #(
    .INIT(16'h1F00)) 
    Frame_buf_reg_i_4
       (.I0(\st_reg_n_0_[0] ),
        .I1(\st_reg_n_0_[1] ),
        .I2(\st_reg_n_0_[2] ),
        .I3(rst_n),
        .O(Frame_buf));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h00020000)) 
    Frame_buf_reg_i_5
       (.I0(dout[1]),
        .I1(dout[0]),
        .I2(empty),
        .I3(\st_reg_n_0_[0] ),
        .I4(Frame_buf_reg_i_7_n_0),
        .O(Frame_buf_reg_i_5_n_0));
  LUT5 #(
    .INIT(32'h00200000)) 
    Frame_buf_reg_i_6
       (.I0(dout[0]),
        .I1(dout[1]),
        .I2(dout[2]),
        .I3(dout[3]),
        .I4(Frame_buf_reg_i_8_n_0),
        .O(Frame_buf_reg_i_6_n_0));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    Frame_buf_reg_i_7
       (.I0(dout[5]),
        .I1(dout[4]),
        .I2(dout[3]),
        .I3(dout[2]),
        .I4(dout[6]),
        .I5(dout[7]),
        .O(Frame_buf_reg_i_7_n_0));
  LUT4 #(
    .INIT(16'h0400)) 
    Frame_buf_reg_i_8
       (.I0(dout[7]),
        .I1(dout[6]),
        .I2(dout[5]),
        .I3(dout[4]),
        .O(Frame_buf_reg_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h96FF)) 
    \crc_calc[0]_i_1 
       (.I0(dout[2]),
        .I1(crc_calc[2]),
        .I2(crc_calc[8]),
        .I3(\st_reg_n_0_[0] ),
        .O(\crc_calc[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h96FF)) 
    \crc_calc[10]_i_1 
       (.I0(dout[2]),
        .I1(crc_calc[2]),
        .I2(crc_calc[18]),
        .I3(\st_reg_n_0_[0] ),
        .O(\crc_calc[10]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h96FF)) 
    \crc_calc[11]_i_1 
       (.I0(dout[3]),
        .I1(crc_calc[3]),
        .I2(crc_calc[19]),
        .I3(\st_reg_n_0_[0] ),
        .O(\crc_calc[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h96696996FFFFFFFF)) 
    \crc_calc[12]_i_1 
       (.I0(crc_calc[20]),
        .I1(crc_calc[4]),
        .I2(dout[4]),
        .I3(crc_calc[0]),
        .I4(dout[0]),
        .I5(\st_reg_n_0_[0] ),
        .O(\crc_calc[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h96696996FFFFFFFF)) 
    \crc_calc[13]_i_1 
       (.I0(crc_calc[21]),
        .I1(\crc_calc[25]_i_2_n_0 ),
        .I2(dout[5]),
        .I3(crc_calc[5]),
        .I4(\crc_calc[29]_i_3_n_0 ),
        .I5(\st_reg_n_0_[0] ),
        .O(\crc_calc[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h96696996FFFFFFFF)) 
    \crc_calc[14]_i_1 
       (.I0(\crc_calc[18]_i_2_n_0 ),
        .I1(crc_calc[6]),
        .I2(dout[6]),
        .I3(crc_calc[22]),
        .I4(\crc_calc[25]_i_2_n_0 ),
        .I5(\st_reg_n_0_[0] ),
        .O(\crc_calc[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h96696996FFFFFFFF)) 
    \crc_calc[15]_i_1 
       (.I0(\crc_calc[18]_i_2_n_0 ),
        .I1(crc_calc[23]),
        .I2(\crc_calc[25]_i_2_n_0 ),
        .I3(\crc_calc[27]_i_2_n_0 ),
        .I4(\crc_calc[30]_i_2_n_0 ),
        .I5(\st_reg_n_0_[0] ),
        .O(\crc_calc[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h69969669FFFFFFFF)) 
    \crc_calc[16]_i_1 
       (.I0(crc_calc[3]),
        .I1(dout[3]),
        .I2(\crc_calc[18]_i_2_n_0 ),
        .I3(\crc_calc[28]_i_2_n_0 ),
        .I4(crc_calc[24]),
        .I5(\st_reg_n_0_[0] ),
        .O(\crc_calc[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h6996FFFF)) 
    \crc_calc[17]_i_1 
       (.I0(\crc_calc[24]_i_2_n_0 ),
        .I1(crc_calc[25]),
        .I2(crc_calc[3]),
        .I3(dout[3]),
        .I4(\st_reg_n_0_[0] ),
        .O(\crc_calc[17]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h96696996FFFFFFFF)) 
    \crc_calc[18]_i_1 
       (.I0(\crc_calc[24]_i_2_n_0 ),
        .I1(dout[6]),
        .I2(crc_calc[6]),
        .I3(\crc_calc[18]_i_2_n_0 ),
        .I4(crc_calc[26]),
        .I5(\st_reg_n_0_[0] ),
        .O(\crc_calc[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \crc_calc[18]_i_2 
       (.I0(dout[2]),
        .I1(crc_calc[2]),
        .O(\crc_calc[18]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h69969669FFFFFFFF)) 
    \crc_calc[19]_i_1 
       (.I0(dout[5]),
        .I1(crc_calc[5]),
        .I2(\crc_calc[26]_i_2_n_0 ),
        .I3(crc_calc[27]),
        .I4(\crc_calc[30]_i_2_n_0 ),
        .I5(\st_reg_n_0_[0] ),
        .O(\crc_calc[19]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h96696996FFFFFFFF)) 
    \crc_calc[1]_i_1 
       (.I0(crc_calc[9]),
        .I1(crc_calc[3]),
        .I2(dout[3]),
        .I3(crc_calc[0]),
        .I4(dout[0]),
        .I5(\st_reg_n_0_[0] ),
        .O(\crc_calc[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h69FF)) 
    \crc_calc[20]_i_1 
       (.I0(\crc_calc[23]_i_2_n_0 ),
        .I1(crc_calc[28]),
        .I2(\crc_calc[30]_i_2_n_0 ),
        .I3(\st_reg_n_0_[0] ),
        .O(\crc_calc[20]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h69969669FFFFFFFF)) 
    \crc_calc[21]_i_1 
       (.I0(dout[4]),
        .I1(crc_calc[4]),
        .I2(crc_calc[29]),
        .I3(\crc_calc[21]_i_2_n_0 ),
        .I4(\crc_calc[30]_i_2_n_0 ),
        .I5(\st_reg_n_0_[0] ),
        .O(\crc_calc[21]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h9669699669969669)) 
    \crc_calc[21]_i_2 
       (.I0(dout[1]),
        .I1(crc_calc[1]),
        .I2(dout[5]),
        .I3(crc_calc[5]),
        .I4(crc_calc[2]),
        .I5(dout[2]),
        .O(\crc_calc[21]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h9669FFFF)) 
    \crc_calc[22]_i_1 
       (.I0(crc_calc[30]),
        .I1(\crc_calc[26]_i_2_n_0 ),
        .I2(crc_calc[5]),
        .I3(dout[5]),
        .I4(\st_reg_n_0_[0] ),
        .O(\crc_calc[22]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h69FF)) 
    \crc_calc[23]_i_1 
       (.I0(\crc_calc[23]_i_2_n_0 ),
        .I1(crc_calc[31]),
        .I2(\crc_calc[30]_i_2_n_0 ),
        .I3(\st_reg_n_0_[0] ),
        .O(\crc_calc[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h9669699669969669)) 
    \crc_calc[23]_i_2 
       (.I0(dout[6]),
        .I1(crc_calc[6]),
        .I2(dout[4]),
        .I3(crc_calc[4]),
        .I4(\crc_calc[25]_i_2_n_0 ),
        .I5(\crc_calc[27]_i_2_n_0 ),
        .O(\crc_calc[23]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h6996FFFF)) 
    \crc_calc[24]_i_1 
       (.I0(\crc_calc[24]_i_2_n_0 ),
        .I1(crc_calc[2]),
        .I2(dout[2]),
        .I3(\crc_calc[30]_i_2_n_0 ),
        .I4(\st_reg_n_0_[0] ),
        .O(\crc_calc[24]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h69969669)) 
    \crc_calc[24]_i_2 
       (.I0(\crc_calc[28]_i_2_n_0 ),
        .I1(dout[1]),
        .I2(crc_calc[1]),
        .I3(dout[5]),
        .I4(crc_calc[5]),
        .O(\crc_calc[24]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h69969669FFFFFFFF)) 
    \crc_calc[25]_i_1 
       (.I0(\crc_calc[26]_i_2_n_0 ),
        .I1(\crc_calc[25]_i_2_n_0 ),
        .I2(dout[5]),
        .I3(crc_calc[5]),
        .I4(\crc_calc[29]_i_3_n_0 ),
        .I5(\st_reg_n_0_[0] ),
        .O(\crc_calc[25]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \crc_calc[25]_i_2 
       (.I0(dout[1]),
        .I1(crc_calc[1]),
        .O(\crc_calc[25]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h96FF)) 
    \crc_calc[26]_i_1 
       (.I0(\crc_calc[26]_i_2_n_0 ),
        .I1(\crc_calc[28]_i_2_n_0 ),
        .I2(\crc_calc[30]_i_2_n_0 ),
        .I3(\st_reg_n_0_[0] ),
        .O(\crc_calc[26]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h9669699669969669)) 
    \crc_calc[26]_i_2 
       (.I0(dout[6]),
        .I1(crc_calc[6]),
        .I2(dout[2]),
        .I3(crc_calc[2]),
        .I4(crc_calc[3]),
        .I5(dout[3]),
        .O(\crc_calc[26]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h96696996FFFFFFFF)) 
    \crc_calc[27]_i_1 
       (.I0(\crc_calc[27]_i_2_n_0 ),
        .I1(dout[4]),
        .I2(crc_calc[4]),
        .I3(\crc_calc[27]_i_3_n_0 ),
        .I4(\crc_calc[30]_i_2_n_0 ),
        .I5(\st_reg_n_0_[0] ),
        .O(\crc_calc[27]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \crc_calc[27]_i_2 
       (.I0(dout[3]),
        .I1(crc_calc[3]),
        .O(\crc_calc[27]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \crc_calc[27]_i_3 
       (.I0(dout[5]),
        .I1(crc_calc[5]),
        .O(\crc_calc[27]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h69969669FFFFFFFF)) 
    \crc_calc[28]_i_1 
       (.I0(\crc_calc[28]_i_2_n_0 ),
        .I1(crc_calc[5]),
        .I2(dout[5]),
        .I3(crc_calc[6]),
        .I4(dout[6]),
        .I5(\st_reg_n_0_[0] ),
        .O(\crc_calc[28]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h9669)) 
    \crc_calc[28]_i_2 
       (.I0(crc_calc[4]),
        .I1(dout[4]),
        .I2(crc_calc[0]),
        .I3(dout[0]),
        .O(\crc_calc[28]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h96696996FFFFFFFF)) 
    \crc_calc[29]_i_1 
       (.I0(\crc_calc[29]_i_2_n_0 ),
        .I1(dout[5]),
        .I2(crc_calc[5]),
        .I3(\crc_calc[29]_i_3_n_0 ),
        .I4(\crc_calc[30]_i_2_n_0 ),
        .I5(\st_reg_n_0_[0] ),
        .O(\crc_calc[29]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \crc_calc[29]_i_2 
       (.I0(dout[6]),
        .I1(crc_calc[6]),
        .O(\crc_calc[29]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \crc_calc[29]_i_3 
       (.I0(dout[0]),
        .I1(crc_calc[0]),
        .O(\crc_calc[29]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h9669FFFF)) 
    \crc_calc[2]_i_1 
       (.I0(\crc_calc[28]_i_2_n_0 ),
        .I1(crc_calc[10]),
        .I2(crc_calc[1]),
        .I3(dout[1]),
        .I4(\st_reg_n_0_[0] ),
        .O(\crc_calc[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h96696996FFFFFFFF)) 
    \crc_calc[30]_i_1 
       (.I0(crc_calc[0]),
        .I1(dout[0]),
        .I2(crc_calc[6]),
        .I3(dout[6]),
        .I4(\crc_calc[30]_i_2_n_0 ),
        .I5(\st_reg_n_0_[0] ),
        .O(\crc_calc[30]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \crc_calc[30]_i_2 
       (.I0(crc_calc[7]),
        .I1(dout[7]),
        .I2(crc_calc[1]),
        .I3(dout[1]),
        .O(\crc_calc[30]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h000000000000F200)) 
    \crc_calc[31]_i_1 
       (.I0(seq_cnt[0]),
        .I1(seq_cnt[1]),
        .I2(\st_reg_n_0_[0] ),
        .I3(\st_reg_n_0_[1] ),
        .I4(empty),
        .I5(\st_reg_n_0_[2] ),
        .O(\crc_calc[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'h6996FFFF)) 
    \crc_calc[31]_i_2 
       (.I0(dout[1]),
        .I1(crc_calc[1]),
        .I2(dout[7]),
        .I3(crc_calc[7]),
        .I4(\st_reg_n_0_[0] ),
        .O(\crc_calc[31]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h96696996FFFFFFFF)) 
    \crc_calc[3]_i_1 
       (.I0(crc_calc[11]),
        .I1(\crc_calc[25]_i_2_n_0 ),
        .I2(dout[5]),
        .I3(crc_calc[5]),
        .I4(\crc_calc[18]_i_2_n_0 ),
        .I5(\st_reg_n_0_[0] ),
        .O(\crc_calc[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h9669FFFF)) 
    \crc_calc[4]_i_1 
       (.I0(\crc_calc[26]_i_2_n_0 ),
        .I1(crc_calc[12]),
        .I2(crc_calc[0]),
        .I3(dout[0]),
        .I4(\st_reg_n_0_[0] ),
        .O(\crc_calc[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h96696996FFFFFFFF)) 
    \crc_calc[5]_i_1 
       (.I0(\crc_calc[27]_i_2_n_0 ),
        .I1(dout[4]),
        .I2(crc_calc[4]),
        .I3(crc_calc[13]),
        .I4(\crc_calc[30]_i_2_n_0 ),
        .I5(\st_reg_n_0_[0] ),
        .O(\crc_calc[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h96696996FFFFFFFF)) 
    \crc_calc[6]_i_1 
       (.I0(crc_calc[14]),
        .I1(crc_calc[5]),
        .I2(dout[5]),
        .I3(crc_calc[4]),
        .I4(dout[4]),
        .I5(\st_reg_n_0_[0] ),
        .O(\crc_calc[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h96696996FFFFFFFF)) 
    \crc_calc[7]_i_1 
       (.I0(crc_calc[15]),
        .I1(\crc_calc[29]_i_2_n_0 ),
        .I2(dout[5]),
        .I3(crc_calc[5]),
        .I4(\crc_calc[29]_i_3_n_0 ),
        .I5(\st_reg_n_0_[0] ),
        .O(\crc_calc[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h6996FFFF)) 
    \crc_calc[8]_i_1 
       (.I0(crc_calc[16]),
        .I1(crc_calc[6]),
        .I2(dout[6]),
        .I3(\crc_calc[30]_i_2_n_0 ),
        .I4(\st_reg_n_0_[0] ),
        .O(\crc_calc[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h96FF)) 
    \crc_calc[9]_i_1 
       (.I0(crc_calc[17]),
        .I1(crc_calc[7]),
        .I2(dout[7]),
        .I3(\st_reg_n_0_[0] ),
        .O(\crc_calc[9]_i_1_n_0 ));
  FDSE \crc_calc_reg[0] 
       (.C(clk),
        .CE(\crc_calc[31]_i_1_n_0 ),
        .D(\crc_calc[0]_i_1_n_0 ),
        .Q(crc_calc[0]),
        .S(Frame_buf_reg_i_3_n_0));
  FDSE \crc_calc_reg[10] 
       (.C(clk),
        .CE(\crc_calc[31]_i_1_n_0 ),
        .D(\crc_calc[10]_i_1_n_0 ),
        .Q(crc_calc[10]),
        .S(Frame_buf_reg_i_3_n_0));
  FDSE \crc_calc_reg[11] 
       (.C(clk),
        .CE(\crc_calc[31]_i_1_n_0 ),
        .D(\crc_calc[11]_i_1_n_0 ),
        .Q(crc_calc[11]),
        .S(Frame_buf_reg_i_3_n_0));
  FDSE \crc_calc_reg[12] 
       (.C(clk),
        .CE(\crc_calc[31]_i_1_n_0 ),
        .D(\crc_calc[12]_i_1_n_0 ),
        .Q(crc_calc[12]),
        .S(Frame_buf_reg_i_3_n_0));
  FDSE \crc_calc_reg[13] 
       (.C(clk),
        .CE(\crc_calc[31]_i_1_n_0 ),
        .D(\crc_calc[13]_i_1_n_0 ),
        .Q(crc_calc[13]),
        .S(Frame_buf_reg_i_3_n_0));
  FDSE \crc_calc_reg[14] 
       (.C(clk),
        .CE(\crc_calc[31]_i_1_n_0 ),
        .D(\crc_calc[14]_i_1_n_0 ),
        .Q(crc_calc[14]),
        .S(Frame_buf_reg_i_3_n_0));
  FDSE \crc_calc_reg[15] 
       (.C(clk),
        .CE(\crc_calc[31]_i_1_n_0 ),
        .D(\crc_calc[15]_i_1_n_0 ),
        .Q(crc_calc[15]),
        .S(Frame_buf_reg_i_3_n_0));
  FDSE \crc_calc_reg[16] 
       (.C(clk),
        .CE(\crc_calc[31]_i_1_n_0 ),
        .D(\crc_calc[16]_i_1_n_0 ),
        .Q(crc_calc[16]),
        .S(Frame_buf_reg_i_3_n_0));
  FDSE \crc_calc_reg[17] 
       (.C(clk),
        .CE(\crc_calc[31]_i_1_n_0 ),
        .D(\crc_calc[17]_i_1_n_0 ),
        .Q(crc_calc[17]),
        .S(Frame_buf_reg_i_3_n_0));
  FDSE \crc_calc_reg[18] 
       (.C(clk),
        .CE(\crc_calc[31]_i_1_n_0 ),
        .D(\crc_calc[18]_i_1_n_0 ),
        .Q(crc_calc[18]),
        .S(Frame_buf_reg_i_3_n_0));
  FDSE \crc_calc_reg[19] 
       (.C(clk),
        .CE(\crc_calc[31]_i_1_n_0 ),
        .D(\crc_calc[19]_i_1_n_0 ),
        .Q(crc_calc[19]),
        .S(Frame_buf_reg_i_3_n_0));
  FDSE \crc_calc_reg[1] 
       (.C(clk),
        .CE(\crc_calc[31]_i_1_n_0 ),
        .D(\crc_calc[1]_i_1_n_0 ),
        .Q(crc_calc[1]),
        .S(Frame_buf_reg_i_3_n_0));
  FDSE \crc_calc_reg[20] 
       (.C(clk),
        .CE(\crc_calc[31]_i_1_n_0 ),
        .D(\crc_calc[20]_i_1_n_0 ),
        .Q(crc_calc[20]),
        .S(Frame_buf_reg_i_3_n_0));
  FDSE \crc_calc_reg[21] 
       (.C(clk),
        .CE(\crc_calc[31]_i_1_n_0 ),
        .D(\crc_calc[21]_i_1_n_0 ),
        .Q(crc_calc[21]),
        .S(Frame_buf_reg_i_3_n_0));
  FDSE \crc_calc_reg[22] 
       (.C(clk),
        .CE(\crc_calc[31]_i_1_n_0 ),
        .D(\crc_calc[22]_i_1_n_0 ),
        .Q(crc_calc[22]),
        .S(Frame_buf_reg_i_3_n_0));
  FDSE \crc_calc_reg[23] 
       (.C(clk),
        .CE(\crc_calc[31]_i_1_n_0 ),
        .D(\crc_calc[23]_i_1_n_0 ),
        .Q(crc_calc[23]),
        .S(Frame_buf_reg_i_3_n_0));
  FDSE \crc_calc_reg[24] 
       (.C(clk),
        .CE(\crc_calc[31]_i_1_n_0 ),
        .D(\crc_calc[24]_i_1_n_0 ),
        .Q(crc_calc[24]),
        .S(Frame_buf_reg_i_3_n_0));
  FDSE \crc_calc_reg[25] 
       (.C(clk),
        .CE(\crc_calc[31]_i_1_n_0 ),
        .D(\crc_calc[25]_i_1_n_0 ),
        .Q(crc_calc[25]),
        .S(Frame_buf_reg_i_3_n_0));
  FDSE \crc_calc_reg[26] 
       (.C(clk),
        .CE(\crc_calc[31]_i_1_n_0 ),
        .D(\crc_calc[26]_i_1_n_0 ),
        .Q(crc_calc[26]),
        .S(Frame_buf_reg_i_3_n_0));
  FDSE \crc_calc_reg[27] 
       (.C(clk),
        .CE(\crc_calc[31]_i_1_n_0 ),
        .D(\crc_calc[27]_i_1_n_0 ),
        .Q(crc_calc[27]),
        .S(Frame_buf_reg_i_3_n_0));
  FDSE \crc_calc_reg[28] 
       (.C(clk),
        .CE(\crc_calc[31]_i_1_n_0 ),
        .D(\crc_calc[28]_i_1_n_0 ),
        .Q(crc_calc[28]),
        .S(Frame_buf_reg_i_3_n_0));
  FDSE \crc_calc_reg[29] 
       (.C(clk),
        .CE(\crc_calc[31]_i_1_n_0 ),
        .D(\crc_calc[29]_i_1_n_0 ),
        .Q(crc_calc[29]),
        .S(Frame_buf_reg_i_3_n_0));
  FDSE \crc_calc_reg[2] 
       (.C(clk),
        .CE(\crc_calc[31]_i_1_n_0 ),
        .D(\crc_calc[2]_i_1_n_0 ),
        .Q(crc_calc[2]),
        .S(Frame_buf_reg_i_3_n_0));
  FDSE \crc_calc_reg[30] 
       (.C(clk),
        .CE(\crc_calc[31]_i_1_n_0 ),
        .D(\crc_calc[30]_i_1_n_0 ),
        .Q(crc_calc[30]),
        .S(Frame_buf_reg_i_3_n_0));
  FDSE \crc_calc_reg[31] 
       (.C(clk),
        .CE(\crc_calc[31]_i_1_n_0 ),
        .D(\crc_calc[31]_i_2_n_0 ),
        .Q(crc_calc[31]),
        .S(Frame_buf_reg_i_3_n_0));
  FDSE \crc_calc_reg[3] 
       (.C(clk),
        .CE(\crc_calc[31]_i_1_n_0 ),
        .D(\crc_calc[3]_i_1_n_0 ),
        .Q(crc_calc[3]),
        .S(Frame_buf_reg_i_3_n_0));
  FDSE \crc_calc_reg[4] 
       (.C(clk),
        .CE(\crc_calc[31]_i_1_n_0 ),
        .D(\crc_calc[4]_i_1_n_0 ),
        .Q(crc_calc[4]),
        .S(Frame_buf_reg_i_3_n_0));
  FDSE \crc_calc_reg[5] 
       (.C(clk),
        .CE(\crc_calc[31]_i_1_n_0 ),
        .D(\crc_calc[5]_i_1_n_0 ),
        .Q(crc_calc[5]),
        .S(Frame_buf_reg_i_3_n_0));
  FDSE \crc_calc_reg[6] 
       (.C(clk),
        .CE(\crc_calc[31]_i_1_n_0 ),
        .D(\crc_calc[6]_i_1_n_0 ),
        .Q(crc_calc[6]),
        .S(Frame_buf_reg_i_3_n_0));
  FDSE \crc_calc_reg[7] 
       (.C(clk),
        .CE(\crc_calc[31]_i_1_n_0 ),
        .D(\crc_calc[7]_i_1_n_0 ),
        .Q(crc_calc[7]),
        .S(Frame_buf_reg_i_3_n_0));
  FDSE \crc_calc_reg[8] 
       (.C(clk),
        .CE(\crc_calc[31]_i_1_n_0 ),
        .D(\crc_calc[8]_i_1_n_0 ),
        .Q(crc_calc[8]),
        .S(Frame_buf_reg_i_3_n_0));
  FDSE \crc_calc_reg[9] 
       (.C(clk),
        .CE(\crc_calc[31]_i_1_n_0 ),
        .D(\crc_calc[9]_i_1_n_0 ),
        .Q(crc_calc[9]),
        .S(Frame_buf_reg_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hC0FFEA00)) 
    \crc_cnt[0]_i_1 
       (.I0(\st_reg_n_0_[2] ),
        .I1(\st_reg_n_0_[1] ),
        .I2(empty),
        .I3(\crc_cnt[2]_i_3_n_0 ),
        .I4(crc_cnt[0]),
        .O(\crc_cnt[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hF4FFF800)) 
    \crc_cnt[1]_i_1 
       (.I0(crc_cnt[0]),
        .I1(\st_reg_n_0_[2] ),
        .I2(\crc_cnt[2]_i_2_n_0 ),
        .I3(\crc_cnt[2]_i_3_n_0 ),
        .I4(crc_cnt[1]),
        .O(\crc_cnt[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFF70FFFFFF000000)) 
    \crc_cnt[2]_i_1 
       (.I0(crc_cnt[1]),
        .I1(crc_cnt[0]),
        .I2(\st_reg_n_0_[2] ),
        .I3(\crc_cnt[2]_i_2_n_0 ),
        .I4(\crc_cnt[2]_i_3_n_0 ),
        .I5(crc_cnt[2]),
        .O(\crc_cnt[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \crc_cnt[2]_i_2 
       (.I0(empty),
        .I1(\st_reg_n_0_[1] ),
        .O(\crc_cnt[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAFBAAF)) 
    \crc_cnt[2]_i_3 
       (.I0(\crc_rx[31]_i_4_n_0 ),
        .I1(\payload_cnt[7]_i_3_n_0 ),
        .I2(\st_reg_n_0_[1] ),
        .I3(\st_reg_n_0_[0] ),
        .I4(\st_reg_n_0_[2] ),
        .I5(empty),
        .O(\crc_cnt[2]_i_3_n_0 ));
  FDRE \crc_cnt_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\crc_cnt[0]_i_1_n_0 ),
        .Q(crc_cnt[0]),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \crc_cnt_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\crc_cnt[1]_i_1_n_0 ),
        .Q(crc_cnt[1]),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \crc_cnt_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\crc_cnt[2]_i_1_n_0 ),
        .Q(crc_cnt[2]),
        .R(Frame_buf_reg_i_3_n_0));
  LUT5 #(
    .INIT(32'hFFFF0200)) 
    \crc_rx[15]_i_1 
       (.I0(\crc_rx[31]_i_3_n_0 ),
        .I1(crc_cnt[2]),
        .I2(crc_cnt[1]),
        .I3(crc_cnt[0]),
        .I4(\crc_rx[31]_i_4_n_0 ),
        .O(\crc_rx[15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF0008)) 
    \crc_rx[23]_i_1 
       (.I0(\crc_rx[31]_i_3_n_0 ),
        .I1(crc_cnt[1]),
        .I2(crc_cnt[2]),
        .I3(crc_cnt[0]),
        .I4(\crc_rx[31]_i_4_n_0 ),
        .O(\crc_rx[23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \crc_rx[24]_i_1 
       (.I0(\st_reg_n_0_[2] ),
        .I1(dout[0]),
        .I2(\st_reg_n_0_[1] ),
        .I3(empty),
        .O(\crc_rx[24]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \crc_rx[25]_i_1 
       (.I0(\st_reg_n_0_[2] ),
        .I1(dout[1]),
        .I2(\st_reg_n_0_[1] ),
        .I3(empty),
        .O(\crc_rx[25]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \crc_rx[26]_i_1 
       (.I0(\st_reg_n_0_[2] ),
        .I1(dout[2]),
        .I2(\st_reg_n_0_[1] ),
        .I3(empty),
        .O(\crc_rx[26]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \crc_rx[27]_i_1 
       (.I0(\st_reg_n_0_[2] ),
        .I1(dout[3]),
        .I2(\st_reg_n_0_[1] ),
        .I3(empty),
        .O(\crc_rx[27]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \crc_rx[28]_i_1 
       (.I0(\st_reg_n_0_[2] ),
        .I1(dout[4]),
        .I2(\st_reg_n_0_[1] ),
        .I3(empty),
        .O(\crc_rx[28]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \crc_rx[29]_i_1 
       (.I0(\st_reg_n_0_[2] ),
        .I1(dout[5]),
        .I2(\st_reg_n_0_[1] ),
        .I3(empty),
        .O(\crc_rx[29]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \crc_rx[30]_i_1 
       (.I0(\st_reg_n_0_[2] ),
        .I1(dout[6]),
        .I2(\st_reg_n_0_[1] ),
        .I3(empty),
        .O(\crc_rx[30]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF2000)) 
    \crc_rx[31]_i_1 
       (.I0(crc_cnt[1]),
        .I1(crc_cnt[2]),
        .I2(crc_cnt[0]),
        .I3(\crc_rx[31]_i_3_n_0 ),
        .I4(\crc_rx[31]_i_4_n_0 ),
        .O(\crc_rx[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \crc_rx[31]_i_2 
       (.I0(\st_reg_n_0_[2] ),
        .I1(dout[7]),
        .I2(\st_reg_n_0_[1] ),
        .I3(empty),
        .O(\crc_rx[31]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \crc_rx[31]_i_3 
       (.I0(\st_reg_n_0_[1] ),
        .I1(\st_reg_n_0_[0] ),
        .I2(empty),
        .O(\crc_rx[31]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000011111511)) 
    \crc_rx[31]_i_4 
       (.I0(\st_reg_n_0_[0] ),
        .I1(\st_reg_n_0_[1] ),
        .I2(empty),
        .I3(seq_cnt[0]),
        .I4(seq_cnt[1]),
        .I5(\st_reg_n_0_[2] ),
        .O(\crc_rx[31]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF0002)) 
    \crc_rx[7]_i_1 
       (.I0(\crc_rx[31]_i_3_n_0 ),
        .I1(crc_cnt[2]),
        .I2(crc_cnt[1]),
        .I3(crc_cnt[0]),
        .I4(\crc_rx[31]_i_4_n_0 ),
        .O(\crc_rx[7]_i_1_n_0 ));
  FDRE \crc_rx_reg[0] 
       (.C(clk),
        .CE(\crc_rx[7]_i_1_n_0 ),
        .D(\crc_rx[24]_i_1_n_0 ),
        .Q(crc_rx[0]),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \crc_rx_reg[10] 
       (.C(clk),
        .CE(\crc_rx[15]_i_1_n_0 ),
        .D(\crc_rx[26]_i_1_n_0 ),
        .Q(crc_rx[10]),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \crc_rx_reg[11] 
       (.C(clk),
        .CE(\crc_rx[15]_i_1_n_0 ),
        .D(\crc_rx[27]_i_1_n_0 ),
        .Q(crc_rx[11]),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \crc_rx_reg[12] 
       (.C(clk),
        .CE(\crc_rx[15]_i_1_n_0 ),
        .D(\crc_rx[28]_i_1_n_0 ),
        .Q(crc_rx[12]),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \crc_rx_reg[13] 
       (.C(clk),
        .CE(\crc_rx[15]_i_1_n_0 ),
        .D(\crc_rx[29]_i_1_n_0 ),
        .Q(crc_rx[13]),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \crc_rx_reg[14] 
       (.C(clk),
        .CE(\crc_rx[15]_i_1_n_0 ),
        .D(\crc_rx[30]_i_1_n_0 ),
        .Q(crc_rx[14]),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \crc_rx_reg[15] 
       (.C(clk),
        .CE(\crc_rx[15]_i_1_n_0 ),
        .D(\crc_rx[31]_i_2_n_0 ),
        .Q(crc_rx[15]),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \crc_rx_reg[16] 
       (.C(clk),
        .CE(\crc_rx[23]_i_1_n_0 ),
        .D(\crc_rx[24]_i_1_n_0 ),
        .Q(crc_rx[16]),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \crc_rx_reg[17] 
       (.C(clk),
        .CE(\crc_rx[23]_i_1_n_0 ),
        .D(\crc_rx[25]_i_1_n_0 ),
        .Q(crc_rx[17]),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \crc_rx_reg[18] 
       (.C(clk),
        .CE(\crc_rx[23]_i_1_n_0 ),
        .D(\crc_rx[26]_i_1_n_0 ),
        .Q(crc_rx[18]),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \crc_rx_reg[19] 
       (.C(clk),
        .CE(\crc_rx[23]_i_1_n_0 ),
        .D(\crc_rx[27]_i_1_n_0 ),
        .Q(crc_rx[19]),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \crc_rx_reg[1] 
       (.C(clk),
        .CE(\crc_rx[7]_i_1_n_0 ),
        .D(\crc_rx[25]_i_1_n_0 ),
        .Q(crc_rx[1]),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \crc_rx_reg[20] 
       (.C(clk),
        .CE(\crc_rx[23]_i_1_n_0 ),
        .D(\crc_rx[28]_i_1_n_0 ),
        .Q(crc_rx[20]),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \crc_rx_reg[21] 
       (.C(clk),
        .CE(\crc_rx[23]_i_1_n_0 ),
        .D(\crc_rx[29]_i_1_n_0 ),
        .Q(crc_rx[21]),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \crc_rx_reg[22] 
       (.C(clk),
        .CE(\crc_rx[23]_i_1_n_0 ),
        .D(\crc_rx[30]_i_1_n_0 ),
        .Q(crc_rx[22]),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \crc_rx_reg[23] 
       (.C(clk),
        .CE(\crc_rx[23]_i_1_n_0 ),
        .D(\crc_rx[31]_i_2_n_0 ),
        .Q(crc_rx[23]),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \crc_rx_reg[24] 
       (.C(clk),
        .CE(\crc_rx[31]_i_1_n_0 ),
        .D(\crc_rx[24]_i_1_n_0 ),
        .Q(crc_rx[24]),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \crc_rx_reg[25] 
       (.C(clk),
        .CE(\crc_rx[31]_i_1_n_0 ),
        .D(\crc_rx[25]_i_1_n_0 ),
        .Q(crc_rx[25]),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \crc_rx_reg[26] 
       (.C(clk),
        .CE(\crc_rx[31]_i_1_n_0 ),
        .D(\crc_rx[26]_i_1_n_0 ),
        .Q(crc_rx[26]),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \crc_rx_reg[27] 
       (.C(clk),
        .CE(\crc_rx[31]_i_1_n_0 ),
        .D(\crc_rx[27]_i_1_n_0 ),
        .Q(crc_rx[27]),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \crc_rx_reg[28] 
       (.C(clk),
        .CE(\crc_rx[31]_i_1_n_0 ),
        .D(\crc_rx[28]_i_1_n_0 ),
        .Q(crc_rx[28]),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \crc_rx_reg[29] 
       (.C(clk),
        .CE(\crc_rx[31]_i_1_n_0 ),
        .D(\crc_rx[29]_i_1_n_0 ),
        .Q(crc_rx[29]),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \crc_rx_reg[2] 
       (.C(clk),
        .CE(\crc_rx[7]_i_1_n_0 ),
        .D(\crc_rx[26]_i_1_n_0 ),
        .Q(crc_rx[2]),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \crc_rx_reg[30] 
       (.C(clk),
        .CE(\crc_rx[31]_i_1_n_0 ),
        .D(\crc_rx[30]_i_1_n_0 ),
        .Q(crc_rx[30]),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \crc_rx_reg[31] 
       (.C(clk),
        .CE(\crc_rx[31]_i_1_n_0 ),
        .D(\crc_rx[31]_i_2_n_0 ),
        .Q(crc_rx[31]),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \crc_rx_reg[3] 
       (.C(clk),
        .CE(\crc_rx[7]_i_1_n_0 ),
        .D(\crc_rx[27]_i_1_n_0 ),
        .Q(crc_rx[3]),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \crc_rx_reg[4] 
       (.C(clk),
        .CE(\crc_rx[7]_i_1_n_0 ),
        .D(\crc_rx[28]_i_1_n_0 ),
        .Q(crc_rx[4]),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \crc_rx_reg[5] 
       (.C(clk),
        .CE(\crc_rx[7]_i_1_n_0 ),
        .D(\crc_rx[29]_i_1_n_0 ),
        .Q(crc_rx[5]),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \crc_rx_reg[6] 
       (.C(clk),
        .CE(\crc_rx[7]_i_1_n_0 ),
        .D(\crc_rx[30]_i_1_n_0 ),
        .Q(crc_rx[6]),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \crc_rx_reg[7] 
       (.C(clk),
        .CE(\crc_rx[7]_i_1_n_0 ),
        .D(\crc_rx[31]_i_2_n_0 ),
        .Q(crc_rx[7]),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \crc_rx_reg[8] 
       (.C(clk),
        .CE(\crc_rx[15]_i_1_n_0 ),
        .D(\crc_rx[24]_i_1_n_0 ),
        .Q(crc_rx[8]),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \crc_rx_reg[9] 
       (.C(clk),
        .CE(\crc_rx[15]_i_1_n_0 ),
        .D(\crc_rx[25]_i_1_n_0 ),
        .Q(crc_rx[9]),
        .R(Frame_buf_reg_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h50C0)) 
    \payload_cnt[0]_i_1 
       (.I0(payload_cnt[0]),
        .I1(empty),
        .I2(\st_reg_n_0_[1] ),
        .I3(\st_reg_n_0_[0] ),
        .O(p_2_in__0[0]));
  LUT6 #(
    .INIT(64'h28280000FF000000)) 
    \payload_cnt[1]_i_1 
       (.I0(\payload_cnt[7]_i_3_n_0 ),
        .I1(payload_cnt[1]),
        .I2(payload_cnt[0]),
        .I3(empty),
        .I4(\st_reg_n_0_[1] ),
        .I5(\st_reg_n_0_[0] ),
        .O(p_2_in__0[1]));
  LUT6 #(
    .INIT(64'h82820000FF000000)) 
    \payload_cnt[2]_i_1 
       (.I0(\payload_cnt[7]_i_3_n_0 ),
        .I1(payload_cnt[2]),
        .I2(\payload_cnt[4]_i_4_n_0 ),
        .I3(empty),
        .I4(\st_reg_n_0_[1] ),
        .I5(\st_reg_n_0_[0] ),
        .O(p_2_in__0[2]));
  LUT6 #(
    .INIT(64'hFFFFFFFF80800880)) 
    \payload_cnt[3]_i_1 
       (.I0(\payload_cnt[7]_i_3_n_0 ),
        .I1(\payload_cnt[4]_i_2_n_0 ),
        .I2(payload_cnt[3]),
        .I3(payload_cnt[2]),
        .I4(\payload_cnt[4]_i_4_n_0 ),
        .I5(\payload_cnt[4]_i_5_n_0 ),
        .O(p_2_in__0[3]));
  LUT6 #(
    .INIT(64'hFFFFFFFF80800880)) 
    \payload_cnt[4]_i_1 
       (.I0(\payload_cnt[7]_i_3_n_0 ),
        .I1(\payload_cnt[4]_i_2_n_0 ),
        .I2(payload_cnt[4]),
        .I3(\payload_cnt[4]_i_3_n_0 ),
        .I4(\payload_cnt[4]_i_4_n_0 ),
        .I5(\payload_cnt[4]_i_5_n_0 ),
        .O(p_2_in__0[4]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \payload_cnt[4]_i_2 
       (.I0(\st_reg_n_0_[0] ),
        .I1(\st_reg_n_0_[1] ),
        .O(\payload_cnt[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \payload_cnt[4]_i_3 
       (.I0(payload_cnt[2]),
        .I1(payload_cnt[3]),
        .O(\payload_cnt[4]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \payload_cnt[4]_i_4 
       (.I0(payload_cnt[0]),
        .I1(payload_cnt[1]),
        .O(\payload_cnt[4]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \payload_cnt[4]_i_5 
       (.I0(\st_reg_n_0_[0] ),
        .I1(\st_reg_n_0_[1] ),
        .I2(empty),
        .O(\payload_cnt[4]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h8800F000)) 
    \payload_cnt[5]_i_1 
       (.I0(\payload_cnt[7]_i_3_n_0 ),
        .I1(\payload_cnt[5]_i_2_n_0 ),
        .I2(empty),
        .I3(\st_reg_n_0_[1] ),
        .I4(\st_reg_n_0_[0] ),
        .O(p_2_in__0[5]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \payload_cnt[5]_i_2 
       (.I0(payload_cnt[2]),
        .I1(payload_cnt[3]),
        .I2(payload_cnt[4]),
        .I3(payload_cnt[1]),
        .I4(payload_cnt[0]),
        .I5(payload_cnt[5]),
        .O(\payload_cnt[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h28280000FF000000)) 
    \payload_cnt[6]_i_1 
       (.I0(\payload_cnt[7]_i_3_n_0 ),
        .I1(payload_cnt[6]),
        .I2(\payload_cnt[6]_i_2_n_0 ),
        .I3(empty),
        .I4(\st_reg_n_0_[1] ),
        .I5(\st_reg_n_0_[0] ),
        .O(p_2_in__0[6]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \payload_cnt[6]_i_2 
       (.I0(payload_cnt[4]),
        .I1(payload_cnt[2]),
        .I2(payload_cnt[3]),
        .I3(payload_cnt[5]),
        .I4(payload_cnt[0]),
        .I5(payload_cnt[1]),
        .O(\payload_cnt[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0055000000105555)) 
    \payload_cnt[7]_i_1 
       (.I0(\st_reg_n_0_[2] ),
        .I1(seq_cnt[1]),
        .I2(seq_cnt[0]),
        .I3(empty),
        .I4(\st_reg_n_0_[1] ),
        .I5(\st_reg_n_0_[0] ),
        .O(\payload_cnt[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h28280000FF000000)) 
    \payload_cnt[7]_i_2 
       (.I0(\payload_cnt[7]_i_3_n_0 ),
        .I1(payload_cnt[7]),
        .I2(\payload_cnt[7]_i_4_n_0 ),
        .I3(empty),
        .I4(\st_reg_n_0_[1] ),
        .I5(\st_reg_n_0_[0] ),
        .O(p_2_in__0[7]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \payload_cnt[7]_i_3 
       (.I0(payload_cnt[4]),
        .I1(payload_cnt[7]),
        .I2(payload_cnt[2]),
        .I3(payload_cnt[3]),
        .I4(\payload_cnt[7]_i_5_n_0 ),
        .O(\payload_cnt[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000800000000000)) 
    \payload_cnt[7]_i_4 
       (.I0(payload_cnt[4]),
        .I1(payload_cnt[2]),
        .I2(payload_cnt[3]),
        .I3(payload_cnt[6]),
        .I4(\payload_cnt[4]_i_4_n_0 ),
        .I5(payload_cnt[5]),
        .O(\payload_cnt[7]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \payload_cnt[7]_i_5 
       (.I0(payload_cnt[5]),
        .I1(payload_cnt[0]),
        .I2(payload_cnt[1]),
        .I3(payload_cnt[6]),
        .O(\payload_cnt[7]_i_5_n_0 ));
  FDRE \payload_cnt_reg[0] 
       (.C(clk),
        .CE(\payload_cnt[7]_i_1_n_0 ),
        .D(p_2_in__0[0]),
        .Q(payload_cnt[0]),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \payload_cnt_reg[1] 
       (.C(clk),
        .CE(\payload_cnt[7]_i_1_n_0 ),
        .D(p_2_in__0[1]),
        .Q(payload_cnt[1]),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \payload_cnt_reg[2] 
       (.C(clk),
        .CE(\payload_cnt[7]_i_1_n_0 ),
        .D(p_2_in__0[2]),
        .Q(payload_cnt[2]),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \payload_cnt_reg[3] 
       (.C(clk),
        .CE(\payload_cnt[7]_i_1_n_0 ),
        .D(p_2_in__0[3]),
        .Q(payload_cnt[3]),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \payload_cnt_reg[4] 
       (.C(clk),
        .CE(\payload_cnt[7]_i_1_n_0 ),
        .D(p_2_in__0[4]),
        .Q(payload_cnt[4]),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \payload_cnt_reg[5] 
       (.C(clk),
        .CE(\payload_cnt[7]_i_1_n_0 ),
        .D(p_2_in__0[5]),
        .Q(payload_cnt[5]),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \payload_cnt_reg[6] 
       (.C(clk),
        .CE(\payload_cnt[7]_i_1_n_0 ),
        .D(p_2_in__0[6]),
        .Q(payload_cnt[6]),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \payload_cnt_reg[7] 
       (.C(clk),
        .CE(\payload_cnt[7]_i_1_n_0 ),
        .D(p_2_in__0[7]),
        .Q(payload_cnt[7]),
        .R(Frame_buf_reg_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'h11150000)) 
    rd_en_i_1
       (.I0(empty),
        .I1(\st_reg_n_0_[2] ),
        .I2(\st_reg_n_0_[1] ),
        .I3(\st_reg_n_0_[0] ),
        .I4(rst_n),
        .O(rd_en_i_1_n_0));
  FDRE rd_en_reg
       (.C(clk),
        .CE(1'b1),
        .D(rd_en_i_1_n_0),
        .Q(rd_en),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \rd_ptr[0]_i_1 
       (.I0(\st_reg_n_0_[1] ),
        .I1(rd_ptr_reg_rep[0]),
        .O(\rd_ptr[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rd_ptr[10]_i_1 
       (.I0(\st_reg_n_0_[1] ),
        .I1(rd_ptr0[10]),
        .O(p_2_in[10]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rd_ptr[11]_i_1 
       (.I0(\st_reg_n_0_[1] ),
        .I1(rd_ptr0[11]),
        .O(p_2_in[11]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rd_ptr[12]_i_1 
       (.I0(\st_reg_n_0_[1] ),
        .I1(rd_ptr0[12]),
        .O(p_2_in[12]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rd_ptr[13]_i_1 
       (.I0(\st_reg_n_0_[1] ),
        .I1(rd_ptr0[13]),
        .O(p_2_in[13]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rd_ptr[14]_i_1 
       (.I0(\st_reg_n_0_[1] ),
        .I1(rd_ptr0[14]),
        .O(p_2_in[14]));
  LUT6 #(
    .INIT(64'h00000C00AA0000FF)) 
    \rd_ptr[15]_i_1 
       (.I0(st1_carry__1_n_1),
        .I1(s_axis_tvalid_i_3_n_0),
        .I2(\rd_ptr[15]_i_3_n_0 ),
        .I3(\st_reg_n_0_[2] ),
        .I4(\st_reg_n_0_[0] ),
        .I5(\st_reg_n_0_[1] ),
        .O(\rd_ptr[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rd_ptr[15]_i_2 
       (.I0(\st_reg_n_0_[1] ),
        .I1(rd_ptr0[15]),
        .O(p_2_in[15]));
  LUT2 #(
    .INIT(4'h7)) 
    \rd_ptr[15]_i_3 
       (.I0(s_axis_tvalid_reg_0),
        .I1(s_axis_tready),
        .O(\rd_ptr[15]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \rd_ptr[1]_i_1 
       (.I0(\st_reg_n_0_[1] ),
        .I1(rd_ptr0[1]),
        .O(\rd_ptr[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rd_ptr[2]_i_1 
       (.I0(\st_reg_n_0_[1] ),
        .I1(rd_ptr0[2]),
        .O(\rd_ptr[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rd_ptr[3]_i_1 
       (.I0(\st_reg_n_0_[1] ),
        .I1(rd_ptr0[3]),
        .O(\rd_ptr[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rd_ptr[4]_i_1 
       (.I0(\st_reg_n_0_[1] ),
        .I1(rd_ptr0[4]),
        .O(\rd_ptr[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rd_ptr[5]_i_1 
       (.I0(\st_reg_n_0_[1] ),
        .I1(rd_ptr0[5]),
        .O(\rd_ptr[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rd_ptr[6]_i_1 
       (.I0(\st_reg_n_0_[1] ),
        .I1(rd_ptr0[6]),
        .O(\rd_ptr[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rd_ptr[7]_i_1 
       (.I0(\st_reg_n_0_[1] ),
        .I1(rd_ptr0[7]),
        .O(p_2_in[7]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rd_ptr[8]_i_1 
       (.I0(\st_reg_n_0_[1] ),
        .I1(rd_ptr0[8]),
        .O(p_2_in[8]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rd_ptr[9]_i_1 
       (.I0(\st_reg_n_0_[1] ),
        .I1(rd_ptr0[9]),
        .O(p_2_in[9]));
  FDRE \rd_ptr_reg[0] 
       (.C(clk),
        .CE(\rd_ptr[15]_i_1_n_0 ),
        .D(\rd_ptr[0]_i_1_n_0 ),
        .Q(rd_ptr_reg_rep[0]),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \rd_ptr_reg[10] 
       (.C(clk),
        .CE(\rd_ptr[15]_i_1_n_0 ),
        .D(p_2_in[10]),
        .Q(rd_ptr[10]),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \rd_ptr_reg[11] 
       (.C(clk),
        .CE(\rd_ptr[15]_i_1_n_0 ),
        .D(p_2_in[11]),
        .Q(rd_ptr[11]),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \rd_ptr_reg[12] 
       (.C(clk),
        .CE(\rd_ptr[15]_i_1_n_0 ),
        .D(p_2_in[12]),
        .Q(rd_ptr[12]),
        .R(Frame_buf_reg_i_3_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rd_ptr_reg[12]_i_2 
       (.CI(\rd_ptr_reg[8]_i_2_n_0 ),
        .CO({\rd_ptr_reg[12]_i_2_n_0 ,\rd_ptr_reg[12]_i_2_n_1 ,\rd_ptr_reg[12]_i_2_n_2 ,\rd_ptr_reg[12]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(rd_ptr0[12:9]),
        .S(rd_ptr[12:9]));
  FDRE \rd_ptr_reg[13] 
       (.C(clk),
        .CE(\rd_ptr[15]_i_1_n_0 ),
        .D(p_2_in[13]),
        .Q(rd_ptr[13]),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \rd_ptr_reg[14] 
       (.C(clk),
        .CE(\rd_ptr[15]_i_1_n_0 ),
        .D(p_2_in[14]),
        .Q(rd_ptr[14]),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \rd_ptr_reg[15] 
       (.C(clk),
        .CE(\rd_ptr[15]_i_1_n_0 ),
        .D(p_2_in[15]),
        .Q(rd_ptr[15]),
        .R(Frame_buf_reg_i_3_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rd_ptr_reg[15]_i_4 
       (.CI(\rd_ptr_reg[12]_i_2_n_0 ),
        .CO({\NLW_rd_ptr_reg[15]_i_4_CO_UNCONNECTED [3:2],\rd_ptr_reg[15]_i_4_n_2 ,\rd_ptr_reg[15]_i_4_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_rd_ptr_reg[15]_i_4_O_UNCONNECTED [3],rd_ptr0[15:13]}),
        .S({1'b0,rd_ptr[15:13]}));
  FDRE \rd_ptr_reg[1] 
       (.C(clk),
        .CE(\rd_ptr[15]_i_1_n_0 ),
        .D(\rd_ptr[1]_i_1_n_0 ),
        .Q(rd_ptr_reg_rep[1]),
        .R(Frame_buf_reg_i_3_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rd_ptr_reg[1]_i_2 
       (.CI(1'b0),
        .CO({\rd_ptr_reg[1]_i_2_n_0 ,\rd_ptr_reg[1]_i_2_n_1 ,\rd_ptr_reg[1]_i_2_n_2 ,\rd_ptr_reg[1]_i_2_n_3 }),
        .CYINIT(rd_ptr_reg_rep[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(rd_ptr0[4:1]),
        .S(rd_ptr_reg_rep[4:1]));
  FDRE \rd_ptr_reg[2] 
       (.C(clk),
        .CE(\rd_ptr[15]_i_1_n_0 ),
        .D(\rd_ptr[2]_i_1_n_0 ),
        .Q(rd_ptr_reg_rep[2]),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \rd_ptr_reg[3] 
       (.C(clk),
        .CE(\rd_ptr[15]_i_1_n_0 ),
        .D(\rd_ptr[3]_i_1_n_0 ),
        .Q(rd_ptr_reg_rep[3]),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \rd_ptr_reg[4] 
       (.C(clk),
        .CE(\rd_ptr[15]_i_1_n_0 ),
        .D(\rd_ptr[4]_i_1_n_0 ),
        .Q(rd_ptr_reg_rep[4]),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \rd_ptr_reg[5] 
       (.C(clk),
        .CE(\rd_ptr[15]_i_1_n_0 ),
        .D(\rd_ptr[5]_i_1_n_0 ),
        .Q(rd_ptr_reg_rep[5]),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \rd_ptr_reg[6] 
       (.C(clk),
        .CE(\rd_ptr[15]_i_1_n_0 ),
        .D(\rd_ptr[6]_i_1_n_0 ),
        .Q(rd_ptr_reg_rep[6]),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \rd_ptr_reg[7] 
       (.C(clk),
        .CE(\rd_ptr[15]_i_1_n_0 ),
        .D(p_2_in[7]),
        .Q(rd_ptr[7]),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \rd_ptr_reg[8] 
       (.C(clk),
        .CE(\rd_ptr[15]_i_1_n_0 ),
        .D(p_2_in[8]),
        .Q(rd_ptr[8]),
        .R(Frame_buf_reg_i_3_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rd_ptr_reg[8]_i_2 
       (.CI(\rd_ptr_reg[1]_i_2_n_0 ),
        .CO({\rd_ptr_reg[8]_i_2_n_0 ,\rd_ptr_reg[8]_i_2_n_1 ,\rd_ptr_reg[8]_i_2_n_2 ,\rd_ptr_reg[8]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(rd_ptr0[8:5]),
        .S({rd_ptr[8:7],rd_ptr_reg_rep[6:5]}));
  FDRE \rd_ptr_reg[9] 
       (.C(clk),
        .CE(\rd_ptr[15]_i_1_n_0 ),
        .D(p_2_in[9]),
        .Q(rd_ptr[9]),
        .R(Frame_buf_reg_i_3_n_0));
  LUT6 #(
    .INIT(64'hEE226E2200000000)) 
    s_axis_tvalid_i_1
       (.I0(s_axis_tvalid_reg_0),
        .I1(s_axis_tvalid_i_2_n_0),
        .I2(s_axis_tready),
        .I3(\st_reg_n_0_[2] ),
        .I4(s_axis_tvalid_i_3_n_0),
        .I5(rst_n),
        .O(s_axis_tvalid_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h41)) 
    s_axis_tvalid_i_2
       (.I0(\st_reg_n_0_[0] ),
        .I1(\st_reg_n_0_[2] ),
        .I2(\st_reg_n_0_[1] ),
        .O(s_axis_tvalid_i_2_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    s_axis_tvalid_i_3
       (.I0(s_axis_tvalid_i_4_n_0),
        .I1(s_axis_tvalid_i_5_n_0),
        .I2(s_axis_tvalid_i_6_n_0),
        .I3(s_axis_tvalid_i_7_n_0),
        .O(s_axis_tvalid_i_3_n_0));
  LUT4 #(
    .INIT(16'hFFDF)) 
    s_axis_tvalid_i_4
       (.I0(rd_ptr_reg_rep[5]),
        .I1(rd_ptr_reg_rep[4]),
        .I2(rd_ptr_reg_rep[6]),
        .I3(rd_ptr[7]),
        .O(s_axis_tvalid_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'hFF7F)) 
    s_axis_tvalid_i_5
       (.I0(rd_ptr_reg_rep[1]),
        .I1(rd_ptr_reg_rep[0]),
        .I2(rd_ptr_reg_rep[3]),
        .I3(rd_ptr_reg_rep[2]),
        .O(s_axis_tvalid_i_5_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    s_axis_tvalid_i_6
       (.I0(rd_ptr[13]),
        .I1(rd_ptr[12]),
        .I2(rd_ptr[15]),
        .I3(rd_ptr[14]),
        .O(s_axis_tvalid_i_6_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    s_axis_tvalid_i_7
       (.I0(rd_ptr[9]),
        .I1(rd_ptr[8]),
        .I2(rd_ptr[11]),
        .I3(rd_ptr[10]),
        .O(s_axis_tvalid_i_7_n_0));
  FDRE s_axis_tvalid_reg
       (.C(clk),
        .CE(1'b1),
        .D(s_axis_tvalid_i_1_n_0),
        .Q(s_axis_tvalid_reg_0),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hEE62626200000000)) 
    \seq_cnt[0]_i_1 
       (.I0(seq_cnt[0]),
        .I1(\seq_cnt[1]_i_2_n_0 ),
        .I2(\st_reg_n_0_[1] ),
        .I3(empty),
        .I4(\st_reg_n_0_[0] ),
        .I5(rst_n),
        .O(\seq_cnt[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEEEE22A200000000)) 
    \seq_cnt[1]_i_1 
       (.I0(seq_cnt[1]),
        .I1(\seq_cnt[1]_i_2_n_0 ),
        .I2(\st_reg_n_0_[1] ),
        .I3(seq_cnt[0]),
        .I4(\seq_cnt[1]_i_3_n_0 ),
        .I5(rst_n),
        .O(\seq_cnt[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h0005050D)) 
    \seq_cnt[1]_i_2 
       (.I0(\st_reg_n_0_[0] ),
        .I1(Frame_buf_reg_i_6_n_0),
        .I2(\st_reg_n_0_[2] ),
        .I3(empty),
        .I4(\st_reg_n_0_[1] ),
        .O(\seq_cnt[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \seq_cnt[1]_i_3 
       (.I0(empty),
        .I1(\st_reg_n_0_[0] ),
        .O(\seq_cnt[1]_i_3_n_0 ));
  FDRE \seq_cnt_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\seq_cnt[0]_i_1_n_0 ),
        .Q(seq_cnt[0]),
        .R(1'b0));
  FDRE \seq_cnt_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\seq_cnt[1]_i_1_n_0 ),
        .Q(seq_cnt[1]),
        .R(1'b0));
  CARRY4 st1_carry
       (.CI(1'b0),
        .CO({st1_carry_n_0,st1_carry_n_1,st1_carry_n_2,st1_carry_n_3}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_st1_carry_O_UNCONNECTED[3:0]),
        .S({st1_carry_i_1_n_0,st1_carry_i_2_n_0,st1_carry_i_3_n_0,st1_carry_i_4_n_0}));
  CARRY4 st1_carry__0
       (.CI(st1_carry_n_0),
        .CO({st1_carry__0_n_0,st1_carry__0_n_1,st1_carry__0_n_2,st1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_st1_carry__0_O_UNCONNECTED[3:0]),
        .S({st1_carry__0_i_1_n_0,st1_carry__0_i_2_n_0,st1_carry__0_i_3_n_0,st1_carry__0_i_4_n_0}));
  LUT6 #(
    .INIT(64'h0000066006600000)) 
    st1_carry__0_i_1
       (.I0(crc_rx[23]),
        .I1(crc_calc[23]),
        .I2(crc_rx[22]),
        .I3(crc_calc[22]),
        .I4(crc_calc[21]),
        .I5(crc_rx[21]),
        .O(st1_carry__0_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000066006600000)) 
    st1_carry__0_i_2
       (.I0(crc_rx[20]),
        .I1(crc_calc[20]),
        .I2(crc_rx[19]),
        .I3(crc_calc[19]),
        .I4(crc_calc[18]),
        .I5(crc_rx[18]),
        .O(st1_carry__0_i_2_n_0));
  LUT6 #(
    .INIT(64'h0000066006600000)) 
    st1_carry__0_i_3
       (.I0(crc_rx[17]),
        .I1(crc_calc[17]),
        .I2(crc_rx[16]),
        .I3(crc_calc[16]),
        .I4(crc_calc[15]),
        .I5(crc_rx[15]),
        .O(st1_carry__0_i_3_n_0));
  LUT6 #(
    .INIT(64'h0000066006600000)) 
    st1_carry__0_i_4
       (.I0(crc_rx[14]),
        .I1(crc_calc[14]),
        .I2(crc_rx[13]),
        .I3(crc_calc[13]),
        .I4(crc_calc[12]),
        .I5(crc_rx[12]),
        .O(st1_carry__0_i_4_n_0));
  CARRY4 st1_carry__1
       (.CI(st1_carry__0_n_0),
        .CO({NLW_st1_carry__1_CO_UNCONNECTED[3],st1_carry__1_n_1,st1_carry__1_n_2,st1_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_st1_carry__1_O_UNCONNECTED[3:0]),
        .S({1'b0,st1_carry__1_i_1_n_0,st1_carry__1_i_2_n_0,st1_carry__1_i_3_n_0}));
  LUT4 #(
    .INIT(16'h0660)) 
    st1_carry__1_i_1
       (.I0(crc_calc[30]),
        .I1(crc_rx[30]),
        .I2(crc_calc[31]),
        .I3(crc_rx[31]),
        .O(st1_carry__1_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000066006600000)) 
    st1_carry__1_i_2
       (.I0(crc_rx[29]),
        .I1(crc_calc[29]),
        .I2(crc_rx[28]),
        .I3(crc_calc[28]),
        .I4(crc_calc[27]),
        .I5(crc_rx[27]),
        .O(st1_carry__1_i_2_n_0));
  LUT6 #(
    .INIT(64'h0000066006600000)) 
    st1_carry__1_i_3
       (.I0(crc_rx[26]),
        .I1(crc_calc[26]),
        .I2(crc_rx[25]),
        .I3(crc_calc[25]),
        .I4(crc_calc[24]),
        .I5(crc_rx[24]),
        .O(st1_carry__1_i_3_n_0));
  LUT6 #(
    .INIT(64'h0000066006600000)) 
    st1_carry_i_1
       (.I0(crc_rx[11]),
        .I1(crc_calc[11]),
        .I2(crc_rx[10]),
        .I3(crc_calc[10]),
        .I4(crc_calc[9]),
        .I5(crc_rx[9]),
        .O(st1_carry_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000066006600000)) 
    st1_carry_i_2
       (.I0(crc_rx[8]),
        .I1(crc_calc[8]),
        .I2(crc_rx[7]),
        .I3(crc_calc[7]),
        .I4(crc_calc[6]),
        .I5(crc_rx[6]),
        .O(st1_carry_i_2_n_0));
  LUT6 #(
    .INIT(64'h0000066006600000)) 
    st1_carry_i_3
       (.I0(crc_rx[5]),
        .I1(crc_calc[5]),
        .I2(crc_rx[4]),
        .I3(crc_calc[4]),
        .I4(crc_calc[3]),
        .I5(crc_rx[3]),
        .O(st1_carry_i_3_n_0));
  LUT6 #(
    .INIT(64'h0000066006600000)) 
    st1_carry_i_4
       (.I0(crc_rx[2]),
        .I1(crc_calc[2]),
        .I2(crc_rx[1]),
        .I3(crc_calc[1]),
        .I4(crc_calc[0]),
        .I5(crc_rx[0]),
        .O(st1_carry_i_4_n_0));
  LUT6 #(
    .INIT(64'hFF00FFFFFF040000)) 
    \st[0]_i_1 
       (.I0(\st[0]_i_2_n_0 ),
        .I1(\st_reg_n_0_[2] ),
        .I2(\st_reg_n_0_[1] ),
        .I3(\st[0]_i_3_n_0 ),
        .I4(\st[2]_i_3_n_0 ),
        .I5(\st_reg_n_0_[0] ),
        .O(\st[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hDF)) 
    \st[0]_i_2 
       (.I0(crc_cnt[1]),
        .I1(crc_cnt[2]),
        .I2(crc_cnt[0]),
        .O(\st[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAFAAABBAA)) 
    \st[0]_i_3 
       (.I0(\st[0]_i_4_n_0 ),
        .I1(\st[0]_i_5_n_0 ),
        .I2(\payload_cnt[7]_i_3_n_0 ),
        .I3(\st_reg_n_0_[1] ),
        .I4(\st_reg_n_0_[0] ),
        .I5(\st_reg_n_0_[2] ),
        .O(\st[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000010000000000)) 
    \st[0]_i_4 
       (.I0(\st_reg_n_0_[1] ),
        .I1(\st_reg_n_0_[0] ),
        .I2(\st_reg_n_0_[2] ),
        .I3(dout[1]),
        .I4(dout[0]),
        .I5(Frame_buf_reg_i_7_n_0),
        .O(\st[0]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \st[0]_i_5 
       (.I0(seq_cnt[1]),
        .I1(seq_cnt[0]),
        .O(\st[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFF51FFFFFF000000)) 
    \st[1]_i_1 
       (.I0(\st_reg_n_0_[0] ),
        .I1(\st_reg_n_0_[2] ),
        .I2(s_axis_tvalid_i_3_n_0),
        .I3(\st[1]_i_2_n_0 ),
        .I4(\st[2]_i_3_n_0 ),
        .I5(\st_reg_n_0_[1] ),
        .O(\st[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00C0AAF000C0AA00)) 
    \st[1]_i_2 
       (.I0(\payload_cnt[7]_i_3_n_0 ),
        .I1(st1_carry__1_n_1),
        .I2(\st_reg_n_0_[0] ),
        .I3(\st_reg_n_0_[1] ),
        .I4(\st_reg_n_0_[2] ),
        .I5(Frame_buf_reg_i_6_n_0),
        .O(\st[1]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \st[2]_i_1 
       (.I0(\st[2]_i_2_n_0 ),
        .I1(\st[2]_i_3_n_0 ),
        .I2(\st_reg_n_0_[2] ),
        .O(\st[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0C8C008C3C8C308C)) 
    \st[2]_i_2 
       (.I0(s_axis_tvalid_i_3_n_0),
        .I1(\st_reg_n_0_[2] ),
        .I2(\st_reg_n_0_[1] ),
        .I3(\st_reg_n_0_[0] ),
        .I4(st1_carry__1_n_1),
        .I5(\payload_cnt[7]_i_3_n_0 ),
        .O(\st[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF00FF80D500FF)) 
    \st[2]_i_3 
       (.I0(\st_reg_n_0_[1] ),
        .I1(s_axis_tready),
        .I2(s_axis_tvalid_reg_0),
        .I3(empty),
        .I4(\st_reg_n_0_[2] ),
        .I5(\st_reg_n_0_[0] ),
        .O(\st[2]_i_3_n_0 ));
  FDRE \st_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\st[0]_i_1_n_0 ),
        .Q(\st_reg_n_0_[0] ),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \st_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\st[1]_i_1_n_0 ),
        .Q(\st_reg_n_0_[1] ),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \st_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\st[2]_i_1_n_0 ),
        .Q(\st_reg_n_0_[2] ),
        .R(Frame_buf_reg_i_3_n_0));
  CARRY4 wr_ptr0_carry
       (.CI(1'b0),
        .CO({wr_ptr0_carry_n_0,wr_ptr0_carry_n_1,wr_ptr0_carry_n_2,wr_ptr0_carry_n_3}),
        .CYINIT(\wr_ptr_reg_n_0_[0] ),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[4:1]),
        .S({\wr_ptr_reg_n_0_[4] ,\wr_ptr_reg_n_0_[3] ,\wr_ptr_reg_n_0_[2] ,\wr_ptr_reg_n_0_[1] }));
  CARRY4 wr_ptr0_carry__0
       (.CI(wr_ptr0_carry_n_0),
        .CO({NLW_wr_ptr0_carry__0_CO_UNCONNECTED[3:1],wr_ptr0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_wr_ptr0_carry__0_O_UNCONNECTED[3:2],data0[6:5]}),
        .S({1'b0,1'b0,\wr_ptr_reg_n_0_[6] ,\wr_ptr_reg_n_0_[5] }));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wr_ptr[0]_i_1 
       (.I0(\wr_ptr[6]_i_3_n_0 ),
        .I1(\wr_ptr_reg_n_0_[0] ),
        .O(\wr_ptr[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \wr_ptr[1]_i_1 
       (.I0(\wr_ptr[6]_i_3_n_0 ),
        .I1(data0[1]),
        .O(\wr_ptr[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \wr_ptr[2]_i_1 
       (.I0(\wr_ptr[6]_i_3_n_0 ),
        .I1(data0[2]),
        .O(\wr_ptr[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \wr_ptr[3]_i_1 
       (.I0(\wr_ptr[6]_i_3_n_0 ),
        .I1(data0[3]),
        .O(\wr_ptr[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \wr_ptr[4]_i_1 
       (.I0(\wr_ptr[6]_i_3_n_0 ),
        .I1(data0[4]),
        .O(\wr_ptr[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \wr_ptr[5]_i_1 
       (.I0(\wr_ptr[6]_i_3_n_0 ),
        .I1(data0[5]),
        .O(\wr_ptr[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h011F011B)) 
    \wr_ptr[6]_i_1 
       (.I0(\st_reg_n_0_[1] ),
        .I1(\st_reg_n_0_[0] ),
        .I2(empty),
        .I3(\st_reg_n_0_[2] ),
        .I4(Frame_buf_reg_i_6_n_0),
        .O(\wr_ptr[6]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \wr_ptr[6]_i_2 
       (.I0(\wr_ptr[6]_i_3_n_0 ),
        .I1(data0[6]),
        .O(\wr_ptr[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hEEEEEEEEEEFEEEEE)) 
    \wr_ptr[6]_i_3 
       (.I0(\wr_ptr[6]_i_4_n_0 ),
        .I1(\st_reg_n_0_[2] ),
        .I2(\wr_ptr[6]_i_5_n_0 ),
        .I3(dout[0]),
        .I4(dout[1]),
        .I5(dout[2]),
        .O(\wr_ptr[6]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \wr_ptr[6]_i_4 
       (.I0(\st_reg_n_0_[0] ),
        .I1(\st_reg_n_0_[1] ),
        .O(\wr_ptr[6]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    \wr_ptr[6]_i_5 
       (.I0(dout[3]),
        .I1(dout[4]),
        .I2(dout[5]),
        .I3(dout[6]),
        .I4(empty),
        .I5(dout[7]),
        .O(\wr_ptr[6]_i_5_n_0 ));
  FDRE \wr_ptr_reg[0] 
       (.C(clk),
        .CE(\wr_ptr[6]_i_1_n_0 ),
        .D(\wr_ptr[0]_i_1_n_0 ),
        .Q(\wr_ptr_reg_n_0_[0] ),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \wr_ptr_reg[1] 
       (.C(clk),
        .CE(\wr_ptr[6]_i_1_n_0 ),
        .D(\wr_ptr[1]_i_1_n_0 ),
        .Q(\wr_ptr_reg_n_0_[1] ),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \wr_ptr_reg[2] 
       (.C(clk),
        .CE(\wr_ptr[6]_i_1_n_0 ),
        .D(\wr_ptr[2]_i_1_n_0 ),
        .Q(\wr_ptr_reg_n_0_[2] ),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \wr_ptr_reg[3] 
       (.C(clk),
        .CE(\wr_ptr[6]_i_1_n_0 ),
        .D(\wr_ptr[3]_i_1_n_0 ),
        .Q(\wr_ptr_reg_n_0_[3] ),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \wr_ptr_reg[4] 
       (.C(clk),
        .CE(\wr_ptr[6]_i_1_n_0 ),
        .D(\wr_ptr[4]_i_1_n_0 ),
        .Q(\wr_ptr_reg_n_0_[4] ),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \wr_ptr_reg[5] 
       (.C(clk),
        .CE(\wr_ptr[6]_i_1_n_0 ),
        .D(\wr_ptr[5]_i_1_n_0 ),
        .Q(\wr_ptr_reg_n_0_[5] ),
        .R(Frame_buf_reg_i_3_n_0));
  FDRE \wr_ptr_reg[6] 
       (.C(clk),
        .CE(\wr_ptr[6]_i_1_n_0 ),
        .D(\wr_ptr[6]_i_2_n_0 ),
        .Q(\wr_ptr_reg_n_0_[6] ),
        .R(Frame_buf_reg_i_3_n_0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
