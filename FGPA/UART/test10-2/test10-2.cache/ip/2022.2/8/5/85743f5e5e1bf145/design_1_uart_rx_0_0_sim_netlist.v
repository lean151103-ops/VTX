// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Tue Feb 10 15:43:11 2026
// Host        : TelemetryK3_07 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_uart_rx_0_0_sim_netlist.v
// Design      : design_1_uart_rx_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_uart_rx_0_0,uart_rx,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "uart_rx,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clock,
    i_rx,
    o_data_avail,
    o_data_byte);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clock CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clock, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0" *) input clock;
  input i_rx;
  output o_data_avail;
  output [7:0]o_data_byte;

  wire clock;
  wire i_rx;
  wire o_data_avail;
  wire [7:0]o_data_byte;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_uart_rx inst
       (.clock(clock),
        .i_rx(i_rx),
        .o_data_avail(o_data_avail),
        .o_data_byte(o_data_byte));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_uart_rx
   (o_data_byte,
    o_data_avail,
    i_rx,
    clock);
  output [7:0]o_data_byte;
  output o_data_avail;
  input i_rx;
  input clock;

  wire \bit_index[0]_i_1_n_0 ;
  wire \bit_index[1]_i_1_n_0 ;
  wire \bit_index[2]_i_1_n_0 ;
  wire \bit_index_reg_n_0_[0] ;
  wire \bit_index_reg_n_0_[1] ;
  wire \bit_index_reg_n_0_[2] ;
  wire clock;
  wire counter0_carry__0_n_0;
  wire counter0_carry__0_n_1;
  wire counter0_carry__0_n_2;
  wire counter0_carry__0_n_3;
  wire counter0_carry__0_n_4;
  wire counter0_carry__0_n_5;
  wire counter0_carry__0_n_6;
  wire counter0_carry__0_n_7;
  wire counter0_carry__1_n_0;
  wire counter0_carry__1_n_1;
  wire counter0_carry__1_n_2;
  wire counter0_carry__1_n_3;
  wire counter0_carry__1_n_4;
  wire counter0_carry__1_n_5;
  wire counter0_carry__1_n_6;
  wire counter0_carry__1_n_7;
  wire counter0_carry__2_n_2;
  wire counter0_carry__2_n_3;
  wire counter0_carry__2_n_5;
  wire counter0_carry__2_n_6;
  wire counter0_carry__2_n_7;
  wire counter0_carry_n_0;
  wire counter0_carry_n_1;
  wire counter0_carry_n_2;
  wire counter0_carry_n_3;
  wire counter0_carry_n_4;
  wire counter0_carry_n_5;
  wire counter0_carry_n_6;
  wire counter0_carry_n_7;
  wire \counter[0]_i_1_n_0 ;
  wire \counter[10]_i_1_n_0 ;
  wire \counter[11]_i_1_n_0 ;
  wire \counter[12]_i_1_n_0 ;
  wire \counter[13]_i_1_n_0 ;
  wire \counter[14]_i_1_n_0 ;
  wire \counter[15]_i_1_n_0 ;
  wire \counter[15]_i_2_n_0 ;
  wire \counter[1]_i_1_n_0 ;
  wire \counter[2]_i_1_n_0 ;
  wire \counter[3]_i_1_n_0 ;
  wire \counter[4]_i_1_n_0 ;
  wire \counter[5]_i_1_n_0 ;
  wire \counter[6]_i_1_n_0 ;
  wire \counter[7]_i_1_n_0 ;
  wire \counter[8]_i_1_n_0 ;
  wire \counter[9]_i_1_n_0 ;
  wire \counter_reg_n_0_[0] ;
  wire \counter_reg_n_0_[10] ;
  wire \counter_reg_n_0_[11] ;
  wire \counter_reg_n_0_[12] ;
  wire \counter_reg_n_0_[13] ;
  wire \counter_reg_n_0_[14] ;
  wire \counter_reg_n_0_[15] ;
  wire \counter_reg_n_0_[1] ;
  wire \counter_reg_n_0_[2] ;
  wire \counter_reg_n_0_[3] ;
  wire \counter_reg_n_0_[4] ;
  wire \counter_reg_n_0_[5] ;
  wire \counter_reg_n_0_[6] ;
  wire \counter_reg_n_0_[7] ;
  wire \counter_reg_n_0_[8] ;
  wire \counter_reg_n_0_[9] ;
  wire data_avail_i_1_n_0;
  wire data_avail_i_2_n_0;
  wire data_avail_i_3_n_0;
  wire data_avail_i_4_n_0;
  wire data_avail_i_5_n_0;
  wire \data_byte[0]_i_1_n_0 ;
  wire \data_byte[1]_i_1_n_0 ;
  wire \data_byte[2]_i_1_n_0 ;
  wire \data_byte[3]_i_1_n_0 ;
  wire \data_byte[4]_i_1_n_0 ;
  wire \data_byte[4]_i_2_n_0 ;
  wire \data_byte[5]_i_1_n_0 ;
  wire \data_byte[5]_i_2_n_0 ;
  wire \data_byte[6]_i_1_n_0 ;
  wire \data_byte[6]_i_2_n_0 ;
  wire \data_byte[7]_i_1_n_0 ;
  wire \data_byte[7]_i_2_n_0 ;
  wire \data_byte[7]_i_3_n_0 ;
  wire \data_byte[7]_i_4_n_0 ;
  wire \data_byte[7]_i_5_n_0 ;
  wire i_rx;
  wire o_data_avail;
  wire [7:0]o_data_byte;
  wire rx;
  wire rx_buffer;
  wire \state[0]_i_1_n_0 ;
  wire \state[0]_i_2_n_0 ;
  wire \state[1]_i_1_n_0 ;
  wire \state[1]_i_2_n_0 ;
  wire \state[1]_i_3_n_0 ;
  wire \state[1]_i_4_n_0 ;
  wire \state_reg_n_0_[0] ;
  wire \state_reg_n_0_[1] ;
  wire [3:2]NLW_counter0_carry__2_CO_UNCONNECTED;
  wire [3:3]NLW_counter0_carry__2_O_UNCONNECTED;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h6660)) 
    \bit_index[0]_i_1 
       (.I0(\bit_index_reg_n_0_[0] ),
        .I1(\data_byte[7]_i_4_n_0 ),
        .I2(\state_reg_n_0_[0] ),
        .I3(\state_reg_n_0_[1] ),
        .O(\bit_index[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h6A6A6A00)) 
    \bit_index[1]_i_1 
       (.I0(\bit_index_reg_n_0_[1] ),
        .I1(\data_byte[7]_i_4_n_0 ),
        .I2(\bit_index_reg_n_0_[0] ),
        .I3(\state_reg_n_0_[0] ),
        .I4(\state_reg_n_0_[1] ),
        .O(\bit_index[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6AAA6AAA6AAA0000)) 
    \bit_index[2]_i_1 
       (.I0(\bit_index_reg_n_0_[2] ),
        .I1(\data_byte[7]_i_4_n_0 ),
        .I2(\bit_index_reg_n_0_[0] ),
        .I3(\bit_index_reg_n_0_[1] ),
        .I4(\state_reg_n_0_[0] ),
        .I5(\state_reg_n_0_[1] ),
        .O(\bit_index[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bit_index_reg[0] 
       (.C(clock),
        .CE(1'b1),
        .D(\bit_index[0]_i_1_n_0 ),
        .Q(\bit_index_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bit_index_reg[1] 
       (.C(clock),
        .CE(1'b1),
        .D(\bit_index[1]_i_1_n_0 ),
        .Q(\bit_index_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bit_index_reg[2] 
       (.C(clock),
        .CE(1'b1),
        .D(\bit_index[2]_i_1_n_0 ),
        .Q(\bit_index_reg_n_0_[2] ),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 counter0_carry
       (.CI(1'b0),
        .CO({counter0_carry_n_0,counter0_carry_n_1,counter0_carry_n_2,counter0_carry_n_3}),
        .CYINIT(\counter_reg_n_0_[0] ),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({counter0_carry_n_4,counter0_carry_n_5,counter0_carry_n_6,counter0_carry_n_7}),
        .S({\counter_reg_n_0_[4] ,\counter_reg_n_0_[3] ,\counter_reg_n_0_[2] ,\counter_reg_n_0_[1] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 counter0_carry__0
       (.CI(counter0_carry_n_0),
        .CO({counter0_carry__0_n_0,counter0_carry__0_n_1,counter0_carry__0_n_2,counter0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({counter0_carry__0_n_4,counter0_carry__0_n_5,counter0_carry__0_n_6,counter0_carry__0_n_7}),
        .S({\counter_reg_n_0_[8] ,\counter_reg_n_0_[7] ,\counter_reg_n_0_[6] ,\counter_reg_n_0_[5] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 counter0_carry__1
       (.CI(counter0_carry__0_n_0),
        .CO({counter0_carry__1_n_0,counter0_carry__1_n_1,counter0_carry__1_n_2,counter0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({counter0_carry__1_n_4,counter0_carry__1_n_5,counter0_carry__1_n_6,counter0_carry__1_n_7}),
        .S({\counter_reg_n_0_[12] ,\counter_reg_n_0_[11] ,\counter_reg_n_0_[10] ,\counter_reg_n_0_[9] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 counter0_carry__2
       (.CI(counter0_carry__1_n_0),
        .CO({NLW_counter0_carry__2_CO_UNCONNECTED[3:2],counter0_carry__2_n_2,counter0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_counter0_carry__2_O_UNCONNECTED[3],counter0_carry__2_n_5,counter0_carry__2_n_6,counter0_carry__2_n_7}),
        .S({1'b0,\counter_reg_n_0_[15] ,\counter_reg_n_0_[14] ,\counter_reg_n_0_[13] }));
  LUT5 #(
    .INIT(32'h00405540)) 
    \counter[0]_i_1 
       (.I0(\counter_reg_n_0_[0] ),
        .I1(\state[1]_i_2_n_0 ),
        .I2(\state_reg_n_0_[0] ),
        .I3(\state_reg_n_0_[1] ),
        .I4(data_avail_i_2_n_0),
        .O(\counter[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0080AA80)) 
    \counter[10]_i_1 
       (.I0(counter0_carry__1_n_6),
        .I1(\state[1]_i_2_n_0 ),
        .I2(\state_reg_n_0_[0] ),
        .I3(\state_reg_n_0_[1] ),
        .I4(data_avail_i_2_n_0),
        .O(\counter[10]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0080AA80)) 
    \counter[11]_i_1 
       (.I0(counter0_carry__1_n_5),
        .I1(\state[1]_i_2_n_0 ),
        .I2(\state_reg_n_0_[0] ),
        .I3(\state_reg_n_0_[1] ),
        .I4(data_avail_i_2_n_0),
        .O(\counter[11]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0080AA80)) 
    \counter[12]_i_1 
       (.I0(counter0_carry__1_n_4),
        .I1(\state[1]_i_2_n_0 ),
        .I2(\state_reg_n_0_[0] ),
        .I3(\state_reg_n_0_[1] ),
        .I4(data_avail_i_2_n_0),
        .O(\counter[12]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0080AA80)) 
    \counter[13]_i_1 
       (.I0(counter0_carry__2_n_7),
        .I1(\state[1]_i_2_n_0 ),
        .I2(\state_reg_n_0_[0] ),
        .I3(\state_reg_n_0_[1] ),
        .I4(data_avail_i_2_n_0),
        .O(\counter[13]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0080AA80)) 
    \counter[14]_i_1 
       (.I0(counter0_carry__2_n_6),
        .I1(\state[1]_i_2_n_0 ),
        .I2(\state_reg_n_0_[0] ),
        .I3(\state_reg_n_0_[1] ),
        .I4(data_avail_i_2_n_0),
        .O(\counter[14]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFBFF)) 
    \counter[15]_i_1 
       (.I0(\state[1]_i_2_n_0 ),
        .I1(rx),
        .I2(\state_reg_n_0_[1] ),
        .I3(\state_reg_n_0_[0] ),
        .O(\counter[15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0080AA80)) 
    \counter[15]_i_2 
       (.I0(counter0_carry__2_n_5),
        .I1(\state[1]_i_2_n_0 ),
        .I2(\state_reg_n_0_[0] ),
        .I3(\state_reg_n_0_[1] ),
        .I4(data_avail_i_2_n_0),
        .O(\counter[15]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h0080AA80)) 
    \counter[1]_i_1 
       (.I0(counter0_carry_n_7),
        .I1(\state[1]_i_2_n_0 ),
        .I2(\state_reg_n_0_[0] ),
        .I3(\state_reg_n_0_[1] ),
        .I4(data_avail_i_2_n_0),
        .O(\counter[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0080AA80)) 
    \counter[2]_i_1 
       (.I0(counter0_carry_n_6),
        .I1(\state[1]_i_2_n_0 ),
        .I2(\state_reg_n_0_[0] ),
        .I3(\state_reg_n_0_[1] ),
        .I4(data_avail_i_2_n_0),
        .O(\counter[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0080AA80)) 
    \counter[3]_i_1 
       (.I0(counter0_carry_n_5),
        .I1(\state[1]_i_2_n_0 ),
        .I2(\state_reg_n_0_[0] ),
        .I3(\state_reg_n_0_[1] ),
        .I4(data_avail_i_2_n_0),
        .O(\counter[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0080AA80)) 
    \counter[4]_i_1 
       (.I0(counter0_carry_n_4),
        .I1(\state[1]_i_2_n_0 ),
        .I2(\state_reg_n_0_[0] ),
        .I3(\state_reg_n_0_[1] ),
        .I4(data_avail_i_2_n_0),
        .O(\counter[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0080AA80)) 
    \counter[5]_i_1 
       (.I0(counter0_carry__0_n_7),
        .I1(\state[1]_i_2_n_0 ),
        .I2(\state_reg_n_0_[0] ),
        .I3(\state_reg_n_0_[1] ),
        .I4(data_avail_i_2_n_0),
        .O(\counter[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0080AA80)) 
    \counter[6]_i_1 
       (.I0(counter0_carry__0_n_6),
        .I1(\state[1]_i_2_n_0 ),
        .I2(\state_reg_n_0_[0] ),
        .I3(\state_reg_n_0_[1] ),
        .I4(data_avail_i_2_n_0),
        .O(\counter[6]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0080AA80)) 
    \counter[7]_i_1 
       (.I0(counter0_carry__0_n_5),
        .I1(\state[1]_i_2_n_0 ),
        .I2(\state_reg_n_0_[0] ),
        .I3(\state_reg_n_0_[1] ),
        .I4(data_avail_i_2_n_0),
        .O(\counter[7]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0080AA80)) 
    \counter[8]_i_1 
       (.I0(counter0_carry__0_n_4),
        .I1(\state[1]_i_2_n_0 ),
        .I2(\state_reg_n_0_[0] ),
        .I3(\state_reg_n_0_[1] ),
        .I4(data_avail_i_2_n_0),
        .O(\counter[8]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0080AA80)) 
    \counter[9]_i_1 
       (.I0(counter0_carry__1_n_7),
        .I1(\state[1]_i_2_n_0 ),
        .I2(\state_reg_n_0_[0] ),
        .I3(\state_reg_n_0_[1] ),
        .I4(data_avail_i_2_n_0),
        .O(\counter[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[0] 
       (.C(clock),
        .CE(\counter[15]_i_1_n_0 ),
        .D(\counter[0]_i_1_n_0 ),
        .Q(\counter_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[10] 
       (.C(clock),
        .CE(\counter[15]_i_1_n_0 ),
        .D(\counter[10]_i_1_n_0 ),
        .Q(\counter_reg_n_0_[10] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[11] 
       (.C(clock),
        .CE(\counter[15]_i_1_n_0 ),
        .D(\counter[11]_i_1_n_0 ),
        .Q(\counter_reg_n_0_[11] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[12] 
       (.C(clock),
        .CE(\counter[15]_i_1_n_0 ),
        .D(\counter[12]_i_1_n_0 ),
        .Q(\counter_reg_n_0_[12] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[13] 
       (.C(clock),
        .CE(\counter[15]_i_1_n_0 ),
        .D(\counter[13]_i_1_n_0 ),
        .Q(\counter_reg_n_0_[13] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[14] 
       (.C(clock),
        .CE(\counter[15]_i_1_n_0 ),
        .D(\counter[14]_i_1_n_0 ),
        .Q(\counter_reg_n_0_[14] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[15] 
       (.C(clock),
        .CE(\counter[15]_i_1_n_0 ),
        .D(\counter[15]_i_2_n_0 ),
        .Q(\counter_reg_n_0_[15] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[1] 
       (.C(clock),
        .CE(\counter[15]_i_1_n_0 ),
        .D(\counter[1]_i_1_n_0 ),
        .Q(\counter_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[2] 
       (.C(clock),
        .CE(\counter[15]_i_1_n_0 ),
        .D(\counter[2]_i_1_n_0 ),
        .Q(\counter_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[3] 
       (.C(clock),
        .CE(\counter[15]_i_1_n_0 ),
        .D(\counter[3]_i_1_n_0 ),
        .Q(\counter_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[4] 
       (.C(clock),
        .CE(\counter[15]_i_1_n_0 ),
        .D(\counter[4]_i_1_n_0 ),
        .Q(\counter_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[5] 
       (.C(clock),
        .CE(\counter[15]_i_1_n_0 ),
        .D(\counter[5]_i_1_n_0 ),
        .Q(\counter_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[6] 
       (.C(clock),
        .CE(\counter[15]_i_1_n_0 ),
        .D(\counter[6]_i_1_n_0 ),
        .Q(\counter_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[7] 
       (.C(clock),
        .CE(\counter[15]_i_1_n_0 ),
        .D(\counter[7]_i_1_n_0 ),
        .Q(\counter_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[8] 
       (.C(clock),
        .CE(\counter[15]_i_1_n_0 ),
        .D(\counter[8]_i_1_n_0 ),
        .Q(\counter_reg_n_0_[8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[9] 
       (.C(clock),
        .CE(\counter[15]_i_1_n_0 ),
        .D(\counter[9]_i_1_n_0 ),
        .Q(\counter_reg_n_0_[9] ),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hEAA0)) 
    data_avail_i_1
       (.I0(o_data_avail),
        .I1(data_avail_i_2_n_0),
        .I2(\state_reg_n_0_[0] ),
        .I3(\state_reg_n_0_[1] ),
        .O(data_avail_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFAAEAAAAAAAAA)) 
    data_avail_i_2
       (.I0(data_avail_i_3_n_0),
        .I1(\counter_reg_n_0_[2] ),
        .I2(\counter_reg_n_0_[5] ),
        .I3(data_avail_i_4_n_0),
        .I4(data_avail_i_5_n_0),
        .I5(\counter_reg_n_0_[10] ),
        .O(data_avail_i_2_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    data_avail_i_3
       (.I0(\counter_reg_n_0_[11] ),
        .I1(\counter_reg_n_0_[15] ),
        .I2(\counter_reg_n_0_[14] ),
        .I3(\counter_reg_n_0_[13] ),
        .I4(\counter_reg_n_0_[12] ),
        .O(data_avail_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h7)) 
    data_avail_i_4
       (.I0(\counter_reg_n_0_[4] ),
        .I1(\counter_reg_n_0_[3] ),
        .O(data_avail_i_4_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    data_avail_i_5
       (.I0(\counter_reg_n_0_[8] ),
        .I1(\counter_reg_n_0_[7] ),
        .I2(\counter_reg_n_0_[9] ),
        .I3(\counter_reg_n_0_[6] ),
        .O(data_avail_i_5_n_0));
  FDRE #(
    .INIT(1'b0)) 
    data_avail_reg
       (.C(clock),
        .CE(1'b1),
        .D(data_avail_i_1_n_0),
        .Q(o_data_avail),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hBBBABBBB888A8888)) 
    \data_byte[0]_i_1 
       (.I0(rx),
        .I1(\data_byte[7]_i_2_n_0 ),
        .I2(\bit_index_reg_n_0_[2] ),
        .I3(\data_byte[4]_i_2_n_0 ),
        .I4(\data_byte[7]_i_4_n_0 ),
        .I5(o_data_byte[0]),
        .O(\data_byte[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBBBABBBB888A8888)) 
    \data_byte[1]_i_1 
       (.I0(rx),
        .I1(\data_byte[7]_i_2_n_0 ),
        .I2(\bit_index_reg_n_0_[2] ),
        .I3(\data_byte[5]_i_2_n_0 ),
        .I4(\data_byte[7]_i_4_n_0 ),
        .I5(o_data_byte[1]),
        .O(\data_byte[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBBBABBBB888A8888)) 
    \data_byte[2]_i_1 
       (.I0(rx),
        .I1(\data_byte[7]_i_2_n_0 ),
        .I2(\bit_index_reg_n_0_[2] ),
        .I3(\data_byte[6]_i_2_n_0 ),
        .I4(\data_byte[7]_i_4_n_0 ),
        .I5(o_data_byte[2]),
        .O(\data_byte[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBBBABBBB888A8888)) 
    \data_byte[3]_i_1 
       (.I0(rx),
        .I1(\data_byte[7]_i_2_n_0 ),
        .I2(\bit_index_reg_n_0_[2] ),
        .I3(\data_byte[7]_i_3_n_0 ),
        .I4(\data_byte[7]_i_4_n_0 ),
        .I5(o_data_byte[3]),
        .O(\data_byte[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBABBBBBB8A888888)) 
    \data_byte[4]_i_1 
       (.I0(rx),
        .I1(\data_byte[7]_i_2_n_0 ),
        .I2(\data_byte[4]_i_2_n_0 ),
        .I3(\bit_index_reg_n_0_[2] ),
        .I4(\data_byte[7]_i_4_n_0 ),
        .I5(o_data_byte[4]),
        .O(\data_byte[4]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \data_byte[4]_i_2 
       (.I0(\bit_index_reg_n_0_[0] ),
        .I1(\bit_index_reg_n_0_[1] ),
        .O(\data_byte[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hBABBBBBB8A888888)) 
    \data_byte[5]_i_1 
       (.I0(rx),
        .I1(\data_byte[7]_i_2_n_0 ),
        .I2(\data_byte[5]_i_2_n_0 ),
        .I3(\bit_index_reg_n_0_[2] ),
        .I4(\data_byte[7]_i_4_n_0 ),
        .I5(o_data_byte[5]),
        .O(\data_byte[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \data_byte[5]_i_2 
       (.I0(\bit_index_reg_n_0_[1] ),
        .I1(\bit_index_reg_n_0_[0] ),
        .O(\data_byte[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hBABBBBBB8A888888)) 
    \data_byte[6]_i_1 
       (.I0(rx),
        .I1(\data_byte[7]_i_2_n_0 ),
        .I2(\data_byte[6]_i_2_n_0 ),
        .I3(\bit_index_reg_n_0_[2] ),
        .I4(\data_byte[7]_i_4_n_0 ),
        .I5(o_data_byte[6]),
        .O(\data_byte[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \data_byte[6]_i_2 
       (.I0(\bit_index_reg_n_0_[0] ),
        .I1(\bit_index_reg_n_0_[1] ),
        .O(\data_byte[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hBABBBBBB8A888888)) 
    \data_byte[7]_i_1 
       (.I0(rx),
        .I1(\data_byte[7]_i_2_n_0 ),
        .I2(\data_byte[7]_i_3_n_0 ),
        .I3(\bit_index_reg_n_0_[2] ),
        .I4(\data_byte[7]_i_4_n_0 ),
        .I5(o_data_byte[7]),
        .O(\data_byte[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \data_byte[7]_i_2 
       (.I0(\state_reg_n_0_[0] ),
        .I1(\state_reg_n_0_[1] ),
        .I2(rx),
        .O(\data_byte[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \data_byte[7]_i_3 
       (.I0(\bit_index_reg_n_0_[0] ),
        .I1(\bit_index_reg_n_0_[1] ),
        .O(\data_byte[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FF8A0000)) 
    \data_byte[7]_i_4 
       (.I0(\counter_reg_n_0_[10] ),
        .I1(data_avail_i_5_n_0),
        .I2(\data_byte[7]_i_5_n_0 ),
        .I3(data_avail_i_3_n_0),
        .I4(\state_reg_n_0_[1] ),
        .I5(\state_reg_n_0_[0] ),
        .O(\data_byte[7]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \data_byte[7]_i_5 
       (.I0(\counter_reg_n_0_[3] ),
        .I1(\counter_reg_n_0_[4] ),
        .I2(\counter_reg_n_0_[5] ),
        .I3(\counter_reg_n_0_[2] ),
        .O(\data_byte[7]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_byte_reg[0] 
       (.C(clock),
        .CE(1'b1),
        .D(\data_byte[0]_i_1_n_0 ),
        .Q(o_data_byte[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_byte_reg[1] 
       (.C(clock),
        .CE(1'b1),
        .D(\data_byte[1]_i_1_n_0 ),
        .Q(o_data_byte[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_byte_reg[2] 
       (.C(clock),
        .CE(1'b1),
        .D(\data_byte[2]_i_1_n_0 ),
        .Q(o_data_byte[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_byte_reg[3] 
       (.C(clock),
        .CE(1'b1),
        .D(\data_byte[3]_i_1_n_0 ),
        .Q(o_data_byte[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_byte_reg[4] 
       (.C(clock),
        .CE(1'b1),
        .D(\data_byte[4]_i_1_n_0 ),
        .Q(o_data_byte[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_byte_reg[5] 
       (.C(clock),
        .CE(1'b1),
        .D(\data_byte[5]_i_1_n_0 ),
        .Q(o_data_byte[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_byte_reg[6] 
       (.C(clock),
        .CE(1'b1),
        .D(\data_byte[6]_i_1_n_0 ),
        .Q(o_data_byte[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_byte_reg[7] 
       (.C(clock),
        .CE(1'b1),
        .D(\data_byte[7]_i_1_n_0 ),
        .Q(o_data_byte[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    rx_buffer_reg
       (.C(clock),
        .CE(1'b1),
        .D(i_rx),
        .Q(rx_buffer),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    rx_reg
       (.C(clock),
        .CE(1'b1),
        .D(rx_buffer),
        .Q(rx),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0F50FF330F500033)) 
    \state[0]_i_1 
       (.I0(\state[0]_i_2_n_0 ),
        .I1(rx),
        .I2(data_avail_i_2_n_0),
        .I3(\state_reg_n_0_[0] ),
        .I4(\state_reg_n_0_[1] ),
        .I5(\state[1]_i_2_n_0 ),
        .O(\state[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \state[0]_i_2 
       (.I0(\bit_index_reg_n_0_[1] ),
        .I1(\bit_index_reg_n_0_[0] ),
        .I2(\bit_index_reg_n_0_[2] ),
        .O(\state[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h50F053F0)) 
    \state[1]_i_1 
       (.I0(data_avail_i_2_n_0),
        .I1(\state[1]_i_2_n_0 ),
        .I2(\state_reg_n_0_[1] ),
        .I3(\state_reg_n_0_[0] ),
        .I4(rx),
        .O(\state[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFEFFFFFFFFFFFFFF)) 
    \state[1]_i_2 
       (.I0(data_avail_i_3_n_0),
        .I1(\state[1]_i_3_n_0 ),
        .I2(\state[1]_i_4_n_0 ),
        .I3(\counter_reg_n_0_[2] ),
        .I4(\counter_reg_n_0_[9] ),
        .I5(\counter_reg_n_0_[1] ),
        .O(\state[1]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \state[1]_i_3 
       (.I0(\counter_reg_n_0_[5] ),
        .I1(\counter_reg_n_0_[0] ),
        .I2(\counter_reg_n_0_[10] ),
        .I3(\counter_reg_n_0_[6] ),
        .O(\state[1]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hFFF7)) 
    \state[1]_i_4 
       (.I0(\counter_reg_n_0_[3] ),
        .I1(\counter_reg_n_0_[4] ),
        .I2(\counter_reg_n_0_[8] ),
        .I3(\counter_reg_n_0_[7] ),
        .O(\state[1]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[0] 
       (.C(clock),
        .CE(1'b1),
        .D(\state[0]_i_1_n_0 ),
        .Q(\state_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[1] 
       (.C(clock),
        .CE(1'b1),
        .D(\state[1]_i_1_n_0 ),
        .Q(\state_reg_n_0_[1] ),
        .R(1'b0));
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
