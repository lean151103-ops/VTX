-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
-- Date        : Fri Jan 23 12:08:45 2026
-- Host        : DESKTOP-518F4EG running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               d:/Xilinx/Xlinx_project/test_uart_23-1/test_uart_23-1.gen/sources_1/bd/design_1/ip/design_1_uart_tx_0_0/design_1_uart_tx_0_0_sim_netlist.vhdl
-- Design      : design_1_uart_tx_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_uart_tx_0_0_uart_tx is
  port (
    TX : out STD_LOGIC;
    tdone : out STD_LOGIC;
    tclock : in STD_LOGIC;
    tenable : in STD_LOGIC;
    tdin : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_uart_tx_0_0_uart_tx : entity is "uart_tx";
end design_1_uart_tx_0_0_uart_tx;

architecture STRUCTURE of design_1_uart_tx_0_0_uart_tx is
  signal TX_i_1_n_0 : STD_LOGIC;
  signal TX_i_2_n_0 : STD_LOGIC;
  signal TX_i_3_n_0 : STD_LOGIC;
  signal bit_index_tx : STD_LOGIC;
  signal \bit_index_tx1_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \bit_index_tx1_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \bit_index_tx1_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \bit_index_tx1_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \bit_index_tx1_carry__0_n_0\ : STD_LOGIC;
  signal \bit_index_tx1_carry__0_n_1\ : STD_LOGIC;
  signal \bit_index_tx1_carry__0_n_2\ : STD_LOGIC;
  signal \bit_index_tx1_carry__0_n_3\ : STD_LOGIC;
  signal \bit_index_tx1_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \bit_index_tx1_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \bit_index_tx1_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \bit_index_tx1_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \bit_index_tx1_carry__1_n_0\ : STD_LOGIC;
  signal \bit_index_tx1_carry__1_n_1\ : STD_LOGIC;
  signal \bit_index_tx1_carry__1_n_2\ : STD_LOGIC;
  signal \bit_index_tx1_carry__1_n_3\ : STD_LOGIC;
  signal \bit_index_tx1_carry__2_i_1_n_0\ : STD_LOGIC;
  signal \bit_index_tx1_carry__2_i_2_n_0\ : STD_LOGIC;
  signal \bit_index_tx1_carry__2_i_3_n_0\ : STD_LOGIC;
  signal \bit_index_tx1_carry__2_i_4_n_0\ : STD_LOGIC;
  signal \bit_index_tx1_carry__2_n_0\ : STD_LOGIC;
  signal \bit_index_tx1_carry__2_n_1\ : STD_LOGIC;
  signal \bit_index_tx1_carry__2_n_2\ : STD_LOGIC;
  signal \bit_index_tx1_carry__2_n_3\ : STD_LOGIC;
  signal bit_index_tx1_carry_i_1_n_0 : STD_LOGIC;
  signal bit_index_tx1_carry_i_2_n_0 : STD_LOGIC;
  signal bit_index_tx1_carry_i_3_n_0 : STD_LOGIC;
  signal bit_index_tx1_carry_i_4_n_0 : STD_LOGIC;
  signal bit_index_tx1_carry_i_5_n_0 : STD_LOGIC;
  signal bit_index_tx1_carry_i_6_n_0 : STD_LOGIC;
  signal bit_index_tx1_carry_n_0 : STD_LOGIC;
  signal bit_index_tx1_carry_n_1 : STD_LOGIC;
  signal bit_index_tx1_carry_n_2 : STD_LOGIC;
  signal bit_index_tx1_carry_n_3 : STD_LOGIC;
  signal \bit_index_tx[0]_i_3_n_0\ : STD_LOGIC;
  signal \bit_index_tx[0]_i_4_n_0\ : STD_LOGIC;
  signal \bit_index_tx[0]_i_5_n_0\ : STD_LOGIC;
  signal \bit_index_tx[0]_i_6_n_0\ : STD_LOGIC;
  signal \bit_index_tx[12]_i_2_n_0\ : STD_LOGIC;
  signal \bit_index_tx[12]_i_3_n_0\ : STD_LOGIC;
  signal \bit_index_tx[12]_i_4_n_0\ : STD_LOGIC;
  signal \bit_index_tx[12]_i_5_n_0\ : STD_LOGIC;
  signal \bit_index_tx[16]_i_2_n_0\ : STD_LOGIC;
  signal \bit_index_tx[16]_i_3_n_0\ : STD_LOGIC;
  signal \bit_index_tx[16]_i_4_n_0\ : STD_LOGIC;
  signal \bit_index_tx[16]_i_5_n_0\ : STD_LOGIC;
  signal \bit_index_tx[20]_i_2_n_0\ : STD_LOGIC;
  signal \bit_index_tx[20]_i_3_n_0\ : STD_LOGIC;
  signal \bit_index_tx[20]_i_4_n_0\ : STD_LOGIC;
  signal \bit_index_tx[20]_i_5_n_0\ : STD_LOGIC;
  signal \bit_index_tx[24]_i_2_n_0\ : STD_LOGIC;
  signal \bit_index_tx[24]_i_3_n_0\ : STD_LOGIC;
  signal \bit_index_tx[24]_i_4_n_0\ : STD_LOGIC;
  signal \bit_index_tx[24]_i_5_n_0\ : STD_LOGIC;
  signal \bit_index_tx[28]_i_2_n_0\ : STD_LOGIC;
  signal \bit_index_tx[28]_i_3_n_0\ : STD_LOGIC;
  signal \bit_index_tx[28]_i_4_n_0\ : STD_LOGIC;
  signal \bit_index_tx[28]_i_5_n_0\ : STD_LOGIC;
  signal \bit_index_tx[4]_i_2_n_0\ : STD_LOGIC;
  signal \bit_index_tx[4]_i_3_n_0\ : STD_LOGIC;
  signal \bit_index_tx[4]_i_4_n_0\ : STD_LOGIC;
  signal \bit_index_tx[4]_i_5_n_0\ : STD_LOGIC;
  signal \bit_index_tx[8]_i_2_n_0\ : STD_LOGIC;
  signal \bit_index_tx[8]_i_3_n_0\ : STD_LOGIC;
  signal \bit_index_tx[8]_i_4_n_0\ : STD_LOGIC;
  signal \bit_index_tx[8]_i_5_n_0\ : STD_LOGIC;
  signal bit_index_tx_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \bit_index_tx_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \bit_index_tx_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \bit_index_tx_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \bit_index_tx_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \bit_index_tx_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \bit_index_tx_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \bit_index_tx_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \bit_index_tx_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \bit_index_tx_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \bit_index_tx_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \bit_index_tx_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \bit_index_tx_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \bit_index_tx_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \bit_index_tx_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \bit_index_tx_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \bit_index_tx_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \bit_index_tx_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \bit_index_tx_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \bit_index_tx_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \bit_index_tx_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \bit_index_tx_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \bit_index_tx_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \bit_index_tx_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \bit_index_tx_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \bit_index_tx_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \bit_index_tx_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \bit_index_tx_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \bit_index_tx_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \bit_index_tx_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \bit_index_tx_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \bit_index_tx_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \bit_index_tx_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \bit_index_tx_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \bit_index_tx_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \bit_index_tx_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \bit_index_tx_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \bit_index_tx_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \bit_index_tx_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \bit_index_tx_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \bit_index_tx_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \bit_index_tx_reg[28]_i_1_n_1\ : STD_LOGIC;
  signal \bit_index_tx_reg[28]_i_1_n_2\ : STD_LOGIC;
  signal \bit_index_tx_reg[28]_i_1_n_3\ : STD_LOGIC;
  signal \bit_index_tx_reg[28]_i_1_n_4\ : STD_LOGIC;
  signal \bit_index_tx_reg[28]_i_1_n_5\ : STD_LOGIC;
  signal \bit_index_tx_reg[28]_i_1_n_6\ : STD_LOGIC;
  signal \bit_index_tx_reg[28]_i_1_n_7\ : STD_LOGIC;
  signal \bit_index_tx_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \bit_index_tx_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \bit_index_tx_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \bit_index_tx_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \bit_index_tx_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \bit_index_tx_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \bit_index_tx_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \bit_index_tx_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \bit_index_tx_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \bit_index_tx_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \bit_index_tx_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \bit_index_tx_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \bit_index_tx_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \bit_index_tx_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \bit_index_tx_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \bit_index_tx_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \clk_count_tx1_carry__0_n_0\ : STD_LOGIC;
  signal \clk_count_tx1_carry__0_n_1\ : STD_LOGIC;
  signal \clk_count_tx1_carry__0_n_2\ : STD_LOGIC;
  signal \clk_count_tx1_carry__0_n_3\ : STD_LOGIC;
  signal \clk_count_tx1_carry__1_n_0\ : STD_LOGIC;
  signal \clk_count_tx1_carry__1_n_1\ : STD_LOGIC;
  signal \clk_count_tx1_carry__1_n_2\ : STD_LOGIC;
  signal \clk_count_tx1_carry__1_n_3\ : STD_LOGIC;
  signal \clk_count_tx1_carry__2_n_0\ : STD_LOGIC;
  signal \clk_count_tx1_carry__2_n_1\ : STD_LOGIC;
  signal \clk_count_tx1_carry__2_n_2\ : STD_LOGIC;
  signal \clk_count_tx1_carry__2_n_3\ : STD_LOGIC;
  signal \clk_count_tx1_carry_i_1__0_n_0\ : STD_LOGIC;
  signal \clk_count_tx1_carry_i_1__1_n_0\ : STD_LOGIC;
  signal \clk_count_tx1_carry_i_1__2_n_0\ : STD_LOGIC;
  signal clk_count_tx1_carry_i_1_n_0 : STD_LOGIC;
  signal \clk_count_tx1_carry_i_2__0_n_0\ : STD_LOGIC;
  signal \clk_count_tx1_carry_i_2__1_n_0\ : STD_LOGIC;
  signal \clk_count_tx1_carry_i_2__2_n_0\ : STD_LOGIC;
  signal clk_count_tx1_carry_i_2_n_0 : STD_LOGIC;
  signal \clk_count_tx1_carry_i_3__0_n_0\ : STD_LOGIC;
  signal \clk_count_tx1_carry_i_3__1_n_0\ : STD_LOGIC;
  signal \clk_count_tx1_carry_i_3__2_n_0\ : STD_LOGIC;
  signal clk_count_tx1_carry_i_3_n_0 : STD_LOGIC;
  signal \clk_count_tx1_carry_i_4__0_n_0\ : STD_LOGIC;
  signal \clk_count_tx1_carry_i_4__1_n_0\ : STD_LOGIC;
  signal \clk_count_tx1_carry_i_4__2_n_0\ : STD_LOGIC;
  signal clk_count_tx1_carry_i_4_n_0 : STD_LOGIC;
  signal \clk_count_tx1_carry_i_5__0_n_0\ : STD_LOGIC;
  signal clk_count_tx1_carry_i_5_n_0 : STD_LOGIC;
  signal clk_count_tx1_carry_i_6_n_0 : STD_LOGIC;
  signal clk_count_tx1_carry_i_7_n_0 : STD_LOGIC;
  signal clk_count_tx1_carry_n_0 : STD_LOGIC;
  signal clk_count_tx1_carry_n_1 : STD_LOGIC;
  signal clk_count_tx1_carry_n_2 : STD_LOGIC;
  signal clk_count_tx1_carry_n_3 : STD_LOGIC;
  signal \clk_count_tx[0]_i_2_n_0\ : STD_LOGIC;
  signal \clk_count_tx[0]_i_3_n_0\ : STD_LOGIC;
  signal \clk_count_tx[0]_i_4_n_0\ : STD_LOGIC;
  signal \clk_count_tx[0]_i_5_n_0\ : STD_LOGIC;
  signal \clk_count_tx[12]_i_2_n_0\ : STD_LOGIC;
  signal \clk_count_tx[12]_i_3_n_0\ : STD_LOGIC;
  signal \clk_count_tx[12]_i_4_n_0\ : STD_LOGIC;
  signal \clk_count_tx[12]_i_5_n_0\ : STD_LOGIC;
  signal \clk_count_tx[16]_i_2_n_0\ : STD_LOGIC;
  signal \clk_count_tx[16]_i_3_n_0\ : STD_LOGIC;
  signal \clk_count_tx[16]_i_4_n_0\ : STD_LOGIC;
  signal \clk_count_tx[16]_i_5_n_0\ : STD_LOGIC;
  signal \clk_count_tx[20]_i_2_n_0\ : STD_LOGIC;
  signal \clk_count_tx[20]_i_3_n_0\ : STD_LOGIC;
  signal \clk_count_tx[20]_i_4_n_0\ : STD_LOGIC;
  signal \clk_count_tx[20]_i_5_n_0\ : STD_LOGIC;
  signal \clk_count_tx[24]_i_2_n_0\ : STD_LOGIC;
  signal \clk_count_tx[24]_i_3_n_0\ : STD_LOGIC;
  signal \clk_count_tx[24]_i_4_n_0\ : STD_LOGIC;
  signal \clk_count_tx[24]_i_5_n_0\ : STD_LOGIC;
  signal \clk_count_tx[28]_i_2_n_0\ : STD_LOGIC;
  signal \clk_count_tx[28]_i_3_n_0\ : STD_LOGIC;
  signal \clk_count_tx[28]_i_4_n_0\ : STD_LOGIC;
  signal \clk_count_tx[28]_i_5_n_0\ : STD_LOGIC;
  signal \clk_count_tx[4]_i_2_n_0\ : STD_LOGIC;
  signal \clk_count_tx[4]_i_3_n_0\ : STD_LOGIC;
  signal \clk_count_tx[4]_i_4_n_0\ : STD_LOGIC;
  signal \clk_count_tx[4]_i_5_n_0\ : STD_LOGIC;
  signal \clk_count_tx[8]_i_2_n_0\ : STD_LOGIC;
  signal \clk_count_tx[8]_i_3_n_0\ : STD_LOGIC;
  signal \clk_count_tx[8]_i_4_n_0\ : STD_LOGIC;
  signal \clk_count_tx[8]_i_5_n_0\ : STD_LOGIC;
  signal clk_count_tx_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \clk_count_tx_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \clk_count_tx_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \clk_count_tx_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \clk_count_tx_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \clk_count_tx_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \clk_count_tx_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \clk_count_tx_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \clk_count_tx_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \clk_count_tx_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \clk_count_tx_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \clk_count_tx_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \clk_count_tx_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \clk_count_tx_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \clk_count_tx_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \clk_count_tx_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \clk_count_tx_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \clk_count_tx_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \clk_count_tx_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \clk_count_tx_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \clk_count_tx_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \clk_count_tx_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \clk_count_tx_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \clk_count_tx_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \clk_count_tx_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \clk_count_tx_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \clk_count_tx_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \clk_count_tx_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \clk_count_tx_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \clk_count_tx_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \clk_count_tx_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \clk_count_tx_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \clk_count_tx_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \clk_count_tx_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \clk_count_tx_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \clk_count_tx_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \clk_count_tx_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \clk_count_tx_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \clk_count_tx_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \clk_count_tx_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \clk_count_tx_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \clk_count_tx_reg[28]_i_1_n_1\ : STD_LOGIC;
  signal \clk_count_tx_reg[28]_i_1_n_2\ : STD_LOGIC;
  signal \clk_count_tx_reg[28]_i_1_n_3\ : STD_LOGIC;
  signal \clk_count_tx_reg[28]_i_1_n_4\ : STD_LOGIC;
  signal \clk_count_tx_reg[28]_i_1_n_5\ : STD_LOGIC;
  signal \clk_count_tx_reg[28]_i_1_n_6\ : STD_LOGIC;
  signal \clk_count_tx_reg[28]_i_1_n_7\ : STD_LOGIC;
  signal \clk_count_tx_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \clk_count_tx_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \clk_count_tx_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \clk_count_tx_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \clk_count_tx_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \clk_count_tx_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \clk_count_tx_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \clk_count_tx_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \clk_count_tx_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \clk_count_tx_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \clk_count_tx_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \clk_count_tx_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \clk_count_tx_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \clk_count_tx_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \clk_count_tx_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \clk_count_tx_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal state_tx : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \state_tx__0\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^tdone\ : STD_LOGIC;
  signal tdone0 : STD_LOGIC;
  signal tdone_i_2_n_0 : STD_LOGIC;
  signal NLW_bit_index_tx1_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_bit_index_tx1_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_bit_index_tx1_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_bit_index_tx1_carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_bit_index_tx_reg[28]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_clk_count_tx1_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_clk_count_tx1_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_clk_count_tx1_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_clk_count_tx1_carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_clk_count_tx_reg[28]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_state_tx[0]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \FSM_sequential_state_tx[1]_i_1\ : label is "soft_lutpair0";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_tx_reg[0]\ : label is "START_STATE:01,DATA_STATE:10,IDLE_STATE:00,STOP_STATE:11";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_tx_reg[1]\ : label is "START_STATE:01,DATA_STATE:10,IDLE_STATE:00,STOP_STATE:11";
  attribute COMPARATOR_THRESHOLD : integer;
  attribute COMPARATOR_THRESHOLD of bit_index_tx1_carry : label is 11;
  attribute COMPARATOR_THRESHOLD of \bit_index_tx1_carry__0\ : label is 11;
  attribute COMPARATOR_THRESHOLD of \bit_index_tx1_carry__1\ : label is 11;
  attribute COMPARATOR_THRESHOLD of \bit_index_tx1_carry__2\ : label is 11;
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \bit_index_tx_reg[0]_i_2\ : label is 11;
  attribute ADDER_THRESHOLD of \bit_index_tx_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \bit_index_tx_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \bit_index_tx_reg[20]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \bit_index_tx_reg[24]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \bit_index_tx_reg[28]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \bit_index_tx_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \bit_index_tx_reg[8]_i_1\ : label is 11;
  attribute COMPARATOR_THRESHOLD of clk_count_tx1_carry : label is 11;
  attribute COMPARATOR_THRESHOLD of \clk_count_tx1_carry__0\ : label is 11;
  attribute COMPARATOR_THRESHOLD of \clk_count_tx1_carry__1\ : label is 11;
  attribute COMPARATOR_THRESHOLD of \clk_count_tx1_carry__2\ : label is 11;
  attribute ADDER_THRESHOLD of \clk_count_tx_reg[0]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \clk_count_tx_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \clk_count_tx_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \clk_count_tx_reg[20]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \clk_count_tx_reg[24]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \clk_count_tx_reg[28]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \clk_count_tx_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \clk_count_tx_reg[8]_i_1\ : label is 11;
begin
  tdone <= \^tdone\;
\FSM_sequential_state_tx[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"89DD8988"
    )
        port map (
      I0 => state_tx(0),
      I1 => \clk_count_tx1_carry__2_n_0\,
      I2 => \bit_index_tx1_carry__2_n_0\,
      I3 => state_tx(1),
      I4 => tenable,
      O => \state_tx__0\(0)
    );
\FSM_sequential_state_tx[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => state_tx(1),
      I1 => \clk_count_tx1_carry__2_n_0\,
      I2 => state_tx(0),
      O => \state_tx__0\(1)
    );
\FSM_sequential_state_tx_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => '1',
      D => \state_tx__0\(0),
      Q => state_tx(0),
      R => '0'
    );
\FSM_sequential_state_tx_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => '1',
      D => \state_tx__0\(1),
      Q => state_tx(1),
      R => '0'
    );
TX_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF00B8FF"
    )
        port map (
      I0 => TX_i_2_n_0,
      I1 => bit_index_tx_reg(2),
      I2 => TX_i_3_n_0,
      I3 => state_tx(1),
      I4 => state_tx(0),
      O => TX_i_1_n_0
    );
TX_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => tdin(7),
      I1 => tdin(6),
      I2 => bit_index_tx_reg(1),
      I3 => tdin(5),
      I4 => bit_index_tx_reg(0),
      I5 => tdin(4),
      O => TX_i_2_n_0
    );
TX_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => tdin(3),
      I1 => tdin(2),
      I2 => bit_index_tx_reg(1),
      I3 => tdin(1),
      I4 => bit_index_tx_reg(0),
      I5 => tdin(0),
      O => TX_i_3_n_0
    );
TX_reg: unisim.vcomponents.FDRE
     port map (
      C => tclock,
      CE => '1',
      D => TX_i_1_n_0,
      Q => TX,
      R => '0'
    );
bit_index_tx1_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => bit_index_tx1_carry_n_0,
      CO(2) => bit_index_tx1_carry_n_1,
      CO(1) => bit_index_tx1_carry_n_2,
      CO(0) => bit_index_tx1_carry_n_3,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1) => bit_index_tx1_carry_i_1_n_0,
      DI(0) => bit_index_tx1_carry_i_2_n_0,
      O(3 downto 0) => NLW_bit_index_tx1_carry_O_UNCONNECTED(3 downto 0),
      S(3) => bit_index_tx1_carry_i_3_n_0,
      S(2) => bit_index_tx1_carry_i_4_n_0,
      S(1) => bit_index_tx1_carry_i_5_n_0,
      S(0) => bit_index_tx1_carry_i_6_n_0
    );
\bit_index_tx1_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => bit_index_tx1_carry_n_0,
      CO(3) => \bit_index_tx1_carry__0_n_0\,
      CO(2) => \bit_index_tx1_carry__0_n_1\,
      CO(1) => \bit_index_tx1_carry__0_n_2\,
      CO(0) => \bit_index_tx1_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_bit_index_tx1_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \bit_index_tx1_carry__0_i_1_n_0\,
      S(2) => \bit_index_tx1_carry__0_i_2_n_0\,
      S(1) => \bit_index_tx1_carry__0_i_3_n_0\,
      S(0) => \bit_index_tx1_carry__0_i_4_n_0\
    );
\bit_index_tx1_carry__0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => bit_index_tx_reg(14),
      I1 => bit_index_tx_reg(15),
      O => \bit_index_tx1_carry__0_i_1_n_0\
    );
\bit_index_tx1_carry__0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => bit_index_tx_reg(12),
      I1 => bit_index_tx_reg(13),
      O => \bit_index_tx1_carry__0_i_2_n_0\
    );
\bit_index_tx1_carry__0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => bit_index_tx_reg(10),
      I1 => bit_index_tx_reg(11),
      O => \bit_index_tx1_carry__0_i_3_n_0\
    );
\bit_index_tx1_carry__0_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => bit_index_tx_reg(8),
      I1 => bit_index_tx_reg(9),
      O => \bit_index_tx1_carry__0_i_4_n_0\
    );
\bit_index_tx1_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \bit_index_tx1_carry__0_n_0\,
      CO(3) => \bit_index_tx1_carry__1_n_0\,
      CO(2) => \bit_index_tx1_carry__1_n_1\,
      CO(1) => \bit_index_tx1_carry__1_n_2\,
      CO(0) => \bit_index_tx1_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_bit_index_tx1_carry__1_O_UNCONNECTED\(3 downto 0),
      S(3) => \bit_index_tx1_carry__1_i_1_n_0\,
      S(2) => \bit_index_tx1_carry__1_i_2_n_0\,
      S(1) => \bit_index_tx1_carry__1_i_3_n_0\,
      S(0) => \bit_index_tx1_carry__1_i_4_n_0\
    );
\bit_index_tx1_carry__1_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => bit_index_tx_reg(22),
      I1 => bit_index_tx_reg(23),
      O => \bit_index_tx1_carry__1_i_1_n_0\
    );
\bit_index_tx1_carry__1_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => bit_index_tx_reg(20),
      I1 => bit_index_tx_reg(21),
      O => \bit_index_tx1_carry__1_i_2_n_0\
    );
\bit_index_tx1_carry__1_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => bit_index_tx_reg(18),
      I1 => bit_index_tx_reg(19),
      O => \bit_index_tx1_carry__1_i_3_n_0\
    );
\bit_index_tx1_carry__1_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => bit_index_tx_reg(16),
      I1 => bit_index_tx_reg(17),
      O => \bit_index_tx1_carry__1_i_4_n_0\
    );
\bit_index_tx1_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \bit_index_tx1_carry__1_n_0\,
      CO(3) => \bit_index_tx1_carry__2_n_0\,
      CO(2) => \bit_index_tx1_carry__2_n_1\,
      CO(1) => \bit_index_tx1_carry__2_n_2\,
      CO(0) => \bit_index_tx1_carry__2_n_3\,
      CYINIT => '0',
      DI(3) => bit_index_tx_reg(31),
      DI(2 downto 0) => B"000",
      O(3 downto 0) => \NLW_bit_index_tx1_carry__2_O_UNCONNECTED\(3 downto 0),
      S(3) => \bit_index_tx1_carry__2_i_1_n_0\,
      S(2) => \bit_index_tx1_carry__2_i_2_n_0\,
      S(1) => \bit_index_tx1_carry__2_i_3_n_0\,
      S(0) => \bit_index_tx1_carry__2_i_4_n_0\
    );
\bit_index_tx1_carry__2_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => bit_index_tx_reg(30),
      I1 => bit_index_tx_reg(31),
      O => \bit_index_tx1_carry__2_i_1_n_0\
    );
\bit_index_tx1_carry__2_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => bit_index_tx_reg(28),
      I1 => bit_index_tx_reg(29),
      O => \bit_index_tx1_carry__2_i_2_n_0\
    );
\bit_index_tx1_carry__2_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => bit_index_tx_reg(26),
      I1 => bit_index_tx_reg(27),
      O => \bit_index_tx1_carry__2_i_3_n_0\
    );
\bit_index_tx1_carry__2_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => bit_index_tx_reg(24),
      I1 => bit_index_tx_reg(25),
      O => \bit_index_tx1_carry__2_i_4_n_0\
    );
bit_index_tx1_carry_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => bit_index_tx_reg(2),
      I1 => bit_index_tx_reg(3),
      O => bit_index_tx1_carry_i_1_n_0
    );
bit_index_tx1_carry_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => bit_index_tx_reg(0),
      I1 => bit_index_tx_reg(1),
      O => bit_index_tx1_carry_i_2_n_0
    );
bit_index_tx1_carry_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => bit_index_tx_reg(6),
      I1 => bit_index_tx_reg(7),
      O => bit_index_tx1_carry_i_3_n_0
    );
bit_index_tx1_carry_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => bit_index_tx_reg(4),
      I1 => bit_index_tx_reg(5),
      O => bit_index_tx1_carry_i_4_n_0
    );
bit_index_tx1_carry_i_5: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => bit_index_tx_reg(2),
      I1 => bit_index_tx_reg(3),
      O => bit_index_tx1_carry_i_5_n_0
    );
bit_index_tx1_carry_i_6: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => bit_index_tx_reg(0),
      I1 => bit_index_tx_reg(1),
      O => bit_index_tx1_carry_i_6_n_0
    );
\bit_index_tx[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => state_tx(0),
      I1 => state_tx(1),
      I2 => \clk_count_tx1_carry__2_n_0\,
      O => bit_index_tx
    );
\bit_index_tx[0]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \bit_index_tx1_carry__2_n_0\,
      I1 => bit_index_tx_reg(3),
      O => \bit_index_tx[0]_i_3_n_0\
    );
\bit_index_tx[0]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \bit_index_tx1_carry__2_n_0\,
      I1 => bit_index_tx_reg(2),
      O => \bit_index_tx[0]_i_4_n_0\
    );
\bit_index_tx[0]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \bit_index_tx1_carry__2_n_0\,
      I1 => bit_index_tx_reg(1),
      O => \bit_index_tx[0]_i_5_n_0\
    );
\bit_index_tx[0]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"4"
    )
        port map (
      I0 => bit_index_tx_reg(0),
      I1 => \bit_index_tx1_carry__2_n_0\,
      O => \bit_index_tx[0]_i_6_n_0\
    );
\bit_index_tx[12]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \bit_index_tx1_carry__2_n_0\,
      I1 => bit_index_tx_reg(15),
      O => \bit_index_tx[12]_i_2_n_0\
    );
\bit_index_tx[12]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \bit_index_tx1_carry__2_n_0\,
      I1 => bit_index_tx_reg(14),
      O => \bit_index_tx[12]_i_3_n_0\
    );
\bit_index_tx[12]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \bit_index_tx1_carry__2_n_0\,
      I1 => bit_index_tx_reg(13),
      O => \bit_index_tx[12]_i_4_n_0\
    );
\bit_index_tx[12]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \bit_index_tx1_carry__2_n_0\,
      I1 => bit_index_tx_reg(12),
      O => \bit_index_tx[12]_i_5_n_0\
    );
\bit_index_tx[16]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \bit_index_tx1_carry__2_n_0\,
      I1 => bit_index_tx_reg(19),
      O => \bit_index_tx[16]_i_2_n_0\
    );
\bit_index_tx[16]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \bit_index_tx1_carry__2_n_0\,
      I1 => bit_index_tx_reg(18),
      O => \bit_index_tx[16]_i_3_n_0\
    );
\bit_index_tx[16]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \bit_index_tx1_carry__2_n_0\,
      I1 => bit_index_tx_reg(17),
      O => \bit_index_tx[16]_i_4_n_0\
    );
\bit_index_tx[16]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \bit_index_tx1_carry__2_n_0\,
      I1 => bit_index_tx_reg(16),
      O => \bit_index_tx[16]_i_5_n_0\
    );
\bit_index_tx[20]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \bit_index_tx1_carry__2_n_0\,
      I1 => bit_index_tx_reg(23),
      O => \bit_index_tx[20]_i_2_n_0\
    );
\bit_index_tx[20]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \bit_index_tx1_carry__2_n_0\,
      I1 => bit_index_tx_reg(22),
      O => \bit_index_tx[20]_i_3_n_0\
    );
\bit_index_tx[20]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \bit_index_tx1_carry__2_n_0\,
      I1 => bit_index_tx_reg(21),
      O => \bit_index_tx[20]_i_4_n_0\
    );
\bit_index_tx[20]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \bit_index_tx1_carry__2_n_0\,
      I1 => bit_index_tx_reg(20),
      O => \bit_index_tx[20]_i_5_n_0\
    );
\bit_index_tx[24]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \bit_index_tx1_carry__2_n_0\,
      I1 => bit_index_tx_reg(27),
      O => \bit_index_tx[24]_i_2_n_0\
    );
\bit_index_tx[24]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \bit_index_tx1_carry__2_n_0\,
      I1 => bit_index_tx_reg(26),
      O => \bit_index_tx[24]_i_3_n_0\
    );
\bit_index_tx[24]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \bit_index_tx1_carry__2_n_0\,
      I1 => bit_index_tx_reg(25),
      O => \bit_index_tx[24]_i_4_n_0\
    );
\bit_index_tx[24]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \bit_index_tx1_carry__2_n_0\,
      I1 => bit_index_tx_reg(24),
      O => \bit_index_tx[24]_i_5_n_0\
    );
\bit_index_tx[28]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \bit_index_tx1_carry__2_n_0\,
      I1 => bit_index_tx_reg(31),
      O => \bit_index_tx[28]_i_2_n_0\
    );
\bit_index_tx[28]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \bit_index_tx1_carry__2_n_0\,
      I1 => bit_index_tx_reg(30),
      O => \bit_index_tx[28]_i_3_n_0\
    );
\bit_index_tx[28]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \bit_index_tx1_carry__2_n_0\,
      I1 => bit_index_tx_reg(29),
      O => \bit_index_tx[28]_i_4_n_0\
    );
\bit_index_tx[28]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \bit_index_tx1_carry__2_n_0\,
      I1 => bit_index_tx_reg(28),
      O => \bit_index_tx[28]_i_5_n_0\
    );
\bit_index_tx[4]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \bit_index_tx1_carry__2_n_0\,
      I1 => bit_index_tx_reg(7),
      O => \bit_index_tx[4]_i_2_n_0\
    );
\bit_index_tx[4]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \bit_index_tx1_carry__2_n_0\,
      I1 => bit_index_tx_reg(6),
      O => \bit_index_tx[4]_i_3_n_0\
    );
\bit_index_tx[4]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \bit_index_tx1_carry__2_n_0\,
      I1 => bit_index_tx_reg(5),
      O => \bit_index_tx[4]_i_4_n_0\
    );
\bit_index_tx[4]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \bit_index_tx1_carry__2_n_0\,
      I1 => bit_index_tx_reg(4),
      O => \bit_index_tx[4]_i_5_n_0\
    );
\bit_index_tx[8]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \bit_index_tx1_carry__2_n_0\,
      I1 => bit_index_tx_reg(11),
      O => \bit_index_tx[8]_i_2_n_0\
    );
\bit_index_tx[8]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \bit_index_tx1_carry__2_n_0\,
      I1 => bit_index_tx_reg(10),
      O => \bit_index_tx[8]_i_3_n_0\
    );
\bit_index_tx[8]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \bit_index_tx1_carry__2_n_0\,
      I1 => bit_index_tx_reg(9),
      O => \bit_index_tx[8]_i_4_n_0\
    );
\bit_index_tx[8]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \bit_index_tx1_carry__2_n_0\,
      I1 => bit_index_tx_reg(8),
      O => \bit_index_tx[8]_i_5_n_0\
    );
\bit_index_tx_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => bit_index_tx,
      D => \bit_index_tx_reg[0]_i_2_n_7\,
      Q => bit_index_tx_reg(0),
      R => tdone0
    );
\bit_index_tx_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \bit_index_tx_reg[0]_i_2_n_0\,
      CO(2) => \bit_index_tx_reg[0]_i_2_n_1\,
      CO(1) => \bit_index_tx_reg[0]_i_2_n_2\,
      CO(0) => \bit_index_tx_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => \bit_index_tx1_carry__2_n_0\,
      O(3) => \bit_index_tx_reg[0]_i_2_n_4\,
      O(2) => \bit_index_tx_reg[0]_i_2_n_5\,
      O(1) => \bit_index_tx_reg[0]_i_2_n_6\,
      O(0) => \bit_index_tx_reg[0]_i_2_n_7\,
      S(3) => \bit_index_tx[0]_i_3_n_0\,
      S(2) => \bit_index_tx[0]_i_4_n_0\,
      S(1) => \bit_index_tx[0]_i_5_n_0\,
      S(0) => \bit_index_tx[0]_i_6_n_0\
    );
\bit_index_tx_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => bit_index_tx,
      D => \bit_index_tx_reg[8]_i_1_n_5\,
      Q => bit_index_tx_reg(10),
      R => tdone0
    );
\bit_index_tx_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => bit_index_tx,
      D => \bit_index_tx_reg[8]_i_1_n_4\,
      Q => bit_index_tx_reg(11),
      R => tdone0
    );
\bit_index_tx_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => bit_index_tx,
      D => \bit_index_tx_reg[12]_i_1_n_7\,
      Q => bit_index_tx_reg(12),
      R => tdone0
    );
\bit_index_tx_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \bit_index_tx_reg[8]_i_1_n_0\,
      CO(3) => \bit_index_tx_reg[12]_i_1_n_0\,
      CO(2) => \bit_index_tx_reg[12]_i_1_n_1\,
      CO(1) => \bit_index_tx_reg[12]_i_1_n_2\,
      CO(0) => \bit_index_tx_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \bit_index_tx_reg[12]_i_1_n_4\,
      O(2) => \bit_index_tx_reg[12]_i_1_n_5\,
      O(1) => \bit_index_tx_reg[12]_i_1_n_6\,
      O(0) => \bit_index_tx_reg[12]_i_1_n_7\,
      S(3) => \bit_index_tx[12]_i_2_n_0\,
      S(2) => \bit_index_tx[12]_i_3_n_0\,
      S(1) => \bit_index_tx[12]_i_4_n_0\,
      S(0) => \bit_index_tx[12]_i_5_n_0\
    );
\bit_index_tx_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => bit_index_tx,
      D => \bit_index_tx_reg[12]_i_1_n_6\,
      Q => bit_index_tx_reg(13),
      R => tdone0
    );
\bit_index_tx_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => bit_index_tx,
      D => \bit_index_tx_reg[12]_i_1_n_5\,
      Q => bit_index_tx_reg(14),
      R => tdone0
    );
\bit_index_tx_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => bit_index_tx,
      D => \bit_index_tx_reg[12]_i_1_n_4\,
      Q => bit_index_tx_reg(15),
      R => tdone0
    );
\bit_index_tx_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => bit_index_tx,
      D => \bit_index_tx_reg[16]_i_1_n_7\,
      Q => bit_index_tx_reg(16),
      R => tdone0
    );
\bit_index_tx_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \bit_index_tx_reg[12]_i_1_n_0\,
      CO(3) => \bit_index_tx_reg[16]_i_1_n_0\,
      CO(2) => \bit_index_tx_reg[16]_i_1_n_1\,
      CO(1) => \bit_index_tx_reg[16]_i_1_n_2\,
      CO(0) => \bit_index_tx_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \bit_index_tx_reg[16]_i_1_n_4\,
      O(2) => \bit_index_tx_reg[16]_i_1_n_5\,
      O(1) => \bit_index_tx_reg[16]_i_1_n_6\,
      O(0) => \bit_index_tx_reg[16]_i_1_n_7\,
      S(3) => \bit_index_tx[16]_i_2_n_0\,
      S(2) => \bit_index_tx[16]_i_3_n_0\,
      S(1) => \bit_index_tx[16]_i_4_n_0\,
      S(0) => \bit_index_tx[16]_i_5_n_0\
    );
\bit_index_tx_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => bit_index_tx,
      D => \bit_index_tx_reg[16]_i_1_n_6\,
      Q => bit_index_tx_reg(17),
      R => tdone0
    );
\bit_index_tx_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => bit_index_tx,
      D => \bit_index_tx_reg[16]_i_1_n_5\,
      Q => bit_index_tx_reg(18),
      R => tdone0
    );
\bit_index_tx_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => bit_index_tx,
      D => \bit_index_tx_reg[16]_i_1_n_4\,
      Q => bit_index_tx_reg(19),
      R => tdone0
    );
\bit_index_tx_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => bit_index_tx,
      D => \bit_index_tx_reg[0]_i_2_n_6\,
      Q => bit_index_tx_reg(1),
      R => tdone0
    );
\bit_index_tx_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => bit_index_tx,
      D => \bit_index_tx_reg[20]_i_1_n_7\,
      Q => bit_index_tx_reg(20),
      R => tdone0
    );
\bit_index_tx_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \bit_index_tx_reg[16]_i_1_n_0\,
      CO(3) => \bit_index_tx_reg[20]_i_1_n_0\,
      CO(2) => \bit_index_tx_reg[20]_i_1_n_1\,
      CO(1) => \bit_index_tx_reg[20]_i_1_n_2\,
      CO(0) => \bit_index_tx_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \bit_index_tx_reg[20]_i_1_n_4\,
      O(2) => \bit_index_tx_reg[20]_i_1_n_5\,
      O(1) => \bit_index_tx_reg[20]_i_1_n_6\,
      O(0) => \bit_index_tx_reg[20]_i_1_n_7\,
      S(3) => \bit_index_tx[20]_i_2_n_0\,
      S(2) => \bit_index_tx[20]_i_3_n_0\,
      S(1) => \bit_index_tx[20]_i_4_n_0\,
      S(0) => \bit_index_tx[20]_i_5_n_0\
    );
\bit_index_tx_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => bit_index_tx,
      D => \bit_index_tx_reg[20]_i_1_n_6\,
      Q => bit_index_tx_reg(21),
      R => tdone0
    );
\bit_index_tx_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => bit_index_tx,
      D => \bit_index_tx_reg[20]_i_1_n_5\,
      Q => bit_index_tx_reg(22),
      R => tdone0
    );
\bit_index_tx_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => bit_index_tx,
      D => \bit_index_tx_reg[20]_i_1_n_4\,
      Q => bit_index_tx_reg(23),
      R => tdone0
    );
\bit_index_tx_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => bit_index_tx,
      D => \bit_index_tx_reg[24]_i_1_n_7\,
      Q => bit_index_tx_reg(24),
      R => tdone0
    );
\bit_index_tx_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \bit_index_tx_reg[20]_i_1_n_0\,
      CO(3) => \bit_index_tx_reg[24]_i_1_n_0\,
      CO(2) => \bit_index_tx_reg[24]_i_1_n_1\,
      CO(1) => \bit_index_tx_reg[24]_i_1_n_2\,
      CO(0) => \bit_index_tx_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \bit_index_tx_reg[24]_i_1_n_4\,
      O(2) => \bit_index_tx_reg[24]_i_1_n_5\,
      O(1) => \bit_index_tx_reg[24]_i_1_n_6\,
      O(0) => \bit_index_tx_reg[24]_i_1_n_7\,
      S(3) => \bit_index_tx[24]_i_2_n_0\,
      S(2) => \bit_index_tx[24]_i_3_n_0\,
      S(1) => \bit_index_tx[24]_i_4_n_0\,
      S(0) => \bit_index_tx[24]_i_5_n_0\
    );
\bit_index_tx_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => bit_index_tx,
      D => \bit_index_tx_reg[24]_i_1_n_6\,
      Q => bit_index_tx_reg(25),
      R => tdone0
    );
\bit_index_tx_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => bit_index_tx,
      D => \bit_index_tx_reg[24]_i_1_n_5\,
      Q => bit_index_tx_reg(26),
      R => tdone0
    );
\bit_index_tx_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => bit_index_tx,
      D => \bit_index_tx_reg[24]_i_1_n_4\,
      Q => bit_index_tx_reg(27),
      R => tdone0
    );
\bit_index_tx_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => bit_index_tx,
      D => \bit_index_tx_reg[28]_i_1_n_7\,
      Q => bit_index_tx_reg(28),
      R => tdone0
    );
\bit_index_tx_reg[28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \bit_index_tx_reg[24]_i_1_n_0\,
      CO(3) => \NLW_bit_index_tx_reg[28]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \bit_index_tx_reg[28]_i_1_n_1\,
      CO(1) => \bit_index_tx_reg[28]_i_1_n_2\,
      CO(0) => \bit_index_tx_reg[28]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \bit_index_tx_reg[28]_i_1_n_4\,
      O(2) => \bit_index_tx_reg[28]_i_1_n_5\,
      O(1) => \bit_index_tx_reg[28]_i_1_n_6\,
      O(0) => \bit_index_tx_reg[28]_i_1_n_7\,
      S(3) => \bit_index_tx[28]_i_2_n_0\,
      S(2) => \bit_index_tx[28]_i_3_n_0\,
      S(1) => \bit_index_tx[28]_i_4_n_0\,
      S(0) => \bit_index_tx[28]_i_5_n_0\
    );
\bit_index_tx_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => bit_index_tx,
      D => \bit_index_tx_reg[28]_i_1_n_6\,
      Q => bit_index_tx_reg(29),
      R => tdone0
    );
\bit_index_tx_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => bit_index_tx,
      D => \bit_index_tx_reg[0]_i_2_n_5\,
      Q => bit_index_tx_reg(2),
      R => tdone0
    );
\bit_index_tx_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => bit_index_tx,
      D => \bit_index_tx_reg[28]_i_1_n_5\,
      Q => bit_index_tx_reg(30),
      R => tdone0
    );
\bit_index_tx_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => bit_index_tx,
      D => \bit_index_tx_reg[28]_i_1_n_4\,
      Q => bit_index_tx_reg(31),
      R => tdone0
    );
\bit_index_tx_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => bit_index_tx,
      D => \bit_index_tx_reg[0]_i_2_n_4\,
      Q => bit_index_tx_reg(3),
      R => tdone0
    );
\bit_index_tx_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => bit_index_tx,
      D => \bit_index_tx_reg[4]_i_1_n_7\,
      Q => bit_index_tx_reg(4),
      R => tdone0
    );
\bit_index_tx_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \bit_index_tx_reg[0]_i_2_n_0\,
      CO(3) => \bit_index_tx_reg[4]_i_1_n_0\,
      CO(2) => \bit_index_tx_reg[4]_i_1_n_1\,
      CO(1) => \bit_index_tx_reg[4]_i_1_n_2\,
      CO(0) => \bit_index_tx_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \bit_index_tx_reg[4]_i_1_n_4\,
      O(2) => \bit_index_tx_reg[4]_i_1_n_5\,
      O(1) => \bit_index_tx_reg[4]_i_1_n_6\,
      O(0) => \bit_index_tx_reg[4]_i_1_n_7\,
      S(3) => \bit_index_tx[4]_i_2_n_0\,
      S(2) => \bit_index_tx[4]_i_3_n_0\,
      S(1) => \bit_index_tx[4]_i_4_n_0\,
      S(0) => \bit_index_tx[4]_i_5_n_0\
    );
\bit_index_tx_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => bit_index_tx,
      D => \bit_index_tx_reg[4]_i_1_n_6\,
      Q => bit_index_tx_reg(5),
      R => tdone0
    );
\bit_index_tx_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => bit_index_tx,
      D => \bit_index_tx_reg[4]_i_1_n_5\,
      Q => bit_index_tx_reg(6),
      R => tdone0
    );
\bit_index_tx_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => bit_index_tx,
      D => \bit_index_tx_reg[4]_i_1_n_4\,
      Q => bit_index_tx_reg(7),
      R => tdone0
    );
\bit_index_tx_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => bit_index_tx,
      D => \bit_index_tx_reg[8]_i_1_n_7\,
      Q => bit_index_tx_reg(8),
      R => tdone0
    );
\bit_index_tx_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \bit_index_tx_reg[4]_i_1_n_0\,
      CO(3) => \bit_index_tx_reg[8]_i_1_n_0\,
      CO(2) => \bit_index_tx_reg[8]_i_1_n_1\,
      CO(1) => \bit_index_tx_reg[8]_i_1_n_2\,
      CO(0) => \bit_index_tx_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \bit_index_tx_reg[8]_i_1_n_4\,
      O(2) => \bit_index_tx_reg[8]_i_1_n_5\,
      O(1) => \bit_index_tx_reg[8]_i_1_n_6\,
      O(0) => \bit_index_tx_reg[8]_i_1_n_7\,
      S(3) => \bit_index_tx[8]_i_2_n_0\,
      S(2) => \bit_index_tx[8]_i_3_n_0\,
      S(1) => \bit_index_tx[8]_i_4_n_0\,
      S(0) => \bit_index_tx[8]_i_5_n_0\
    );
\bit_index_tx_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => bit_index_tx,
      D => \bit_index_tx_reg[8]_i_1_n_6\,
      Q => bit_index_tx_reg(9),
      R => tdone0
    );
clk_count_tx1_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => clk_count_tx1_carry_n_0,
      CO(2) => clk_count_tx1_carry_n_1,
      CO(1) => clk_count_tx1_carry_n_2,
      CO(0) => clk_count_tx1_carry_n_3,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => clk_count_tx1_carry_i_1_n_0,
      DI(1) => clk_count_tx1_carry_i_2_n_0,
      DI(0) => \clk_count_tx1_carry_i_3__2_n_0\,
      O(3 downto 0) => NLW_clk_count_tx1_carry_O_UNCONNECTED(3 downto 0),
      S(3) => \clk_count_tx1_carry_i_4__2_n_0\,
      S(2) => clk_count_tx1_carry_i_5_n_0,
      S(1) => clk_count_tx1_carry_i_6_n_0,
      S(0) => clk_count_tx1_carry_i_7_n_0
    );
\clk_count_tx1_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => clk_count_tx1_carry_n_0,
      CO(3) => \clk_count_tx1_carry__0_n_0\,
      CO(2) => \clk_count_tx1_carry__0_n_1\,
      CO(1) => \clk_count_tx1_carry__0_n_2\,
      CO(0) => \clk_count_tx1_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1) => \clk_count_tx1_carry_i_1__2_n_0\,
      DI(0) => '0',
      O(3 downto 0) => \NLW_clk_count_tx1_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \clk_count_tx1_carry_i_2__2_n_0\,
      S(2) => \clk_count_tx1_carry_i_3__1_n_0\,
      S(1) => \clk_count_tx1_carry_i_4__1_n_0\,
      S(0) => \clk_count_tx1_carry_i_5__0_n_0\
    );
\clk_count_tx1_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \clk_count_tx1_carry__0_n_0\,
      CO(3) => \clk_count_tx1_carry__1_n_0\,
      CO(2) => \clk_count_tx1_carry__1_n_1\,
      CO(1) => \clk_count_tx1_carry__1_n_2\,
      CO(0) => \clk_count_tx1_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_clk_count_tx1_carry__1_O_UNCONNECTED\(3 downto 0),
      S(3) => \clk_count_tx1_carry_i_1__1_n_0\,
      S(2) => \clk_count_tx1_carry_i_2__1_n_0\,
      S(1) => \clk_count_tx1_carry_i_3__0_n_0\,
      S(0) => \clk_count_tx1_carry_i_4__0_n_0\
    );
\clk_count_tx1_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \clk_count_tx1_carry__1_n_0\,
      CO(3) => \clk_count_tx1_carry__2_n_0\,
      CO(2) => \clk_count_tx1_carry__2_n_1\,
      CO(1) => \clk_count_tx1_carry__2_n_2\,
      CO(0) => \clk_count_tx1_carry__2_n_3\,
      CYINIT => '0',
      DI(3) => clk_count_tx_reg(31),
      DI(2 downto 0) => B"000",
      O(3 downto 0) => \NLW_clk_count_tx1_carry__2_O_UNCONNECTED\(3 downto 0),
      S(3) => \clk_count_tx1_carry_i_1__0_n_0\,
      S(2) => \clk_count_tx1_carry_i_2__0_n_0\,
      S(1) => clk_count_tx1_carry_i_3_n_0,
      S(0) => clk_count_tx1_carry_i_4_n_0
    );
clk_count_tx1_carry_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => clk_count_tx_reg(4),
      I1 => clk_count_tx_reg(5),
      O => clk_count_tx1_carry_i_1_n_0
    );
\clk_count_tx1_carry_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => clk_count_tx_reg(30),
      I1 => clk_count_tx_reg(31),
      O => \clk_count_tx1_carry_i_1__0_n_0\
    );
\clk_count_tx1_carry_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => clk_count_tx_reg(22),
      I1 => clk_count_tx_reg(23),
      O => \clk_count_tx1_carry_i_1__1_n_0\
    );
\clk_count_tx1_carry_i_1__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => clk_count_tx_reg(10),
      I1 => clk_count_tx_reg(11),
      O => \clk_count_tx1_carry_i_1__2_n_0\
    );
clk_count_tx1_carry_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => clk_count_tx_reg(2),
      I1 => clk_count_tx_reg(3),
      O => clk_count_tx1_carry_i_2_n_0
    );
\clk_count_tx1_carry_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => clk_count_tx_reg(28),
      I1 => clk_count_tx_reg(29),
      O => \clk_count_tx1_carry_i_2__0_n_0\
    );
\clk_count_tx1_carry_i_2__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => clk_count_tx_reg(20),
      I1 => clk_count_tx_reg(21),
      O => \clk_count_tx1_carry_i_2__1_n_0\
    );
\clk_count_tx1_carry_i_2__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => clk_count_tx_reg(14),
      I1 => clk_count_tx_reg(15),
      O => \clk_count_tx1_carry_i_2__2_n_0\
    );
clk_count_tx1_carry_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => clk_count_tx_reg(26),
      I1 => clk_count_tx_reg(27),
      O => clk_count_tx1_carry_i_3_n_0
    );
\clk_count_tx1_carry_i_3__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => clk_count_tx_reg(18),
      I1 => clk_count_tx_reg(19),
      O => \clk_count_tx1_carry_i_3__0_n_0\
    );
\clk_count_tx1_carry_i_3__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => clk_count_tx_reg(12),
      I1 => clk_count_tx_reg(13),
      O => \clk_count_tx1_carry_i_3__1_n_0\
    );
\clk_count_tx1_carry_i_3__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => clk_count_tx_reg(0),
      I1 => clk_count_tx_reg(1),
      O => \clk_count_tx1_carry_i_3__2_n_0\
    );
clk_count_tx1_carry_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => clk_count_tx_reg(24),
      I1 => clk_count_tx_reg(25),
      O => clk_count_tx1_carry_i_4_n_0
    );
\clk_count_tx1_carry_i_4__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => clk_count_tx_reg(16),
      I1 => clk_count_tx_reg(17),
      O => \clk_count_tx1_carry_i_4__0_n_0\
    );
\clk_count_tx1_carry_i_4__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => clk_count_tx_reg(10),
      I1 => clk_count_tx_reg(11),
      O => \clk_count_tx1_carry_i_4__1_n_0\
    );
\clk_count_tx1_carry_i_4__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => clk_count_tx_reg(6),
      I1 => clk_count_tx_reg(7),
      O => \clk_count_tx1_carry_i_4__2_n_0\
    );
clk_count_tx1_carry_i_5: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => clk_count_tx_reg(4),
      I1 => clk_count_tx_reg(5),
      O => clk_count_tx1_carry_i_5_n_0
    );
\clk_count_tx1_carry_i_5__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => clk_count_tx_reg(8),
      I1 => clk_count_tx_reg(9),
      O => \clk_count_tx1_carry_i_5__0_n_0\
    );
clk_count_tx1_carry_i_6: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => clk_count_tx_reg(2),
      I1 => clk_count_tx_reg(3),
      O => clk_count_tx1_carry_i_6_n_0
    );
clk_count_tx1_carry_i_7: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => clk_count_tx_reg(0),
      I1 => clk_count_tx_reg(1),
      O => clk_count_tx1_carry_i_7_n_0
    );
\clk_count_tx[0]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \clk_count_tx1_carry__2_n_0\,
      I1 => clk_count_tx_reg(3),
      O => \clk_count_tx[0]_i_2_n_0\
    );
\clk_count_tx[0]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \clk_count_tx1_carry__2_n_0\,
      I1 => clk_count_tx_reg(2),
      O => \clk_count_tx[0]_i_3_n_0\
    );
\clk_count_tx[0]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \clk_count_tx1_carry__2_n_0\,
      I1 => clk_count_tx_reg(1),
      O => \clk_count_tx[0]_i_4_n_0\
    );
\clk_count_tx[0]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"4"
    )
        port map (
      I0 => clk_count_tx_reg(0),
      I1 => \clk_count_tx1_carry__2_n_0\,
      O => \clk_count_tx[0]_i_5_n_0\
    );
\clk_count_tx[12]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \clk_count_tx1_carry__2_n_0\,
      I1 => clk_count_tx_reg(15),
      O => \clk_count_tx[12]_i_2_n_0\
    );
\clk_count_tx[12]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \clk_count_tx1_carry__2_n_0\,
      I1 => clk_count_tx_reg(14),
      O => \clk_count_tx[12]_i_3_n_0\
    );
\clk_count_tx[12]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \clk_count_tx1_carry__2_n_0\,
      I1 => clk_count_tx_reg(13),
      O => \clk_count_tx[12]_i_4_n_0\
    );
\clk_count_tx[12]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \clk_count_tx1_carry__2_n_0\,
      I1 => clk_count_tx_reg(12),
      O => \clk_count_tx[12]_i_5_n_0\
    );
\clk_count_tx[16]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \clk_count_tx1_carry__2_n_0\,
      I1 => clk_count_tx_reg(19),
      O => \clk_count_tx[16]_i_2_n_0\
    );
\clk_count_tx[16]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \clk_count_tx1_carry__2_n_0\,
      I1 => clk_count_tx_reg(18),
      O => \clk_count_tx[16]_i_3_n_0\
    );
\clk_count_tx[16]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \clk_count_tx1_carry__2_n_0\,
      I1 => clk_count_tx_reg(17),
      O => \clk_count_tx[16]_i_4_n_0\
    );
\clk_count_tx[16]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \clk_count_tx1_carry__2_n_0\,
      I1 => clk_count_tx_reg(16),
      O => \clk_count_tx[16]_i_5_n_0\
    );
\clk_count_tx[20]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \clk_count_tx1_carry__2_n_0\,
      I1 => clk_count_tx_reg(23),
      O => \clk_count_tx[20]_i_2_n_0\
    );
\clk_count_tx[20]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \clk_count_tx1_carry__2_n_0\,
      I1 => clk_count_tx_reg(22),
      O => \clk_count_tx[20]_i_3_n_0\
    );
\clk_count_tx[20]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \clk_count_tx1_carry__2_n_0\,
      I1 => clk_count_tx_reg(21),
      O => \clk_count_tx[20]_i_4_n_0\
    );
\clk_count_tx[20]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \clk_count_tx1_carry__2_n_0\,
      I1 => clk_count_tx_reg(20),
      O => \clk_count_tx[20]_i_5_n_0\
    );
\clk_count_tx[24]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \clk_count_tx1_carry__2_n_0\,
      I1 => clk_count_tx_reg(27),
      O => \clk_count_tx[24]_i_2_n_0\
    );
\clk_count_tx[24]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \clk_count_tx1_carry__2_n_0\,
      I1 => clk_count_tx_reg(26),
      O => \clk_count_tx[24]_i_3_n_0\
    );
\clk_count_tx[24]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \clk_count_tx1_carry__2_n_0\,
      I1 => clk_count_tx_reg(25),
      O => \clk_count_tx[24]_i_4_n_0\
    );
\clk_count_tx[24]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \clk_count_tx1_carry__2_n_0\,
      I1 => clk_count_tx_reg(24),
      O => \clk_count_tx[24]_i_5_n_0\
    );
\clk_count_tx[28]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \clk_count_tx1_carry__2_n_0\,
      I1 => clk_count_tx_reg(31),
      O => \clk_count_tx[28]_i_2_n_0\
    );
\clk_count_tx[28]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \clk_count_tx1_carry__2_n_0\,
      I1 => clk_count_tx_reg(30),
      O => \clk_count_tx[28]_i_3_n_0\
    );
\clk_count_tx[28]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \clk_count_tx1_carry__2_n_0\,
      I1 => clk_count_tx_reg(29),
      O => \clk_count_tx[28]_i_4_n_0\
    );
\clk_count_tx[28]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \clk_count_tx1_carry__2_n_0\,
      I1 => clk_count_tx_reg(28),
      O => \clk_count_tx[28]_i_5_n_0\
    );
\clk_count_tx[4]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \clk_count_tx1_carry__2_n_0\,
      I1 => clk_count_tx_reg(7),
      O => \clk_count_tx[4]_i_2_n_0\
    );
\clk_count_tx[4]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \clk_count_tx1_carry__2_n_0\,
      I1 => clk_count_tx_reg(6),
      O => \clk_count_tx[4]_i_3_n_0\
    );
\clk_count_tx[4]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \clk_count_tx1_carry__2_n_0\,
      I1 => clk_count_tx_reg(5),
      O => \clk_count_tx[4]_i_4_n_0\
    );
\clk_count_tx[4]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \clk_count_tx1_carry__2_n_0\,
      I1 => clk_count_tx_reg(4),
      O => \clk_count_tx[4]_i_5_n_0\
    );
\clk_count_tx[8]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \clk_count_tx1_carry__2_n_0\,
      I1 => clk_count_tx_reg(11),
      O => \clk_count_tx[8]_i_2_n_0\
    );
\clk_count_tx[8]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \clk_count_tx1_carry__2_n_0\,
      I1 => clk_count_tx_reg(10),
      O => \clk_count_tx[8]_i_3_n_0\
    );
\clk_count_tx[8]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \clk_count_tx1_carry__2_n_0\,
      I1 => clk_count_tx_reg(9),
      O => \clk_count_tx[8]_i_4_n_0\
    );
\clk_count_tx[8]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \clk_count_tx1_carry__2_n_0\,
      I1 => clk_count_tx_reg(8),
      O => \clk_count_tx[8]_i_5_n_0\
    );
\clk_count_tx_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => '1',
      D => \clk_count_tx_reg[0]_i_1_n_7\,
      Q => clk_count_tx_reg(0),
      R => tdone0
    );
\clk_count_tx_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \clk_count_tx_reg[0]_i_1_n_0\,
      CO(2) => \clk_count_tx_reg[0]_i_1_n_1\,
      CO(1) => \clk_count_tx_reg[0]_i_1_n_2\,
      CO(0) => \clk_count_tx_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => \clk_count_tx1_carry__2_n_0\,
      O(3) => \clk_count_tx_reg[0]_i_1_n_4\,
      O(2) => \clk_count_tx_reg[0]_i_1_n_5\,
      O(1) => \clk_count_tx_reg[0]_i_1_n_6\,
      O(0) => \clk_count_tx_reg[0]_i_1_n_7\,
      S(3) => \clk_count_tx[0]_i_2_n_0\,
      S(2) => \clk_count_tx[0]_i_3_n_0\,
      S(1) => \clk_count_tx[0]_i_4_n_0\,
      S(0) => \clk_count_tx[0]_i_5_n_0\
    );
\clk_count_tx_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => '1',
      D => \clk_count_tx_reg[8]_i_1_n_5\,
      Q => clk_count_tx_reg(10),
      R => tdone0
    );
\clk_count_tx_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => '1',
      D => \clk_count_tx_reg[8]_i_1_n_4\,
      Q => clk_count_tx_reg(11),
      R => tdone0
    );
\clk_count_tx_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => '1',
      D => \clk_count_tx_reg[12]_i_1_n_7\,
      Q => clk_count_tx_reg(12),
      R => tdone0
    );
\clk_count_tx_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \clk_count_tx_reg[8]_i_1_n_0\,
      CO(3) => \clk_count_tx_reg[12]_i_1_n_0\,
      CO(2) => \clk_count_tx_reg[12]_i_1_n_1\,
      CO(1) => \clk_count_tx_reg[12]_i_1_n_2\,
      CO(0) => \clk_count_tx_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \clk_count_tx_reg[12]_i_1_n_4\,
      O(2) => \clk_count_tx_reg[12]_i_1_n_5\,
      O(1) => \clk_count_tx_reg[12]_i_1_n_6\,
      O(0) => \clk_count_tx_reg[12]_i_1_n_7\,
      S(3) => \clk_count_tx[12]_i_2_n_0\,
      S(2) => \clk_count_tx[12]_i_3_n_0\,
      S(1) => \clk_count_tx[12]_i_4_n_0\,
      S(0) => \clk_count_tx[12]_i_5_n_0\
    );
\clk_count_tx_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => '1',
      D => \clk_count_tx_reg[12]_i_1_n_6\,
      Q => clk_count_tx_reg(13),
      R => tdone0
    );
\clk_count_tx_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => '1',
      D => \clk_count_tx_reg[12]_i_1_n_5\,
      Q => clk_count_tx_reg(14),
      R => tdone0
    );
\clk_count_tx_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => '1',
      D => \clk_count_tx_reg[12]_i_1_n_4\,
      Q => clk_count_tx_reg(15),
      R => tdone0
    );
\clk_count_tx_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => '1',
      D => \clk_count_tx_reg[16]_i_1_n_7\,
      Q => clk_count_tx_reg(16),
      R => tdone0
    );
\clk_count_tx_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \clk_count_tx_reg[12]_i_1_n_0\,
      CO(3) => \clk_count_tx_reg[16]_i_1_n_0\,
      CO(2) => \clk_count_tx_reg[16]_i_1_n_1\,
      CO(1) => \clk_count_tx_reg[16]_i_1_n_2\,
      CO(0) => \clk_count_tx_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \clk_count_tx_reg[16]_i_1_n_4\,
      O(2) => \clk_count_tx_reg[16]_i_1_n_5\,
      O(1) => \clk_count_tx_reg[16]_i_1_n_6\,
      O(0) => \clk_count_tx_reg[16]_i_1_n_7\,
      S(3) => \clk_count_tx[16]_i_2_n_0\,
      S(2) => \clk_count_tx[16]_i_3_n_0\,
      S(1) => \clk_count_tx[16]_i_4_n_0\,
      S(0) => \clk_count_tx[16]_i_5_n_0\
    );
\clk_count_tx_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => '1',
      D => \clk_count_tx_reg[16]_i_1_n_6\,
      Q => clk_count_tx_reg(17),
      R => tdone0
    );
\clk_count_tx_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => '1',
      D => \clk_count_tx_reg[16]_i_1_n_5\,
      Q => clk_count_tx_reg(18),
      R => tdone0
    );
\clk_count_tx_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => '1',
      D => \clk_count_tx_reg[16]_i_1_n_4\,
      Q => clk_count_tx_reg(19),
      R => tdone0
    );
\clk_count_tx_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => '1',
      D => \clk_count_tx_reg[0]_i_1_n_6\,
      Q => clk_count_tx_reg(1),
      R => tdone0
    );
\clk_count_tx_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => '1',
      D => \clk_count_tx_reg[20]_i_1_n_7\,
      Q => clk_count_tx_reg(20),
      R => tdone0
    );
\clk_count_tx_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \clk_count_tx_reg[16]_i_1_n_0\,
      CO(3) => \clk_count_tx_reg[20]_i_1_n_0\,
      CO(2) => \clk_count_tx_reg[20]_i_1_n_1\,
      CO(1) => \clk_count_tx_reg[20]_i_1_n_2\,
      CO(0) => \clk_count_tx_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \clk_count_tx_reg[20]_i_1_n_4\,
      O(2) => \clk_count_tx_reg[20]_i_1_n_5\,
      O(1) => \clk_count_tx_reg[20]_i_1_n_6\,
      O(0) => \clk_count_tx_reg[20]_i_1_n_7\,
      S(3) => \clk_count_tx[20]_i_2_n_0\,
      S(2) => \clk_count_tx[20]_i_3_n_0\,
      S(1) => \clk_count_tx[20]_i_4_n_0\,
      S(0) => \clk_count_tx[20]_i_5_n_0\
    );
\clk_count_tx_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => '1',
      D => \clk_count_tx_reg[20]_i_1_n_6\,
      Q => clk_count_tx_reg(21),
      R => tdone0
    );
\clk_count_tx_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => '1',
      D => \clk_count_tx_reg[20]_i_1_n_5\,
      Q => clk_count_tx_reg(22),
      R => tdone0
    );
\clk_count_tx_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => '1',
      D => \clk_count_tx_reg[20]_i_1_n_4\,
      Q => clk_count_tx_reg(23),
      R => tdone0
    );
\clk_count_tx_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => '1',
      D => \clk_count_tx_reg[24]_i_1_n_7\,
      Q => clk_count_tx_reg(24),
      R => tdone0
    );
\clk_count_tx_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \clk_count_tx_reg[20]_i_1_n_0\,
      CO(3) => \clk_count_tx_reg[24]_i_1_n_0\,
      CO(2) => \clk_count_tx_reg[24]_i_1_n_1\,
      CO(1) => \clk_count_tx_reg[24]_i_1_n_2\,
      CO(0) => \clk_count_tx_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \clk_count_tx_reg[24]_i_1_n_4\,
      O(2) => \clk_count_tx_reg[24]_i_1_n_5\,
      O(1) => \clk_count_tx_reg[24]_i_1_n_6\,
      O(0) => \clk_count_tx_reg[24]_i_1_n_7\,
      S(3) => \clk_count_tx[24]_i_2_n_0\,
      S(2) => \clk_count_tx[24]_i_3_n_0\,
      S(1) => \clk_count_tx[24]_i_4_n_0\,
      S(0) => \clk_count_tx[24]_i_5_n_0\
    );
\clk_count_tx_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => '1',
      D => \clk_count_tx_reg[24]_i_1_n_6\,
      Q => clk_count_tx_reg(25),
      R => tdone0
    );
\clk_count_tx_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => '1',
      D => \clk_count_tx_reg[24]_i_1_n_5\,
      Q => clk_count_tx_reg(26),
      R => tdone0
    );
\clk_count_tx_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => '1',
      D => \clk_count_tx_reg[24]_i_1_n_4\,
      Q => clk_count_tx_reg(27),
      R => tdone0
    );
\clk_count_tx_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => '1',
      D => \clk_count_tx_reg[28]_i_1_n_7\,
      Q => clk_count_tx_reg(28),
      R => tdone0
    );
\clk_count_tx_reg[28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \clk_count_tx_reg[24]_i_1_n_0\,
      CO(3) => \NLW_clk_count_tx_reg[28]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \clk_count_tx_reg[28]_i_1_n_1\,
      CO(1) => \clk_count_tx_reg[28]_i_1_n_2\,
      CO(0) => \clk_count_tx_reg[28]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \clk_count_tx_reg[28]_i_1_n_4\,
      O(2) => \clk_count_tx_reg[28]_i_1_n_5\,
      O(1) => \clk_count_tx_reg[28]_i_1_n_6\,
      O(0) => \clk_count_tx_reg[28]_i_1_n_7\,
      S(3) => \clk_count_tx[28]_i_2_n_0\,
      S(2) => \clk_count_tx[28]_i_3_n_0\,
      S(1) => \clk_count_tx[28]_i_4_n_0\,
      S(0) => \clk_count_tx[28]_i_5_n_0\
    );
\clk_count_tx_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => '1',
      D => \clk_count_tx_reg[28]_i_1_n_6\,
      Q => clk_count_tx_reg(29),
      R => tdone0
    );
\clk_count_tx_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => '1',
      D => \clk_count_tx_reg[0]_i_1_n_5\,
      Q => clk_count_tx_reg(2),
      R => tdone0
    );
\clk_count_tx_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => '1',
      D => \clk_count_tx_reg[28]_i_1_n_5\,
      Q => clk_count_tx_reg(30),
      R => tdone0
    );
\clk_count_tx_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => '1',
      D => \clk_count_tx_reg[28]_i_1_n_4\,
      Q => clk_count_tx_reg(31),
      R => tdone0
    );
\clk_count_tx_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => '1',
      D => \clk_count_tx_reg[0]_i_1_n_4\,
      Q => clk_count_tx_reg(3),
      R => tdone0
    );
\clk_count_tx_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => '1',
      D => \clk_count_tx_reg[4]_i_1_n_7\,
      Q => clk_count_tx_reg(4),
      R => tdone0
    );
\clk_count_tx_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \clk_count_tx_reg[0]_i_1_n_0\,
      CO(3) => \clk_count_tx_reg[4]_i_1_n_0\,
      CO(2) => \clk_count_tx_reg[4]_i_1_n_1\,
      CO(1) => \clk_count_tx_reg[4]_i_1_n_2\,
      CO(0) => \clk_count_tx_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \clk_count_tx_reg[4]_i_1_n_4\,
      O(2) => \clk_count_tx_reg[4]_i_1_n_5\,
      O(1) => \clk_count_tx_reg[4]_i_1_n_6\,
      O(0) => \clk_count_tx_reg[4]_i_1_n_7\,
      S(3) => \clk_count_tx[4]_i_2_n_0\,
      S(2) => \clk_count_tx[4]_i_3_n_0\,
      S(1) => \clk_count_tx[4]_i_4_n_0\,
      S(0) => \clk_count_tx[4]_i_5_n_0\
    );
\clk_count_tx_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => '1',
      D => \clk_count_tx_reg[4]_i_1_n_6\,
      Q => clk_count_tx_reg(5),
      R => tdone0
    );
\clk_count_tx_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => '1',
      D => \clk_count_tx_reg[4]_i_1_n_5\,
      Q => clk_count_tx_reg(6),
      R => tdone0
    );
\clk_count_tx_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => '1',
      D => \clk_count_tx_reg[4]_i_1_n_4\,
      Q => clk_count_tx_reg(7),
      R => tdone0
    );
\clk_count_tx_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => '1',
      D => \clk_count_tx_reg[8]_i_1_n_7\,
      Q => clk_count_tx_reg(8),
      R => tdone0
    );
\clk_count_tx_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \clk_count_tx_reg[4]_i_1_n_0\,
      CO(3) => \clk_count_tx_reg[8]_i_1_n_0\,
      CO(2) => \clk_count_tx_reg[8]_i_1_n_1\,
      CO(1) => \clk_count_tx_reg[8]_i_1_n_2\,
      CO(0) => \clk_count_tx_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \clk_count_tx_reg[8]_i_1_n_4\,
      O(2) => \clk_count_tx_reg[8]_i_1_n_5\,
      O(1) => \clk_count_tx_reg[8]_i_1_n_6\,
      O(0) => \clk_count_tx_reg[8]_i_1_n_7\,
      S(3) => \clk_count_tx[8]_i_2_n_0\,
      S(2) => \clk_count_tx[8]_i_3_n_0\,
      S(1) => \clk_count_tx[8]_i_4_n_0\,
      S(0) => \clk_count_tx[8]_i_5_n_0\
    );
\clk_count_tx_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => tclock,
      CE => '1',
      D => \clk_count_tx_reg[8]_i_1_n_6\,
      Q => clk_count_tx_reg(9),
      R => tdone0
    );
tdone_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => state_tx(0),
      I1 => state_tx(1),
      O => tdone0
    );
tdone_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF20"
    )
        port map (
      I0 => state_tx(0),
      I1 => \clk_count_tx1_carry__2_n_0\,
      I2 => state_tx(1),
      I3 => \^tdone\,
      O => tdone_i_2_n_0
    );
tdone_reg: unisim.vcomponents.FDRE
     port map (
      C => tclock,
      CE => '1',
      D => tdone_i_2_n_0,
      Q => \^tdone\,
      R => tdone0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_uart_tx_0_0 is
  port (
    tclock : in STD_LOGIC;
    tenable : in STD_LOGIC;
    tdin : in STD_LOGIC_VECTOR ( 7 downto 0 );
    tdone : out STD_LOGIC;
    TX : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_uart_tx_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_uart_tx_0_0 : entity is "design_1_uart_tx_0_0,uart_tx,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_uart_tx_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_uart_tx_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_uart_tx_0_0 : entity is "uart_tx,Vivado 2022.2";
end design_1_uart_tx_0_0;

architecture STRUCTURE of design_1_uart_tx_0_0 is
begin
inst: entity work.design_1_uart_tx_0_0_uart_tx
     port map (
      TX => TX,
      tclock => tclock,
      tdin(7 downto 0) => tdin(7 downto 0),
      tdone => tdone,
      tenable => tenable
    );
end STRUCTURE;
