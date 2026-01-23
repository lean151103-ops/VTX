// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Fri Jan 23 12:08:45 2026
// Host        : DESKTOP-518F4EG running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/Xilinx/Xlinx_project/test_uart_23-1/test_uart_23-1.gen/sources_1/bd/design_1/ip/design_1_uart_tx_0_0/design_1_uart_tx_0_0_sim_netlist.v
// Design      : design_1_uart_tx_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_uart_tx_0_0,uart_tx,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "uart_tx,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module design_1_uart_tx_0_0
   (tclock,
    tenable,
    tdin,
    tdone,
    TX);
  input tclock;
  input tenable;
  input [7:0]tdin;
  output tdone;
  output TX;

  wire TX;
  wire tclock;
  wire [7:0]tdin;
  wire tdone;
  wire tenable;

  design_1_uart_tx_0_0_uart_tx inst
       (.TX(TX),
        .tclock(tclock),
        .tdin(tdin),
        .tdone(tdone),
        .tenable(tenable));
endmodule

(* ORIG_REF_NAME = "uart_tx" *) 
module design_1_uart_tx_0_0_uart_tx
   (TX,
    tdone,
    tclock,
    tenable,
    tdin);
  output TX;
  output tdone;
  input tclock;
  input tenable;
  input [7:0]tdin;

  wire TX;
  wire TX_i_1_n_0;
  wire TX_i_2_n_0;
  wire TX_i_3_n_0;
  wire bit_index_tx;
  wire bit_index_tx1_carry__0_i_1_n_0;
  wire bit_index_tx1_carry__0_i_2_n_0;
  wire bit_index_tx1_carry__0_i_3_n_0;
  wire bit_index_tx1_carry__0_i_4_n_0;
  wire bit_index_tx1_carry__0_n_0;
  wire bit_index_tx1_carry__0_n_1;
  wire bit_index_tx1_carry__0_n_2;
  wire bit_index_tx1_carry__0_n_3;
  wire bit_index_tx1_carry__1_i_1_n_0;
  wire bit_index_tx1_carry__1_i_2_n_0;
  wire bit_index_tx1_carry__1_i_3_n_0;
  wire bit_index_tx1_carry__1_i_4_n_0;
  wire bit_index_tx1_carry__1_n_0;
  wire bit_index_tx1_carry__1_n_1;
  wire bit_index_tx1_carry__1_n_2;
  wire bit_index_tx1_carry__1_n_3;
  wire bit_index_tx1_carry__2_i_1_n_0;
  wire bit_index_tx1_carry__2_i_2_n_0;
  wire bit_index_tx1_carry__2_i_3_n_0;
  wire bit_index_tx1_carry__2_i_4_n_0;
  wire bit_index_tx1_carry__2_n_0;
  wire bit_index_tx1_carry__2_n_1;
  wire bit_index_tx1_carry__2_n_2;
  wire bit_index_tx1_carry__2_n_3;
  wire bit_index_tx1_carry_i_1_n_0;
  wire bit_index_tx1_carry_i_2_n_0;
  wire bit_index_tx1_carry_i_3_n_0;
  wire bit_index_tx1_carry_i_4_n_0;
  wire bit_index_tx1_carry_i_5_n_0;
  wire bit_index_tx1_carry_i_6_n_0;
  wire bit_index_tx1_carry_n_0;
  wire bit_index_tx1_carry_n_1;
  wire bit_index_tx1_carry_n_2;
  wire bit_index_tx1_carry_n_3;
  wire \bit_index_tx[0]_i_3_n_0 ;
  wire \bit_index_tx[0]_i_4_n_0 ;
  wire \bit_index_tx[0]_i_5_n_0 ;
  wire \bit_index_tx[0]_i_6_n_0 ;
  wire \bit_index_tx[12]_i_2_n_0 ;
  wire \bit_index_tx[12]_i_3_n_0 ;
  wire \bit_index_tx[12]_i_4_n_0 ;
  wire \bit_index_tx[12]_i_5_n_0 ;
  wire \bit_index_tx[16]_i_2_n_0 ;
  wire \bit_index_tx[16]_i_3_n_0 ;
  wire \bit_index_tx[16]_i_4_n_0 ;
  wire \bit_index_tx[16]_i_5_n_0 ;
  wire \bit_index_tx[20]_i_2_n_0 ;
  wire \bit_index_tx[20]_i_3_n_0 ;
  wire \bit_index_tx[20]_i_4_n_0 ;
  wire \bit_index_tx[20]_i_5_n_0 ;
  wire \bit_index_tx[24]_i_2_n_0 ;
  wire \bit_index_tx[24]_i_3_n_0 ;
  wire \bit_index_tx[24]_i_4_n_0 ;
  wire \bit_index_tx[24]_i_5_n_0 ;
  wire \bit_index_tx[28]_i_2_n_0 ;
  wire \bit_index_tx[28]_i_3_n_0 ;
  wire \bit_index_tx[28]_i_4_n_0 ;
  wire \bit_index_tx[28]_i_5_n_0 ;
  wire \bit_index_tx[4]_i_2_n_0 ;
  wire \bit_index_tx[4]_i_3_n_0 ;
  wire \bit_index_tx[4]_i_4_n_0 ;
  wire \bit_index_tx[4]_i_5_n_0 ;
  wire \bit_index_tx[8]_i_2_n_0 ;
  wire \bit_index_tx[8]_i_3_n_0 ;
  wire \bit_index_tx[8]_i_4_n_0 ;
  wire \bit_index_tx[8]_i_5_n_0 ;
  wire [31:0]bit_index_tx_reg;
  wire \bit_index_tx_reg[0]_i_2_n_0 ;
  wire \bit_index_tx_reg[0]_i_2_n_1 ;
  wire \bit_index_tx_reg[0]_i_2_n_2 ;
  wire \bit_index_tx_reg[0]_i_2_n_3 ;
  wire \bit_index_tx_reg[0]_i_2_n_4 ;
  wire \bit_index_tx_reg[0]_i_2_n_5 ;
  wire \bit_index_tx_reg[0]_i_2_n_6 ;
  wire \bit_index_tx_reg[0]_i_2_n_7 ;
  wire \bit_index_tx_reg[12]_i_1_n_0 ;
  wire \bit_index_tx_reg[12]_i_1_n_1 ;
  wire \bit_index_tx_reg[12]_i_1_n_2 ;
  wire \bit_index_tx_reg[12]_i_1_n_3 ;
  wire \bit_index_tx_reg[12]_i_1_n_4 ;
  wire \bit_index_tx_reg[12]_i_1_n_5 ;
  wire \bit_index_tx_reg[12]_i_1_n_6 ;
  wire \bit_index_tx_reg[12]_i_1_n_7 ;
  wire \bit_index_tx_reg[16]_i_1_n_0 ;
  wire \bit_index_tx_reg[16]_i_1_n_1 ;
  wire \bit_index_tx_reg[16]_i_1_n_2 ;
  wire \bit_index_tx_reg[16]_i_1_n_3 ;
  wire \bit_index_tx_reg[16]_i_1_n_4 ;
  wire \bit_index_tx_reg[16]_i_1_n_5 ;
  wire \bit_index_tx_reg[16]_i_1_n_6 ;
  wire \bit_index_tx_reg[16]_i_1_n_7 ;
  wire \bit_index_tx_reg[20]_i_1_n_0 ;
  wire \bit_index_tx_reg[20]_i_1_n_1 ;
  wire \bit_index_tx_reg[20]_i_1_n_2 ;
  wire \bit_index_tx_reg[20]_i_1_n_3 ;
  wire \bit_index_tx_reg[20]_i_1_n_4 ;
  wire \bit_index_tx_reg[20]_i_1_n_5 ;
  wire \bit_index_tx_reg[20]_i_1_n_6 ;
  wire \bit_index_tx_reg[20]_i_1_n_7 ;
  wire \bit_index_tx_reg[24]_i_1_n_0 ;
  wire \bit_index_tx_reg[24]_i_1_n_1 ;
  wire \bit_index_tx_reg[24]_i_1_n_2 ;
  wire \bit_index_tx_reg[24]_i_1_n_3 ;
  wire \bit_index_tx_reg[24]_i_1_n_4 ;
  wire \bit_index_tx_reg[24]_i_1_n_5 ;
  wire \bit_index_tx_reg[24]_i_1_n_6 ;
  wire \bit_index_tx_reg[24]_i_1_n_7 ;
  wire \bit_index_tx_reg[28]_i_1_n_1 ;
  wire \bit_index_tx_reg[28]_i_1_n_2 ;
  wire \bit_index_tx_reg[28]_i_1_n_3 ;
  wire \bit_index_tx_reg[28]_i_1_n_4 ;
  wire \bit_index_tx_reg[28]_i_1_n_5 ;
  wire \bit_index_tx_reg[28]_i_1_n_6 ;
  wire \bit_index_tx_reg[28]_i_1_n_7 ;
  wire \bit_index_tx_reg[4]_i_1_n_0 ;
  wire \bit_index_tx_reg[4]_i_1_n_1 ;
  wire \bit_index_tx_reg[4]_i_1_n_2 ;
  wire \bit_index_tx_reg[4]_i_1_n_3 ;
  wire \bit_index_tx_reg[4]_i_1_n_4 ;
  wire \bit_index_tx_reg[4]_i_1_n_5 ;
  wire \bit_index_tx_reg[4]_i_1_n_6 ;
  wire \bit_index_tx_reg[4]_i_1_n_7 ;
  wire \bit_index_tx_reg[8]_i_1_n_0 ;
  wire \bit_index_tx_reg[8]_i_1_n_1 ;
  wire \bit_index_tx_reg[8]_i_1_n_2 ;
  wire \bit_index_tx_reg[8]_i_1_n_3 ;
  wire \bit_index_tx_reg[8]_i_1_n_4 ;
  wire \bit_index_tx_reg[8]_i_1_n_5 ;
  wire \bit_index_tx_reg[8]_i_1_n_6 ;
  wire \bit_index_tx_reg[8]_i_1_n_7 ;
  wire clk_count_tx1_carry__0_n_0;
  wire clk_count_tx1_carry__0_n_1;
  wire clk_count_tx1_carry__0_n_2;
  wire clk_count_tx1_carry__0_n_3;
  wire clk_count_tx1_carry__1_n_0;
  wire clk_count_tx1_carry__1_n_1;
  wire clk_count_tx1_carry__1_n_2;
  wire clk_count_tx1_carry__1_n_3;
  wire clk_count_tx1_carry__2_n_0;
  wire clk_count_tx1_carry__2_n_1;
  wire clk_count_tx1_carry__2_n_2;
  wire clk_count_tx1_carry__2_n_3;
  wire clk_count_tx1_carry_i_1__0_n_0;
  wire clk_count_tx1_carry_i_1__1_n_0;
  wire clk_count_tx1_carry_i_1__2_n_0;
  wire clk_count_tx1_carry_i_1_n_0;
  wire clk_count_tx1_carry_i_2__0_n_0;
  wire clk_count_tx1_carry_i_2__1_n_0;
  wire clk_count_tx1_carry_i_2__2_n_0;
  wire clk_count_tx1_carry_i_2_n_0;
  wire clk_count_tx1_carry_i_3__0_n_0;
  wire clk_count_tx1_carry_i_3__1_n_0;
  wire clk_count_tx1_carry_i_3__2_n_0;
  wire clk_count_tx1_carry_i_3_n_0;
  wire clk_count_tx1_carry_i_4__0_n_0;
  wire clk_count_tx1_carry_i_4__1_n_0;
  wire clk_count_tx1_carry_i_4__2_n_0;
  wire clk_count_tx1_carry_i_4_n_0;
  wire clk_count_tx1_carry_i_5__0_n_0;
  wire clk_count_tx1_carry_i_5_n_0;
  wire clk_count_tx1_carry_i_6_n_0;
  wire clk_count_tx1_carry_i_7_n_0;
  wire clk_count_tx1_carry_n_0;
  wire clk_count_tx1_carry_n_1;
  wire clk_count_tx1_carry_n_2;
  wire clk_count_tx1_carry_n_3;
  wire \clk_count_tx[0]_i_2_n_0 ;
  wire \clk_count_tx[0]_i_3_n_0 ;
  wire \clk_count_tx[0]_i_4_n_0 ;
  wire \clk_count_tx[0]_i_5_n_0 ;
  wire \clk_count_tx[12]_i_2_n_0 ;
  wire \clk_count_tx[12]_i_3_n_0 ;
  wire \clk_count_tx[12]_i_4_n_0 ;
  wire \clk_count_tx[12]_i_5_n_0 ;
  wire \clk_count_tx[16]_i_2_n_0 ;
  wire \clk_count_tx[16]_i_3_n_0 ;
  wire \clk_count_tx[16]_i_4_n_0 ;
  wire \clk_count_tx[16]_i_5_n_0 ;
  wire \clk_count_tx[20]_i_2_n_0 ;
  wire \clk_count_tx[20]_i_3_n_0 ;
  wire \clk_count_tx[20]_i_4_n_0 ;
  wire \clk_count_tx[20]_i_5_n_0 ;
  wire \clk_count_tx[24]_i_2_n_0 ;
  wire \clk_count_tx[24]_i_3_n_0 ;
  wire \clk_count_tx[24]_i_4_n_0 ;
  wire \clk_count_tx[24]_i_5_n_0 ;
  wire \clk_count_tx[28]_i_2_n_0 ;
  wire \clk_count_tx[28]_i_3_n_0 ;
  wire \clk_count_tx[28]_i_4_n_0 ;
  wire \clk_count_tx[28]_i_5_n_0 ;
  wire \clk_count_tx[4]_i_2_n_0 ;
  wire \clk_count_tx[4]_i_3_n_0 ;
  wire \clk_count_tx[4]_i_4_n_0 ;
  wire \clk_count_tx[4]_i_5_n_0 ;
  wire \clk_count_tx[8]_i_2_n_0 ;
  wire \clk_count_tx[8]_i_3_n_0 ;
  wire \clk_count_tx[8]_i_4_n_0 ;
  wire \clk_count_tx[8]_i_5_n_0 ;
  wire [31:0]clk_count_tx_reg;
  wire \clk_count_tx_reg[0]_i_1_n_0 ;
  wire \clk_count_tx_reg[0]_i_1_n_1 ;
  wire \clk_count_tx_reg[0]_i_1_n_2 ;
  wire \clk_count_tx_reg[0]_i_1_n_3 ;
  wire \clk_count_tx_reg[0]_i_1_n_4 ;
  wire \clk_count_tx_reg[0]_i_1_n_5 ;
  wire \clk_count_tx_reg[0]_i_1_n_6 ;
  wire \clk_count_tx_reg[0]_i_1_n_7 ;
  wire \clk_count_tx_reg[12]_i_1_n_0 ;
  wire \clk_count_tx_reg[12]_i_1_n_1 ;
  wire \clk_count_tx_reg[12]_i_1_n_2 ;
  wire \clk_count_tx_reg[12]_i_1_n_3 ;
  wire \clk_count_tx_reg[12]_i_1_n_4 ;
  wire \clk_count_tx_reg[12]_i_1_n_5 ;
  wire \clk_count_tx_reg[12]_i_1_n_6 ;
  wire \clk_count_tx_reg[12]_i_1_n_7 ;
  wire \clk_count_tx_reg[16]_i_1_n_0 ;
  wire \clk_count_tx_reg[16]_i_1_n_1 ;
  wire \clk_count_tx_reg[16]_i_1_n_2 ;
  wire \clk_count_tx_reg[16]_i_1_n_3 ;
  wire \clk_count_tx_reg[16]_i_1_n_4 ;
  wire \clk_count_tx_reg[16]_i_1_n_5 ;
  wire \clk_count_tx_reg[16]_i_1_n_6 ;
  wire \clk_count_tx_reg[16]_i_1_n_7 ;
  wire \clk_count_tx_reg[20]_i_1_n_0 ;
  wire \clk_count_tx_reg[20]_i_1_n_1 ;
  wire \clk_count_tx_reg[20]_i_1_n_2 ;
  wire \clk_count_tx_reg[20]_i_1_n_3 ;
  wire \clk_count_tx_reg[20]_i_1_n_4 ;
  wire \clk_count_tx_reg[20]_i_1_n_5 ;
  wire \clk_count_tx_reg[20]_i_1_n_6 ;
  wire \clk_count_tx_reg[20]_i_1_n_7 ;
  wire \clk_count_tx_reg[24]_i_1_n_0 ;
  wire \clk_count_tx_reg[24]_i_1_n_1 ;
  wire \clk_count_tx_reg[24]_i_1_n_2 ;
  wire \clk_count_tx_reg[24]_i_1_n_3 ;
  wire \clk_count_tx_reg[24]_i_1_n_4 ;
  wire \clk_count_tx_reg[24]_i_1_n_5 ;
  wire \clk_count_tx_reg[24]_i_1_n_6 ;
  wire \clk_count_tx_reg[24]_i_1_n_7 ;
  wire \clk_count_tx_reg[28]_i_1_n_1 ;
  wire \clk_count_tx_reg[28]_i_1_n_2 ;
  wire \clk_count_tx_reg[28]_i_1_n_3 ;
  wire \clk_count_tx_reg[28]_i_1_n_4 ;
  wire \clk_count_tx_reg[28]_i_1_n_5 ;
  wire \clk_count_tx_reg[28]_i_1_n_6 ;
  wire \clk_count_tx_reg[28]_i_1_n_7 ;
  wire \clk_count_tx_reg[4]_i_1_n_0 ;
  wire \clk_count_tx_reg[4]_i_1_n_1 ;
  wire \clk_count_tx_reg[4]_i_1_n_2 ;
  wire \clk_count_tx_reg[4]_i_1_n_3 ;
  wire \clk_count_tx_reg[4]_i_1_n_4 ;
  wire \clk_count_tx_reg[4]_i_1_n_5 ;
  wire \clk_count_tx_reg[4]_i_1_n_6 ;
  wire \clk_count_tx_reg[4]_i_1_n_7 ;
  wire \clk_count_tx_reg[8]_i_1_n_0 ;
  wire \clk_count_tx_reg[8]_i_1_n_1 ;
  wire \clk_count_tx_reg[8]_i_1_n_2 ;
  wire \clk_count_tx_reg[8]_i_1_n_3 ;
  wire \clk_count_tx_reg[8]_i_1_n_4 ;
  wire \clk_count_tx_reg[8]_i_1_n_5 ;
  wire \clk_count_tx_reg[8]_i_1_n_6 ;
  wire \clk_count_tx_reg[8]_i_1_n_7 ;
  wire [1:0]state_tx;
  wire [1:0]state_tx__0;
  wire tclock;
  wire [7:0]tdin;
  wire tdone;
  wire tdone0;
  wire tdone_i_2_n_0;
  wire tenable;
  wire [3:0]NLW_bit_index_tx1_carry_O_UNCONNECTED;
  wire [3:0]NLW_bit_index_tx1_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_bit_index_tx1_carry__1_O_UNCONNECTED;
  wire [3:0]NLW_bit_index_tx1_carry__2_O_UNCONNECTED;
  wire [3:3]\NLW_bit_index_tx_reg[28]_i_1_CO_UNCONNECTED ;
  wire [3:0]NLW_clk_count_tx1_carry_O_UNCONNECTED;
  wire [3:0]NLW_clk_count_tx1_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_clk_count_tx1_carry__1_O_UNCONNECTED;
  wire [3:0]NLW_clk_count_tx1_carry__2_O_UNCONNECTED;
  wire [3:3]\NLW_clk_count_tx_reg[28]_i_1_CO_UNCONNECTED ;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h89DD8988)) 
    \FSM_sequential_state_tx[0]_i_1 
       (.I0(state_tx[0]),
        .I1(clk_count_tx1_carry__2_n_0),
        .I2(bit_index_tx1_carry__2_n_0),
        .I3(state_tx[1]),
        .I4(tenable),
        .O(state_tx__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h9A)) 
    \FSM_sequential_state_tx[1]_i_1 
       (.I0(state_tx[1]),
        .I1(clk_count_tx1_carry__2_n_0),
        .I2(state_tx[0]),
        .O(state_tx__0[1]));
  (* FSM_ENCODED_STATES = "START_STATE:01,DATA_STATE:10,IDLE_STATE:00,STOP_STATE:11" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_tx_reg[0] 
       (.C(tclock),
        .CE(1'b1),
        .D(state_tx__0[0]),
        .Q(state_tx[0]),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "START_STATE:01,DATA_STATE:10,IDLE_STATE:00,STOP_STATE:11" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_tx_reg[1] 
       (.C(tclock),
        .CE(1'b1),
        .D(state_tx__0[1]),
        .Q(state_tx[1]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hFF00B8FF)) 
    TX_i_1
       (.I0(TX_i_2_n_0),
        .I1(bit_index_tx_reg[2]),
        .I2(TX_i_3_n_0),
        .I3(state_tx[1]),
        .I4(state_tx[0]),
        .O(TX_i_1_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    TX_i_2
       (.I0(tdin[7]),
        .I1(tdin[6]),
        .I2(bit_index_tx_reg[1]),
        .I3(tdin[5]),
        .I4(bit_index_tx_reg[0]),
        .I5(tdin[4]),
        .O(TX_i_2_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    TX_i_3
       (.I0(tdin[3]),
        .I1(tdin[2]),
        .I2(bit_index_tx_reg[1]),
        .I3(tdin[1]),
        .I4(bit_index_tx_reg[0]),
        .I5(tdin[0]),
        .O(TX_i_3_n_0));
  FDRE TX_reg
       (.C(tclock),
        .CE(1'b1),
        .D(TX_i_1_n_0),
        .Q(TX),
        .R(1'b0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 bit_index_tx1_carry
       (.CI(1'b0),
        .CO({bit_index_tx1_carry_n_0,bit_index_tx1_carry_n_1,bit_index_tx1_carry_n_2,bit_index_tx1_carry_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,bit_index_tx1_carry_i_1_n_0,bit_index_tx1_carry_i_2_n_0}),
        .O(NLW_bit_index_tx1_carry_O_UNCONNECTED[3:0]),
        .S({bit_index_tx1_carry_i_3_n_0,bit_index_tx1_carry_i_4_n_0,bit_index_tx1_carry_i_5_n_0,bit_index_tx1_carry_i_6_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 bit_index_tx1_carry__0
       (.CI(bit_index_tx1_carry_n_0),
        .CO({bit_index_tx1_carry__0_n_0,bit_index_tx1_carry__0_n_1,bit_index_tx1_carry__0_n_2,bit_index_tx1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_bit_index_tx1_carry__0_O_UNCONNECTED[3:0]),
        .S({bit_index_tx1_carry__0_i_1_n_0,bit_index_tx1_carry__0_i_2_n_0,bit_index_tx1_carry__0_i_3_n_0,bit_index_tx1_carry__0_i_4_n_0}));
  LUT2 #(
    .INIT(4'h1)) 
    bit_index_tx1_carry__0_i_1
       (.I0(bit_index_tx_reg[14]),
        .I1(bit_index_tx_reg[15]),
        .O(bit_index_tx1_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    bit_index_tx1_carry__0_i_2
       (.I0(bit_index_tx_reg[12]),
        .I1(bit_index_tx_reg[13]),
        .O(bit_index_tx1_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    bit_index_tx1_carry__0_i_3
       (.I0(bit_index_tx_reg[10]),
        .I1(bit_index_tx_reg[11]),
        .O(bit_index_tx1_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    bit_index_tx1_carry__0_i_4
       (.I0(bit_index_tx_reg[8]),
        .I1(bit_index_tx_reg[9]),
        .O(bit_index_tx1_carry__0_i_4_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 bit_index_tx1_carry__1
       (.CI(bit_index_tx1_carry__0_n_0),
        .CO({bit_index_tx1_carry__1_n_0,bit_index_tx1_carry__1_n_1,bit_index_tx1_carry__1_n_2,bit_index_tx1_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_bit_index_tx1_carry__1_O_UNCONNECTED[3:0]),
        .S({bit_index_tx1_carry__1_i_1_n_0,bit_index_tx1_carry__1_i_2_n_0,bit_index_tx1_carry__1_i_3_n_0,bit_index_tx1_carry__1_i_4_n_0}));
  LUT2 #(
    .INIT(4'h1)) 
    bit_index_tx1_carry__1_i_1
       (.I0(bit_index_tx_reg[22]),
        .I1(bit_index_tx_reg[23]),
        .O(bit_index_tx1_carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    bit_index_tx1_carry__1_i_2
       (.I0(bit_index_tx_reg[20]),
        .I1(bit_index_tx_reg[21]),
        .O(bit_index_tx1_carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    bit_index_tx1_carry__1_i_3
       (.I0(bit_index_tx_reg[18]),
        .I1(bit_index_tx_reg[19]),
        .O(bit_index_tx1_carry__1_i_3_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    bit_index_tx1_carry__1_i_4
       (.I0(bit_index_tx_reg[16]),
        .I1(bit_index_tx_reg[17]),
        .O(bit_index_tx1_carry__1_i_4_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 bit_index_tx1_carry__2
       (.CI(bit_index_tx1_carry__1_n_0),
        .CO({bit_index_tx1_carry__2_n_0,bit_index_tx1_carry__2_n_1,bit_index_tx1_carry__2_n_2,bit_index_tx1_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({bit_index_tx_reg[31],1'b0,1'b0,1'b0}),
        .O(NLW_bit_index_tx1_carry__2_O_UNCONNECTED[3:0]),
        .S({bit_index_tx1_carry__2_i_1_n_0,bit_index_tx1_carry__2_i_2_n_0,bit_index_tx1_carry__2_i_3_n_0,bit_index_tx1_carry__2_i_4_n_0}));
  LUT2 #(
    .INIT(4'h1)) 
    bit_index_tx1_carry__2_i_1
       (.I0(bit_index_tx_reg[30]),
        .I1(bit_index_tx_reg[31]),
        .O(bit_index_tx1_carry__2_i_1_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    bit_index_tx1_carry__2_i_2
       (.I0(bit_index_tx_reg[28]),
        .I1(bit_index_tx_reg[29]),
        .O(bit_index_tx1_carry__2_i_2_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    bit_index_tx1_carry__2_i_3
       (.I0(bit_index_tx_reg[26]),
        .I1(bit_index_tx_reg[27]),
        .O(bit_index_tx1_carry__2_i_3_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    bit_index_tx1_carry__2_i_4
       (.I0(bit_index_tx_reg[24]),
        .I1(bit_index_tx_reg[25]),
        .O(bit_index_tx1_carry__2_i_4_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    bit_index_tx1_carry_i_1
       (.I0(bit_index_tx_reg[2]),
        .I1(bit_index_tx_reg[3]),
        .O(bit_index_tx1_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h7)) 
    bit_index_tx1_carry_i_2
       (.I0(bit_index_tx_reg[0]),
        .I1(bit_index_tx_reg[1]),
        .O(bit_index_tx1_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    bit_index_tx1_carry_i_3
       (.I0(bit_index_tx_reg[6]),
        .I1(bit_index_tx_reg[7]),
        .O(bit_index_tx1_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    bit_index_tx1_carry_i_4
       (.I0(bit_index_tx_reg[4]),
        .I1(bit_index_tx_reg[5]),
        .O(bit_index_tx1_carry_i_4_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    bit_index_tx1_carry_i_5
       (.I0(bit_index_tx_reg[2]),
        .I1(bit_index_tx_reg[3]),
        .O(bit_index_tx1_carry_i_5_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    bit_index_tx1_carry_i_6
       (.I0(bit_index_tx_reg[0]),
        .I1(bit_index_tx_reg[1]),
        .O(bit_index_tx1_carry_i_6_n_0));
  LUT3 #(
    .INIT(8'h04)) 
    \bit_index_tx[0]_i_1 
       (.I0(state_tx[0]),
        .I1(state_tx[1]),
        .I2(clk_count_tx1_carry__2_n_0),
        .O(bit_index_tx));
  LUT2 #(
    .INIT(4'h8)) 
    \bit_index_tx[0]_i_3 
       (.I0(bit_index_tx1_carry__2_n_0),
        .I1(bit_index_tx_reg[3]),
        .O(\bit_index_tx[0]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \bit_index_tx[0]_i_4 
       (.I0(bit_index_tx1_carry__2_n_0),
        .I1(bit_index_tx_reg[2]),
        .O(\bit_index_tx[0]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \bit_index_tx[0]_i_5 
       (.I0(bit_index_tx1_carry__2_n_0),
        .I1(bit_index_tx_reg[1]),
        .O(\bit_index_tx[0]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h4)) 
    \bit_index_tx[0]_i_6 
       (.I0(bit_index_tx_reg[0]),
        .I1(bit_index_tx1_carry__2_n_0),
        .O(\bit_index_tx[0]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \bit_index_tx[12]_i_2 
       (.I0(bit_index_tx1_carry__2_n_0),
        .I1(bit_index_tx_reg[15]),
        .O(\bit_index_tx[12]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \bit_index_tx[12]_i_3 
       (.I0(bit_index_tx1_carry__2_n_0),
        .I1(bit_index_tx_reg[14]),
        .O(\bit_index_tx[12]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \bit_index_tx[12]_i_4 
       (.I0(bit_index_tx1_carry__2_n_0),
        .I1(bit_index_tx_reg[13]),
        .O(\bit_index_tx[12]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \bit_index_tx[12]_i_5 
       (.I0(bit_index_tx1_carry__2_n_0),
        .I1(bit_index_tx_reg[12]),
        .O(\bit_index_tx[12]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \bit_index_tx[16]_i_2 
       (.I0(bit_index_tx1_carry__2_n_0),
        .I1(bit_index_tx_reg[19]),
        .O(\bit_index_tx[16]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \bit_index_tx[16]_i_3 
       (.I0(bit_index_tx1_carry__2_n_0),
        .I1(bit_index_tx_reg[18]),
        .O(\bit_index_tx[16]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \bit_index_tx[16]_i_4 
       (.I0(bit_index_tx1_carry__2_n_0),
        .I1(bit_index_tx_reg[17]),
        .O(\bit_index_tx[16]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \bit_index_tx[16]_i_5 
       (.I0(bit_index_tx1_carry__2_n_0),
        .I1(bit_index_tx_reg[16]),
        .O(\bit_index_tx[16]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \bit_index_tx[20]_i_2 
       (.I0(bit_index_tx1_carry__2_n_0),
        .I1(bit_index_tx_reg[23]),
        .O(\bit_index_tx[20]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \bit_index_tx[20]_i_3 
       (.I0(bit_index_tx1_carry__2_n_0),
        .I1(bit_index_tx_reg[22]),
        .O(\bit_index_tx[20]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \bit_index_tx[20]_i_4 
       (.I0(bit_index_tx1_carry__2_n_0),
        .I1(bit_index_tx_reg[21]),
        .O(\bit_index_tx[20]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \bit_index_tx[20]_i_5 
       (.I0(bit_index_tx1_carry__2_n_0),
        .I1(bit_index_tx_reg[20]),
        .O(\bit_index_tx[20]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \bit_index_tx[24]_i_2 
       (.I0(bit_index_tx1_carry__2_n_0),
        .I1(bit_index_tx_reg[27]),
        .O(\bit_index_tx[24]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \bit_index_tx[24]_i_3 
       (.I0(bit_index_tx1_carry__2_n_0),
        .I1(bit_index_tx_reg[26]),
        .O(\bit_index_tx[24]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \bit_index_tx[24]_i_4 
       (.I0(bit_index_tx1_carry__2_n_0),
        .I1(bit_index_tx_reg[25]),
        .O(\bit_index_tx[24]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \bit_index_tx[24]_i_5 
       (.I0(bit_index_tx1_carry__2_n_0),
        .I1(bit_index_tx_reg[24]),
        .O(\bit_index_tx[24]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \bit_index_tx[28]_i_2 
       (.I0(bit_index_tx1_carry__2_n_0),
        .I1(bit_index_tx_reg[31]),
        .O(\bit_index_tx[28]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \bit_index_tx[28]_i_3 
       (.I0(bit_index_tx1_carry__2_n_0),
        .I1(bit_index_tx_reg[30]),
        .O(\bit_index_tx[28]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \bit_index_tx[28]_i_4 
       (.I0(bit_index_tx1_carry__2_n_0),
        .I1(bit_index_tx_reg[29]),
        .O(\bit_index_tx[28]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \bit_index_tx[28]_i_5 
       (.I0(bit_index_tx1_carry__2_n_0),
        .I1(bit_index_tx_reg[28]),
        .O(\bit_index_tx[28]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \bit_index_tx[4]_i_2 
       (.I0(bit_index_tx1_carry__2_n_0),
        .I1(bit_index_tx_reg[7]),
        .O(\bit_index_tx[4]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \bit_index_tx[4]_i_3 
       (.I0(bit_index_tx1_carry__2_n_0),
        .I1(bit_index_tx_reg[6]),
        .O(\bit_index_tx[4]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \bit_index_tx[4]_i_4 
       (.I0(bit_index_tx1_carry__2_n_0),
        .I1(bit_index_tx_reg[5]),
        .O(\bit_index_tx[4]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \bit_index_tx[4]_i_5 
       (.I0(bit_index_tx1_carry__2_n_0),
        .I1(bit_index_tx_reg[4]),
        .O(\bit_index_tx[4]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \bit_index_tx[8]_i_2 
       (.I0(bit_index_tx1_carry__2_n_0),
        .I1(bit_index_tx_reg[11]),
        .O(\bit_index_tx[8]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \bit_index_tx[8]_i_3 
       (.I0(bit_index_tx1_carry__2_n_0),
        .I1(bit_index_tx_reg[10]),
        .O(\bit_index_tx[8]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \bit_index_tx[8]_i_4 
       (.I0(bit_index_tx1_carry__2_n_0),
        .I1(bit_index_tx_reg[9]),
        .O(\bit_index_tx[8]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \bit_index_tx[8]_i_5 
       (.I0(bit_index_tx1_carry__2_n_0),
        .I1(bit_index_tx_reg[8]),
        .O(\bit_index_tx[8]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bit_index_tx_reg[0] 
       (.C(tclock),
        .CE(bit_index_tx),
        .D(\bit_index_tx_reg[0]_i_2_n_7 ),
        .Q(bit_index_tx_reg[0]),
        .R(tdone0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \bit_index_tx_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\bit_index_tx_reg[0]_i_2_n_0 ,\bit_index_tx_reg[0]_i_2_n_1 ,\bit_index_tx_reg[0]_i_2_n_2 ,\bit_index_tx_reg[0]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,bit_index_tx1_carry__2_n_0}),
        .O({\bit_index_tx_reg[0]_i_2_n_4 ,\bit_index_tx_reg[0]_i_2_n_5 ,\bit_index_tx_reg[0]_i_2_n_6 ,\bit_index_tx_reg[0]_i_2_n_7 }),
        .S({\bit_index_tx[0]_i_3_n_0 ,\bit_index_tx[0]_i_4_n_0 ,\bit_index_tx[0]_i_5_n_0 ,\bit_index_tx[0]_i_6_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \bit_index_tx_reg[10] 
       (.C(tclock),
        .CE(bit_index_tx),
        .D(\bit_index_tx_reg[8]_i_1_n_5 ),
        .Q(bit_index_tx_reg[10]),
        .R(tdone0));
  FDRE #(
    .INIT(1'b0)) 
    \bit_index_tx_reg[11] 
       (.C(tclock),
        .CE(bit_index_tx),
        .D(\bit_index_tx_reg[8]_i_1_n_4 ),
        .Q(bit_index_tx_reg[11]),
        .R(tdone0));
  FDRE #(
    .INIT(1'b0)) 
    \bit_index_tx_reg[12] 
       (.C(tclock),
        .CE(bit_index_tx),
        .D(\bit_index_tx_reg[12]_i_1_n_7 ),
        .Q(bit_index_tx_reg[12]),
        .R(tdone0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \bit_index_tx_reg[12]_i_1 
       (.CI(\bit_index_tx_reg[8]_i_1_n_0 ),
        .CO({\bit_index_tx_reg[12]_i_1_n_0 ,\bit_index_tx_reg[12]_i_1_n_1 ,\bit_index_tx_reg[12]_i_1_n_2 ,\bit_index_tx_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\bit_index_tx_reg[12]_i_1_n_4 ,\bit_index_tx_reg[12]_i_1_n_5 ,\bit_index_tx_reg[12]_i_1_n_6 ,\bit_index_tx_reg[12]_i_1_n_7 }),
        .S({\bit_index_tx[12]_i_2_n_0 ,\bit_index_tx[12]_i_3_n_0 ,\bit_index_tx[12]_i_4_n_0 ,\bit_index_tx[12]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \bit_index_tx_reg[13] 
       (.C(tclock),
        .CE(bit_index_tx),
        .D(\bit_index_tx_reg[12]_i_1_n_6 ),
        .Q(bit_index_tx_reg[13]),
        .R(tdone0));
  FDRE #(
    .INIT(1'b0)) 
    \bit_index_tx_reg[14] 
       (.C(tclock),
        .CE(bit_index_tx),
        .D(\bit_index_tx_reg[12]_i_1_n_5 ),
        .Q(bit_index_tx_reg[14]),
        .R(tdone0));
  FDRE #(
    .INIT(1'b0)) 
    \bit_index_tx_reg[15] 
       (.C(tclock),
        .CE(bit_index_tx),
        .D(\bit_index_tx_reg[12]_i_1_n_4 ),
        .Q(bit_index_tx_reg[15]),
        .R(tdone0));
  FDRE #(
    .INIT(1'b0)) 
    \bit_index_tx_reg[16] 
       (.C(tclock),
        .CE(bit_index_tx),
        .D(\bit_index_tx_reg[16]_i_1_n_7 ),
        .Q(bit_index_tx_reg[16]),
        .R(tdone0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \bit_index_tx_reg[16]_i_1 
       (.CI(\bit_index_tx_reg[12]_i_1_n_0 ),
        .CO({\bit_index_tx_reg[16]_i_1_n_0 ,\bit_index_tx_reg[16]_i_1_n_1 ,\bit_index_tx_reg[16]_i_1_n_2 ,\bit_index_tx_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\bit_index_tx_reg[16]_i_1_n_4 ,\bit_index_tx_reg[16]_i_1_n_5 ,\bit_index_tx_reg[16]_i_1_n_6 ,\bit_index_tx_reg[16]_i_1_n_7 }),
        .S({\bit_index_tx[16]_i_2_n_0 ,\bit_index_tx[16]_i_3_n_0 ,\bit_index_tx[16]_i_4_n_0 ,\bit_index_tx[16]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \bit_index_tx_reg[17] 
       (.C(tclock),
        .CE(bit_index_tx),
        .D(\bit_index_tx_reg[16]_i_1_n_6 ),
        .Q(bit_index_tx_reg[17]),
        .R(tdone0));
  FDRE #(
    .INIT(1'b0)) 
    \bit_index_tx_reg[18] 
       (.C(tclock),
        .CE(bit_index_tx),
        .D(\bit_index_tx_reg[16]_i_1_n_5 ),
        .Q(bit_index_tx_reg[18]),
        .R(tdone0));
  FDRE #(
    .INIT(1'b0)) 
    \bit_index_tx_reg[19] 
       (.C(tclock),
        .CE(bit_index_tx),
        .D(\bit_index_tx_reg[16]_i_1_n_4 ),
        .Q(bit_index_tx_reg[19]),
        .R(tdone0));
  FDRE #(
    .INIT(1'b0)) 
    \bit_index_tx_reg[1] 
       (.C(tclock),
        .CE(bit_index_tx),
        .D(\bit_index_tx_reg[0]_i_2_n_6 ),
        .Q(bit_index_tx_reg[1]),
        .R(tdone0));
  FDRE #(
    .INIT(1'b0)) 
    \bit_index_tx_reg[20] 
       (.C(tclock),
        .CE(bit_index_tx),
        .D(\bit_index_tx_reg[20]_i_1_n_7 ),
        .Q(bit_index_tx_reg[20]),
        .R(tdone0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \bit_index_tx_reg[20]_i_1 
       (.CI(\bit_index_tx_reg[16]_i_1_n_0 ),
        .CO({\bit_index_tx_reg[20]_i_1_n_0 ,\bit_index_tx_reg[20]_i_1_n_1 ,\bit_index_tx_reg[20]_i_1_n_2 ,\bit_index_tx_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\bit_index_tx_reg[20]_i_1_n_4 ,\bit_index_tx_reg[20]_i_1_n_5 ,\bit_index_tx_reg[20]_i_1_n_6 ,\bit_index_tx_reg[20]_i_1_n_7 }),
        .S({\bit_index_tx[20]_i_2_n_0 ,\bit_index_tx[20]_i_3_n_0 ,\bit_index_tx[20]_i_4_n_0 ,\bit_index_tx[20]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \bit_index_tx_reg[21] 
       (.C(tclock),
        .CE(bit_index_tx),
        .D(\bit_index_tx_reg[20]_i_1_n_6 ),
        .Q(bit_index_tx_reg[21]),
        .R(tdone0));
  FDRE #(
    .INIT(1'b0)) 
    \bit_index_tx_reg[22] 
       (.C(tclock),
        .CE(bit_index_tx),
        .D(\bit_index_tx_reg[20]_i_1_n_5 ),
        .Q(bit_index_tx_reg[22]),
        .R(tdone0));
  FDRE #(
    .INIT(1'b0)) 
    \bit_index_tx_reg[23] 
       (.C(tclock),
        .CE(bit_index_tx),
        .D(\bit_index_tx_reg[20]_i_1_n_4 ),
        .Q(bit_index_tx_reg[23]),
        .R(tdone0));
  FDRE #(
    .INIT(1'b0)) 
    \bit_index_tx_reg[24] 
       (.C(tclock),
        .CE(bit_index_tx),
        .D(\bit_index_tx_reg[24]_i_1_n_7 ),
        .Q(bit_index_tx_reg[24]),
        .R(tdone0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \bit_index_tx_reg[24]_i_1 
       (.CI(\bit_index_tx_reg[20]_i_1_n_0 ),
        .CO({\bit_index_tx_reg[24]_i_1_n_0 ,\bit_index_tx_reg[24]_i_1_n_1 ,\bit_index_tx_reg[24]_i_1_n_2 ,\bit_index_tx_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\bit_index_tx_reg[24]_i_1_n_4 ,\bit_index_tx_reg[24]_i_1_n_5 ,\bit_index_tx_reg[24]_i_1_n_6 ,\bit_index_tx_reg[24]_i_1_n_7 }),
        .S({\bit_index_tx[24]_i_2_n_0 ,\bit_index_tx[24]_i_3_n_0 ,\bit_index_tx[24]_i_4_n_0 ,\bit_index_tx[24]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \bit_index_tx_reg[25] 
       (.C(tclock),
        .CE(bit_index_tx),
        .D(\bit_index_tx_reg[24]_i_1_n_6 ),
        .Q(bit_index_tx_reg[25]),
        .R(tdone0));
  FDRE #(
    .INIT(1'b0)) 
    \bit_index_tx_reg[26] 
       (.C(tclock),
        .CE(bit_index_tx),
        .D(\bit_index_tx_reg[24]_i_1_n_5 ),
        .Q(bit_index_tx_reg[26]),
        .R(tdone0));
  FDRE #(
    .INIT(1'b0)) 
    \bit_index_tx_reg[27] 
       (.C(tclock),
        .CE(bit_index_tx),
        .D(\bit_index_tx_reg[24]_i_1_n_4 ),
        .Q(bit_index_tx_reg[27]),
        .R(tdone0));
  FDRE #(
    .INIT(1'b0)) 
    \bit_index_tx_reg[28] 
       (.C(tclock),
        .CE(bit_index_tx),
        .D(\bit_index_tx_reg[28]_i_1_n_7 ),
        .Q(bit_index_tx_reg[28]),
        .R(tdone0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \bit_index_tx_reg[28]_i_1 
       (.CI(\bit_index_tx_reg[24]_i_1_n_0 ),
        .CO({\NLW_bit_index_tx_reg[28]_i_1_CO_UNCONNECTED [3],\bit_index_tx_reg[28]_i_1_n_1 ,\bit_index_tx_reg[28]_i_1_n_2 ,\bit_index_tx_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\bit_index_tx_reg[28]_i_1_n_4 ,\bit_index_tx_reg[28]_i_1_n_5 ,\bit_index_tx_reg[28]_i_1_n_6 ,\bit_index_tx_reg[28]_i_1_n_7 }),
        .S({\bit_index_tx[28]_i_2_n_0 ,\bit_index_tx[28]_i_3_n_0 ,\bit_index_tx[28]_i_4_n_0 ,\bit_index_tx[28]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \bit_index_tx_reg[29] 
       (.C(tclock),
        .CE(bit_index_tx),
        .D(\bit_index_tx_reg[28]_i_1_n_6 ),
        .Q(bit_index_tx_reg[29]),
        .R(tdone0));
  FDRE #(
    .INIT(1'b0)) 
    \bit_index_tx_reg[2] 
       (.C(tclock),
        .CE(bit_index_tx),
        .D(\bit_index_tx_reg[0]_i_2_n_5 ),
        .Q(bit_index_tx_reg[2]),
        .R(tdone0));
  FDRE #(
    .INIT(1'b0)) 
    \bit_index_tx_reg[30] 
       (.C(tclock),
        .CE(bit_index_tx),
        .D(\bit_index_tx_reg[28]_i_1_n_5 ),
        .Q(bit_index_tx_reg[30]),
        .R(tdone0));
  FDRE #(
    .INIT(1'b0)) 
    \bit_index_tx_reg[31] 
       (.C(tclock),
        .CE(bit_index_tx),
        .D(\bit_index_tx_reg[28]_i_1_n_4 ),
        .Q(bit_index_tx_reg[31]),
        .R(tdone0));
  FDRE #(
    .INIT(1'b0)) 
    \bit_index_tx_reg[3] 
       (.C(tclock),
        .CE(bit_index_tx),
        .D(\bit_index_tx_reg[0]_i_2_n_4 ),
        .Q(bit_index_tx_reg[3]),
        .R(tdone0));
  FDRE #(
    .INIT(1'b0)) 
    \bit_index_tx_reg[4] 
       (.C(tclock),
        .CE(bit_index_tx),
        .D(\bit_index_tx_reg[4]_i_1_n_7 ),
        .Q(bit_index_tx_reg[4]),
        .R(tdone0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \bit_index_tx_reg[4]_i_1 
       (.CI(\bit_index_tx_reg[0]_i_2_n_0 ),
        .CO({\bit_index_tx_reg[4]_i_1_n_0 ,\bit_index_tx_reg[4]_i_1_n_1 ,\bit_index_tx_reg[4]_i_1_n_2 ,\bit_index_tx_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\bit_index_tx_reg[4]_i_1_n_4 ,\bit_index_tx_reg[4]_i_1_n_5 ,\bit_index_tx_reg[4]_i_1_n_6 ,\bit_index_tx_reg[4]_i_1_n_7 }),
        .S({\bit_index_tx[4]_i_2_n_0 ,\bit_index_tx[4]_i_3_n_0 ,\bit_index_tx[4]_i_4_n_0 ,\bit_index_tx[4]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \bit_index_tx_reg[5] 
       (.C(tclock),
        .CE(bit_index_tx),
        .D(\bit_index_tx_reg[4]_i_1_n_6 ),
        .Q(bit_index_tx_reg[5]),
        .R(tdone0));
  FDRE #(
    .INIT(1'b0)) 
    \bit_index_tx_reg[6] 
       (.C(tclock),
        .CE(bit_index_tx),
        .D(\bit_index_tx_reg[4]_i_1_n_5 ),
        .Q(bit_index_tx_reg[6]),
        .R(tdone0));
  FDRE #(
    .INIT(1'b0)) 
    \bit_index_tx_reg[7] 
       (.C(tclock),
        .CE(bit_index_tx),
        .D(\bit_index_tx_reg[4]_i_1_n_4 ),
        .Q(bit_index_tx_reg[7]),
        .R(tdone0));
  FDRE #(
    .INIT(1'b0)) 
    \bit_index_tx_reg[8] 
       (.C(tclock),
        .CE(bit_index_tx),
        .D(\bit_index_tx_reg[8]_i_1_n_7 ),
        .Q(bit_index_tx_reg[8]),
        .R(tdone0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \bit_index_tx_reg[8]_i_1 
       (.CI(\bit_index_tx_reg[4]_i_1_n_0 ),
        .CO({\bit_index_tx_reg[8]_i_1_n_0 ,\bit_index_tx_reg[8]_i_1_n_1 ,\bit_index_tx_reg[8]_i_1_n_2 ,\bit_index_tx_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\bit_index_tx_reg[8]_i_1_n_4 ,\bit_index_tx_reg[8]_i_1_n_5 ,\bit_index_tx_reg[8]_i_1_n_6 ,\bit_index_tx_reg[8]_i_1_n_7 }),
        .S({\bit_index_tx[8]_i_2_n_0 ,\bit_index_tx[8]_i_3_n_0 ,\bit_index_tx[8]_i_4_n_0 ,\bit_index_tx[8]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \bit_index_tx_reg[9] 
       (.C(tclock),
        .CE(bit_index_tx),
        .D(\bit_index_tx_reg[8]_i_1_n_6 ),
        .Q(bit_index_tx_reg[9]),
        .R(tdone0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 clk_count_tx1_carry
       (.CI(1'b0),
        .CO({clk_count_tx1_carry_n_0,clk_count_tx1_carry_n_1,clk_count_tx1_carry_n_2,clk_count_tx1_carry_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,clk_count_tx1_carry_i_1_n_0,clk_count_tx1_carry_i_2_n_0,clk_count_tx1_carry_i_3__2_n_0}),
        .O(NLW_clk_count_tx1_carry_O_UNCONNECTED[3:0]),
        .S({clk_count_tx1_carry_i_4__2_n_0,clk_count_tx1_carry_i_5_n_0,clk_count_tx1_carry_i_6_n_0,clk_count_tx1_carry_i_7_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 clk_count_tx1_carry__0
       (.CI(clk_count_tx1_carry_n_0),
        .CO({clk_count_tx1_carry__0_n_0,clk_count_tx1_carry__0_n_1,clk_count_tx1_carry__0_n_2,clk_count_tx1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,clk_count_tx1_carry_i_1__2_n_0,1'b0}),
        .O(NLW_clk_count_tx1_carry__0_O_UNCONNECTED[3:0]),
        .S({clk_count_tx1_carry_i_2__2_n_0,clk_count_tx1_carry_i_3__1_n_0,clk_count_tx1_carry_i_4__1_n_0,clk_count_tx1_carry_i_5__0_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 clk_count_tx1_carry__1
       (.CI(clk_count_tx1_carry__0_n_0),
        .CO({clk_count_tx1_carry__1_n_0,clk_count_tx1_carry__1_n_1,clk_count_tx1_carry__1_n_2,clk_count_tx1_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_clk_count_tx1_carry__1_O_UNCONNECTED[3:0]),
        .S({clk_count_tx1_carry_i_1__1_n_0,clk_count_tx1_carry_i_2__1_n_0,clk_count_tx1_carry_i_3__0_n_0,clk_count_tx1_carry_i_4__0_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 clk_count_tx1_carry__2
       (.CI(clk_count_tx1_carry__1_n_0),
        .CO({clk_count_tx1_carry__2_n_0,clk_count_tx1_carry__2_n_1,clk_count_tx1_carry__2_n_2,clk_count_tx1_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({clk_count_tx_reg[31],1'b0,1'b0,1'b0}),
        .O(NLW_clk_count_tx1_carry__2_O_UNCONNECTED[3:0]),
        .S({clk_count_tx1_carry_i_1__0_n_0,clk_count_tx1_carry_i_2__0_n_0,clk_count_tx1_carry_i_3_n_0,clk_count_tx1_carry_i_4_n_0}));
  LUT2 #(
    .INIT(4'h7)) 
    clk_count_tx1_carry_i_1
       (.I0(clk_count_tx_reg[4]),
        .I1(clk_count_tx_reg[5]),
        .O(clk_count_tx1_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    clk_count_tx1_carry_i_1__0
       (.I0(clk_count_tx_reg[30]),
        .I1(clk_count_tx_reg[31]),
        .O(clk_count_tx1_carry_i_1__0_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    clk_count_tx1_carry_i_1__1
       (.I0(clk_count_tx_reg[22]),
        .I1(clk_count_tx_reg[23]),
        .O(clk_count_tx1_carry_i_1__1_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    clk_count_tx1_carry_i_1__2
       (.I0(clk_count_tx_reg[10]),
        .I1(clk_count_tx_reg[11]),
        .O(clk_count_tx1_carry_i_1__2_n_0));
  LUT2 #(
    .INIT(4'h7)) 
    clk_count_tx1_carry_i_2
       (.I0(clk_count_tx_reg[2]),
        .I1(clk_count_tx_reg[3]),
        .O(clk_count_tx1_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    clk_count_tx1_carry_i_2__0
       (.I0(clk_count_tx_reg[28]),
        .I1(clk_count_tx_reg[29]),
        .O(clk_count_tx1_carry_i_2__0_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    clk_count_tx1_carry_i_2__1
       (.I0(clk_count_tx_reg[20]),
        .I1(clk_count_tx_reg[21]),
        .O(clk_count_tx1_carry_i_2__1_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    clk_count_tx1_carry_i_2__2
       (.I0(clk_count_tx_reg[14]),
        .I1(clk_count_tx_reg[15]),
        .O(clk_count_tx1_carry_i_2__2_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    clk_count_tx1_carry_i_3
       (.I0(clk_count_tx_reg[26]),
        .I1(clk_count_tx_reg[27]),
        .O(clk_count_tx1_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    clk_count_tx1_carry_i_3__0
       (.I0(clk_count_tx_reg[18]),
        .I1(clk_count_tx_reg[19]),
        .O(clk_count_tx1_carry_i_3__0_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    clk_count_tx1_carry_i_3__1
       (.I0(clk_count_tx_reg[12]),
        .I1(clk_count_tx_reg[13]),
        .O(clk_count_tx1_carry_i_3__1_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    clk_count_tx1_carry_i_3__2
       (.I0(clk_count_tx_reg[0]),
        .I1(clk_count_tx_reg[1]),
        .O(clk_count_tx1_carry_i_3__2_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    clk_count_tx1_carry_i_4
       (.I0(clk_count_tx_reg[24]),
        .I1(clk_count_tx_reg[25]),
        .O(clk_count_tx1_carry_i_4_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    clk_count_tx1_carry_i_4__0
       (.I0(clk_count_tx_reg[16]),
        .I1(clk_count_tx_reg[17]),
        .O(clk_count_tx1_carry_i_4__0_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    clk_count_tx1_carry_i_4__1
       (.I0(clk_count_tx_reg[10]),
        .I1(clk_count_tx_reg[11]),
        .O(clk_count_tx1_carry_i_4__1_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    clk_count_tx1_carry_i_4__2
       (.I0(clk_count_tx_reg[6]),
        .I1(clk_count_tx_reg[7]),
        .O(clk_count_tx1_carry_i_4__2_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    clk_count_tx1_carry_i_5
       (.I0(clk_count_tx_reg[4]),
        .I1(clk_count_tx_reg[5]),
        .O(clk_count_tx1_carry_i_5_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    clk_count_tx1_carry_i_5__0
       (.I0(clk_count_tx_reg[8]),
        .I1(clk_count_tx_reg[9]),
        .O(clk_count_tx1_carry_i_5__0_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    clk_count_tx1_carry_i_6
       (.I0(clk_count_tx_reg[2]),
        .I1(clk_count_tx_reg[3]),
        .O(clk_count_tx1_carry_i_6_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    clk_count_tx1_carry_i_7
       (.I0(clk_count_tx_reg[0]),
        .I1(clk_count_tx_reg[1]),
        .O(clk_count_tx1_carry_i_7_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    \clk_count_tx[0]_i_2 
       (.I0(clk_count_tx1_carry__2_n_0),
        .I1(clk_count_tx_reg[3]),
        .O(\clk_count_tx[0]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \clk_count_tx[0]_i_3 
       (.I0(clk_count_tx1_carry__2_n_0),
        .I1(clk_count_tx_reg[2]),
        .O(\clk_count_tx[0]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \clk_count_tx[0]_i_4 
       (.I0(clk_count_tx1_carry__2_n_0),
        .I1(clk_count_tx_reg[1]),
        .O(\clk_count_tx[0]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h4)) 
    \clk_count_tx[0]_i_5 
       (.I0(clk_count_tx_reg[0]),
        .I1(clk_count_tx1_carry__2_n_0),
        .O(\clk_count_tx[0]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \clk_count_tx[12]_i_2 
       (.I0(clk_count_tx1_carry__2_n_0),
        .I1(clk_count_tx_reg[15]),
        .O(\clk_count_tx[12]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \clk_count_tx[12]_i_3 
       (.I0(clk_count_tx1_carry__2_n_0),
        .I1(clk_count_tx_reg[14]),
        .O(\clk_count_tx[12]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \clk_count_tx[12]_i_4 
       (.I0(clk_count_tx1_carry__2_n_0),
        .I1(clk_count_tx_reg[13]),
        .O(\clk_count_tx[12]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \clk_count_tx[12]_i_5 
       (.I0(clk_count_tx1_carry__2_n_0),
        .I1(clk_count_tx_reg[12]),
        .O(\clk_count_tx[12]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \clk_count_tx[16]_i_2 
       (.I0(clk_count_tx1_carry__2_n_0),
        .I1(clk_count_tx_reg[19]),
        .O(\clk_count_tx[16]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \clk_count_tx[16]_i_3 
       (.I0(clk_count_tx1_carry__2_n_0),
        .I1(clk_count_tx_reg[18]),
        .O(\clk_count_tx[16]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \clk_count_tx[16]_i_4 
       (.I0(clk_count_tx1_carry__2_n_0),
        .I1(clk_count_tx_reg[17]),
        .O(\clk_count_tx[16]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \clk_count_tx[16]_i_5 
       (.I0(clk_count_tx1_carry__2_n_0),
        .I1(clk_count_tx_reg[16]),
        .O(\clk_count_tx[16]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \clk_count_tx[20]_i_2 
       (.I0(clk_count_tx1_carry__2_n_0),
        .I1(clk_count_tx_reg[23]),
        .O(\clk_count_tx[20]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \clk_count_tx[20]_i_3 
       (.I0(clk_count_tx1_carry__2_n_0),
        .I1(clk_count_tx_reg[22]),
        .O(\clk_count_tx[20]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \clk_count_tx[20]_i_4 
       (.I0(clk_count_tx1_carry__2_n_0),
        .I1(clk_count_tx_reg[21]),
        .O(\clk_count_tx[20]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \clk_count_tx[20]_i_5 
       (.I0(clk_count_tx1_carry__2_n_0),
        .I1(clk_count_tx_reg[20]),
        .O(\clk_count_tx[20]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \clk_count_tx[24]_i_2 
       (.I0(clk_count_tx1_carry__2_n_0),
        .I1(clk_count_tx_reg[27]),
        .O(\clk_count_tx[24]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \clk_count_tx[24]_i_3 
       (.I0(clk_count_tx1_carry__2_n_0),
        .I1(clk_count_tx_reg[26]),
        .O(\clk_count_tx[24]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \clk_count_tx[24]_i_4 
       (.I0(clk_count_tx1_carry__2_n_0),
        .I1(clk_count_tx_reg[25]),
        .O(\clk_count_tx[24]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \clk_count_tx[24]_i_5 
       (.I0(clk_count_tx1_carry__2_n_0),
        .I1(clk_count_tx_reg[24]),
        .O(\clk_count_tx[24]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \clk_count_tx[28]_i_2 
       (.I0(clk_count_tx1_carry__2_n_0),
        .I1(clk_count_tx_reg[31]),
        .O(\clk_count_tx[28]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \clk_count_tx[28]_i_3 
       (.I0(clk_count_tx1_carry__2_n_0),
        .I1(clk_count_tx_reg[30]),
        .O(\clk_count_tx[28]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \clk_count_tx[28]_i_4 
       (.I0(clk_count_tx1_carry__2_n_0),
        .I1(clk_count_tx_reg[29]),
        .O(\clk_count_tx[28]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \clk_count_tx[28]_i_5 
       (.I0(clk_count_tx1_carry__2_n_0),
        .I1(clk_count_tx_reg[28]),
        .O(\clk_count_tx[28]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \clk_count_tx[4]_i_2 
       (.I0(clk_count_tx1_carry__2_n_0),
        .I1(clk_count_tx_reg[7]),
        .O(\clk_count_tx[4]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \clk_count_tx[4]_i_3 
       (.I0(clk_count_tx1_carry__2_n_0),
        .I1(clk_count_tx_reg[6]),
        .O(\clk_count_tx[4]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \clk_count_tx[4]_i_4 
       (.I0(clk_count_tx1_carry__2_n_0),
        .I1(clk_count_tx_reg[5]),
        .O(\clk_count_tx[4]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \clk_count_tx[4]_i_5 
       (.I0(clk_count_tx1_carry__2_n_0),
        .I1(clk_count_tx_reg[4]),
        .O(\clk_count_tx[4]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \clk_count_tx[8]_i_2 
       (.I0(clk_count_tx1_carry__2_n_0),
        .I1(clk_count_tx_reg[11]),
        .O(\clk_count_tx[8]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \clk_count_tx[8]_i_3 
       (.I0(clk_count_tx1_carry__2_n_0),
        .I1(clk_count_tx_reg[10]),
        .O(\clk_count_tx[8]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \clk_count_tx[8]_i_4 
       (.I0(clk_count_tx1_carry__2_n_0),
        .I1(clk_count_tx_reg[9]),
        .O(\clk_count_tx[8]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \clk_count_tx[8]_i_5 
       (.I0(clk_count_tx1_carry__2_n_0),
        .I1(clk_count_tx_reg[8]),
        .O(\clk_count_tx[8]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_tx_reg[0] 
       (.C(tclock),
        .CE(1'b1),
        .D(\clk_count_tx_reg[0]_i_1_n_7 ),
        .Q(clk_count_tx_reg[0]),
        .R(tdone0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \clk_count_tx_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\clk_count_tx_reg[0]_i_1_n_0 ,\clk_count_tx_reg[0]_i_1_n_1 ,\clk_count_tx_reg[0]_i_1_n_2 ,\clk_count_tx_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,clk_count_tx1_carry__2_n_0}),
        .O({\clk_count_tx_reg[0]_i_1_n_4 ,\clk_count_tx_reg[0]_i_1_n_5 ,\clk_count_tx_reg[0]_i_1_n_6 ,\clk_count_tx_reg[0]_i_1_n_7 }),
        .S({\clk_count_tx[0]_i_2_n_0 ,\clk_count_tx[0]_i_3_n_0 ,\clk_count_tx[0]_i_4_n_0 ,\clk_count_tx[0]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_tx_reg[10] 
       (.C(tclock),
        .CE(1'b1),
        .D(\clk_count_tx_reg[8]_i_1_n_5 ),
        .Q(clk_count_tx_reg[10]),
        .R(tdone0));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_tx_reg[11] 
       (.C(tclock),
        .CE(1'b1),
        .D(\clk_count_tx_reg[8]_i_1_n_4 ),
        .Q(clk_count_tx_reg[11]),
        .R(tdone0));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_tx_reg[12] 
       (.C(tclock),
        .CE(1'b1),
        .D(\clk_count_tx_reg[12]_i_1_n_7 ),
        .Q(clk_count_tx_reg[12]),
        .R(tdone0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \clk_count_tx_reg[12]_i_1 
       (.CI(\clk_count_tx_reg[8]_i_1_n_0 ),
        .CO({\clk_count_tx_reg[12]_i_1_n_0 ,\clk_count_tx_reg[12]_i_1_n_1 ,\clk_count_tx_reg[12]_i_1_n_2 ,\clk_count_tx_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\clk_count_tx_reg[12]_i_1_n_4 ,\clk_count_tx_reg[12]_i_1_n_5 ,\clk_count_tx_reg[12]_i_1_n_6 ,\clk_count_tx_reg[12]_i_1_n_7 }),
        .S({\clk_count_tx[12]_i_2_n_0 ,\clk_count_tx[12]_i_3_n_0 ,\clk_count_tx[12]_i_4_n_0 ,\clk_count_tx[12]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_tx_reg[13] 
       (.C(tclock),
        .CE(1'b1),
        .D(\clk_count_tx_reg[12]_i_1_n_6 ),
        .Q(clk_count_tx_reg[13]),
        .R(tdone0));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_tx_reg[14] 
       (.C(tclock),
        .CE(1'b1),
        .D(\clk_count_tx_reg[12]_i_1_n_5 ),
        .Q(clk_count_tx_reg[14]),
        .R(tdone0));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_tx_reg[15] 
       (.C(tclock),
        .CE(1'b1),
        .D(\clk_count_tx_reg[12]_i_1_n_4 ),
        .Q(clk_count_tx_reg[15]),
        .R(tdone0));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_tx_reg[16] 
       (.C(tclock),
        .CE(1'b1),
        .D(\clk_count_tx_reg[16]_i_1_n_7 ),
        .Q(clk_count_tx_reg[16]),
        .R(tdone0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \clk_count_tx_reg[16]_i_1 
       (.CI(\clk_count_tx_reg[12]_i_1_n_0 ),
        .CO({\clk_count_tx_reg[16]_i_1_n_0 ,\clk_count_tx_reg[16]_i_1_n_1 ,\clk_count_tx_reg[16]_i_1_n_2 ,\clk_count_tx_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\clk_count_tx_reg[16]_i_1_n_4 ,\clk_count_tx_reg[16]_i_1_n_5 ,\clk_count_tx_reg[16]_i_1_n_6 ,\clk_count_tx_reg[16]_i_1_n_7 }),
        .S({\clk_count_tx[16]_i_2_n_0 ,\clk_count_tx[16]_i_3_n_0 ,\clk_count_tx[16]_i_4_n_0 ,\clk_count_tx[16]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_tx_reg[17] 
       (.C(tclock),
        .CE(1'b1),
        .D(\clk_count_tx_reg[16]_i_1_n_6 ),
        .Q(clk_count_tx_reg[17]),
        .R(tdone0));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_tx_reg[18] 
       (.C(tclock),
        .CE(1'b1),
        .D(\clk_count_tx_reg[16]_i_1_n_5 ),
        .Q(clk_count_tx_reg[18]),
        .R(tdone0));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_tx_reg[19] 
       (.C(tclock),
        .CE(1'b1),
        .D(\clk_count_tx_reg[16]_i_1_n_4 ),
        .Q(clk_count_tx_reg[19]),
        .R(tdone0));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_tx_reg[1] 
       (.C(tclock),
        .CE(1'b1),
        .D(\clk_count_tx_reg[0]_i_1_n_6 ),
        .Q(clk_count_tx_reg[1]),
        .R(tdone0));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_tx_reg[20] 
       (.C(tclock),
        .CE(1'b1),
        .D(\clk_count_tx_reg[20]_i_1_n_7 ),
        .Q(clk_count_tx_reg[20]),
        .R(tdone0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \clk_count_tx_reg[20]_i_1 
       (.CI(\clk_count_tx_reg[16]_i_1_n_0 ),
        .CO({\clk_count_tx_reg[20]_i_1_n_0 ,\clk_count_tx_reg[20]_i_1_n_1 ,\clk_count_tx_reg[20]_i_1_n_2 ,\clk_count_tx_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\clk_count_tx_reg[20]_i_1_n_4 ,\clk_count_tx_reg[20]_i_1_n_5 ,\clk_count_tx_reg[20]_i_1_n_6 ,\clk_count_tx_reg[20]_i_1_n_7 }),
        .S({\clk_count_tx[20]_i_2_n_0 ,\clk_count_tx[20]_i_3_n_0 ,\clk_count_tx[20]_i_4_n_0 ,\clk_count_tx[20]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_tx_reg[21] 
       (.C(tclock),
        .CE(1'b1),
        .D(\clk_count_tx_reg[20]_i_1_n_6 ),
        .Q(clk_count_tx_reg[21]),
        .R(tdone0));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_tx_reg[22] 
       (.C(tclock),
        .CE(1'b1),
        .D(\clk_count_tx_reg[20]_i_1_n_5 ),
        .Q(clk_count_tx_reg[22]),
        .R(tdone0));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_tx_reg[23] 
       (.C(tclock),
        .CE(1'b1),
        .D(\clk_count_tx_reg[20]_i_1_n_4 ),
        .Q(clk_count_tx_reg[23]),
        .R(tdone0));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_tx_reg[24] 
       (.C(tclock),
        .CE(1'b1),
        .D(\clk_count_tx_reg[24]_i_1_n_7 ),
        .Q(clk_count_tx_reg[24]),
        .R(tdone0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \clk_count_tx_reg[24]_i_1 
       (.CI(\clk_count_tx_reg[20]_i_1_n_0 ),
        .CO({\clk_count_tx_reg[24]_i_1_n_0 ,\clk_count_tx_reg[24]_i_1_n_1 ,\clk_count_tx_reg[24]_i_1_n_2 ,\clk_count_tx_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\clk_count_tx_reg[24]_i_1_n_4 ,\clk_count_tx_reg[24]_i_1_n_5 ,\clk_count_tx_reg[24]_i_1_n_6 ,\clk_count_tx_reg[24]_i_1_n_7 }),
        .S({\clk_count_tx[24]_i_2_n_0 ,\clk_count_tx[24]_i_3_n_0 ,\clk_count_tx[24]_i_4_n_0 ,\clk_count_tx[24]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_tx_reg[25] 
       (.C(tclock),
        .CE(1'b1),
        .D(\clk_count_tx_reg[24]_i_1_n_6 ),
        .Q(clk_count_tx_reg[25]),
        .R(tdone0));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_tx_reg[26] 
       (.C(tclock),
        .CE(1'b1),
        .D(\clk_count_tx_reg[24]_i_1_n_5 ),
        .Q(clk_count_tx_reg[26]),
        .R(tdone0));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_tx_reg[27] 
       (.C(tclock),
        .CE(1'b1),
        .D(\clk_count_tx_reg[24]_i_1_n_4 ),
        .Q(clk_count_tx_reg[27]),
        .R(tdone0));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_tx_reg[28] 
       (.C(tclock),
        .CE(1'b1),
        .D(\clk_count_tx_reg[28]_i_1_n_7 ),
        .Q(clk_count_tx_reg[28]),
        .R(tdone0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \clk_count_tx_reg[28]_i_1 
       (.CI(\clk_count_tx_reg[24]_i_1_n_0 ),
        .CO({\NLW_clk_count_tx_reg[28]_i_1_CO_UNCONNECTED [3],\clk_count_tx_reg[28]_i_1_n_1 ,\clk_count_tx_reg[28]_i_1_n_2 ,\clk_count_tx_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\clk_count_tx_reg[28]_i_1_n_4 ,\clk_count_tx_reg[28]_i_1_n_5 ,\clk_count_tx_reg[28]_i_1_n_6 ,\clk_count_tx_reg[28]_i_1_n_7 }),
        .S({\clk_count_tx[28]_i_2_n_0 ,\clk_count_tx[28]_i_3_n_0 ,\clk_count_tx[28]_i_4_n_0 ,\clk_count_tx[28]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_tx_reg[29] 
       (.C(tclock),
        .CE(1'b1),
        .D(\clk_count_tx_reg[28]_i_1_n_6 ),
        .Q(clk_count_tx_reg[29]),
        .R(tdone0));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_tx_reg[2] 
       (.C(tclock),
        .CE(1'b1),
        .D(\clk_count_tx_reg[0]_i_1_n_5 ),
        .Q(clk_count_tx_reg[2]),
        .R(tdone0));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_tx_reg[30] 
       (.C(tclock),
        .CE(1'b1),
        .D(\clk_count_tx_reg[28]_i_1_n_5 ),
        .Q(clk_count_tx_reg[30]),
        .R(tdone0));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_tx_reg[31] 
       (.C(tclock),
        .CE(1'b1),
        .D(\clk_count_tx_reg[28]_i_1_n_4 ),
        .Q(clk_count_tx_reg[31]),
        .R(tdone0));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_tx_reg[3] 
       (.C(tclock),
        .CE(1'b1),
        .D(\clk_count_tx_reg[0]_i_1_n_4 ),
        .Q(clk_count_tx_reg[3]),
        .R(tdone0));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_tx_reg[4] 
       (.C(tclock),
        .CE(1'b1),
        .D(\clk_count_tx_reg[4]_i_1_n_7 ),
        .Q(clk_count_tx_reg[4]),
        .R(tdone0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \clk_count_tx_reg[4]_i_1 
       (.CI(\clk_count_tx_reg[0]_i_1_n_0 ),
        .CO({\clk_count_tx_reg[4]_i_1_n_0 ,\clk_count_tx_reg[4]_i_1_n_1 ,\clk_count_tx_reg[4]_i_1_n_2 ,\clk_count_tx_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\clk_count_tx_reg[4]_i_1_n_4 ,\clk_count_tx_reg[4]_i_1_n_5 ,\clk_count_tx_reg[4]_i_1_n_6 ,\clk_count_tx_reg[4]_i_1_n_7 }),
        .S({\clk_count_tx[4]_i_2_n_0 ,\clk_count_tx[4]_i_3_n_0 ,\clk_count_tx[4]_i_4_n_0 ,\clk_count_tx[4]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_tx_reg[5] 
       (.C(tclock),
        .CE(1'b1),
        .D(\clk_count_tx_reg[4]_i_1_n_6 ),
        .Q(clk_count_tx_reg[5]),
        .R(tdone0));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_tx_reg[6] 
       (.C(tclock),
        .CE(1'b1),
        .D(\clk_count_tx_reg[4]_i_1_n_5 ),
        .Q(clk_count_tx_reg[6]),
        .R(tdone0));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_tx_reg[7] 
       (.C(tclock),
        .CE(1'b1),
        .D(\clk_count_tx_reg[4]_i_1_n_4 ),
        .Q(clk_count_tx_reg[7]),
        .R(tdone0));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_tx_reg[8] 
       (.C(tclock),
        .CE(1'b1),
        .D(\clk_count_tx_reg[8]_i_1_n_7 ),
        .Q(clk_count_tx_reg[8]),
        .R(tdone0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \clk_count_tx_reg[8]_i_1 
       (.CI(\clk_count_tx_reg[4]_i_1_n_0 ),
        .CO({\clk_count_tx_reg[8]_i_1_n_0 ,\clk_count_tx_reg[8]_i_1_n_1 ,\clk_count_tx_reg[8]_i_1_n_2 ,\clk_count_tx_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\clk_count_tx_reg[8]_i_1_n_4 ,\clk_count_tx_reg[8]_i_1_n_5 ,\clk_count_tx_reg[8]_i_1_n_6 ,\clk_count_tx_reg[8]_i_1_n_7 }),
        .S({\clk_count_tx[8]_i_2_n_0 ,\clk_count_tx[8]_i_3_n_0 ,\clk_count_tx[8]_i_4_n_0 ,\clk_count_tx[8]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_tx_reg[9] 
       (.C(tclock),
        .CE(1'b1),
        .D(\clk_count_tx_reg[8]_i_1_n_6 ),
        .Q(clk_count_tx_reg[9]),
        .R(tdone0));
  LUT2 #(
    .INIT(4'h1)) 
    tdone_i_1
       (.I0(state_tx[0]),
        .I1(state_tx[1]),
        .O(tdone0));
  LUT4 #(
    .INIT(16'hFF20)) 
    tdone_i_2
       (.I0(state_tx[0]),
        .I1(clk_count_tx1_carry__2_n_0),
        .I2(state_tx[1]),
        .I3(tdone),
        .O(tdone_i_2_n_0));
  FDRE tdone_reg
       (.C(tclock),
        .CE(1'b1),
        .D(tdone_i_2_n_0),
        .Q(tdone),
        .R(tdone0));
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
