-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
-- Date        : Fri Jan 23 12:08:45 2026
-- Host        : DESKTOP-518F4EG running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               d:/Xilinx/Xlinx_project/test_uart_23-1/test_uart_23-1.gen/sources_1/bd/design_1/ip/design_1_uart_rx_0_0/design_1_uart_rx_0_0_sim_netlist.vhdl
-- Design      : design_1_uart_rx_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_uart_rx_0_0_uart_rx is
  port (
    o_data_byte : out STD_LOGIC_VECTOR ( 7 downto 0 );
    o_data_avail : out STD_LOGIC;
    i_rx : in STD_LOGIC;
    clock : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_uart_rx_0_0_uart_rx : entity is "uart_rx";
end design_1_uart_rx_0_0_uart_rx;

architecture STRUCTURE of design_1_uart_rx_0_0_uart_rx is
  signal \bit_index[0]_i_1_n_0\ : STD_LOGIC;
  signal \bit_index[1]_i_1_n_0\ : STD_LOGIC;
  signal \bit_index[2]_i_1_n_0\ : STD_LOGIC;
  signal \bit_index_reg_n_0_[0]\ : STD_LOGIC;
  signal \bit_index_reg_n_0_[1]\ : STD_LOGIC;
  signal \bit_index_reg_n_0_[2]\ : STD_LOGIC;
  signal \counter0_carry__0_n_0\ : STD_LOGIC;
  signal \counter0_carry__0_n_1\ : STD_LOGIC;
  signal \counter0_carry__0_n_2\ : STD_LOGIC;
  signal \counter0_carry__0_n_3\ : STD_LOGIC;
  signal \counter0_carry__0_n_4\ : STD_LOGIC;
  signal \counter0_carry__0_n_5\ : STD_LOGIC;
  signal \counter0_carry__0_n_6\ : STD_LOGIC;
  signal \counter0_carry__0_n_7\ : STD_LOGIC;
  signal \counter0_carry__1_n_0\ : STD_LOGIC;
  signal \counter0_carry__1_n_1\ : STD_LOGIC;
  signal \counter0_carry__1_n_2\ : STD_LOGIC;
  signal \counter0_carry__1_n_3\ : STD_LOGIC;
  signal \counter0_carry__1_n_4\ : STD_LOGIC;
  signal \counter0_carry__1_n_5\ : STD_LOGIC;
  signal \counter0_carry__1_n_6\ : STD_LOGIC;
  signal \counter0_carry__1_n_7\ : STD_LOGIC;
  signal \counter0_carry__2_n_2\ : STD_LOGIC;
  signal \counter0_carry__2_n_3\ : STD_LOGIC;
  signal \counter0_carry__2_n_5\ : STD_LOGIC;
  signal \counter0_carry__2_n_6\ : STD_LOGIC;
  signal \counter0_carry__2_n_7\ : STD_LOGIC;
  signal counter0_carry_n_0 : STD_LOGIC;
  signal counter0_carry_n_1 : STD_LOGIC;
  signal counter0_carry_n_2 : STD_LOGIC;
  signal counter0_carry_n_3 : STD_LOGIC;
  signal counter0_carry_n_4 : STD_LOGIC;
  signal counter0_carry_n_5 : STD_LOGIC;
  signal counter0_carry_n_6 : STD_LOGIC;
  signal counter0_carry_n_7 : STD_LOGIC;
  signal \counter[0]_i_1_n_0\ : STD_LOGIC;
  signal \counter[10]_i_1_n_0\ : STD_LOGIC;
  signal \counter[11]_i_1_n_0\ : STD_LOGIC;
  signal \counter[12]_i_1_n_0\ : STD_LOGIC;
  signal \counter[13]_i_1_n_0\ : STD_LOGIC;
  signal \counter[14]_i_1_n_0\ : STD_LOGIC;
  signal \counter[15]_i_1_n_0\ : STD_LOGIC;
  signal \counter[15]_i_2_n_0\ : STD_LOGIC;
  signal \counter[1]_i_1_n_0\ : STD_LOGIC;
  signal \counter[2]_i_1_n_0\ : STD_LOGIC;
  signal \counter[3]_i_1_n_0\ : STD_LOGIC;
  signal \counter[4]_i_1_n_0\ : STD_LOGIC;
  signal \counter[5]_i_1_n_0\ : STD_LOGIC;
  signal \counter[6]_i_1_n_0\ : STD_LOGIC;
  signal \counter[7]_i_1_n_0\ : STD_LOGIC;
  signal \counter[8]_i_1_n_0\ : STD_LOGIC;
  signal \counter[9]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg_n_0_[0]\ : STD_LOGIC;
  signal \counter_reg_n_0_[10]\ : STD_LOGIC;
  signal \counter_reg_n_0_[11]\ : STD_LOGIC;
  signal \counter_reg_n_0_[12]\ : STD_LOGIC;
  signal \counter_reg_n_0_[13]\ : STD_LOGIC;
  signal \counter_reg_n_0_[14]\ : STD_LOGIC;
  signal \counter_reg_n_0_[15]\ : STD_LOGIC;
  signal \counter_reg_n_0_[1]\ : STD_LOGIC;
  signal \counter_reg_n_0_[2]\ : STD_LOGIC;
  signal \counter_reg_n_0_[3]\ : STD_LOGIC;
  signal \counter_reg_n_0_[4]\ : STD_LOGIC;
  signal \counter_reg_n_0_[5]\ : STD_LOGIC;
  signal \counter_reg_n_0_[6]\ : STD_LOGIC;
  signal \counter_reg_n_0_[7]\ : STD_LOGIC;
  signal \counter_reg_n_0_[8]\ : STD_LOGIC;
  signal \counter_reg_n_0_[9]\ : STD_LOGIC;
  signal data_avail_i_1_n_0 : STD_LOGIC;
  signal data_avail_i_2_n_0 : STD_LOGIC;
  signal data_avail_i_3_n_0 : STD_LOGIC;
  signal data_avail_i_4_n_0 : STD_LOGIC;
  signal data_avail_i_5_n_0 : STD_LOGIC;
  signal \data_byte[0]_i_1_n_0\ : STD_LOGIC;
  signal \data_byte[1]_i_1_n_0\ : STD_LOGIC;
  signal \data_byte[2]_i_1_n_0\ : STD_LOGIC;
  signal \data_byte[3]_i_1_n_0\ : STD_LOGIC;
  signal \data_byte[4]_i_1_n_0\ : STD_LOGIC;
  signal \data_byte[4]_i_2_n_0\ : STD_LOGIC;
  signal \data_byte[5]_i_1_n_0\ : STD_LOGIC;
  signal \data_byte[5]_i_2_n_0\ : STD_LOGIC;
  signal \data_byte[6]_i_1_n_0\ : STD_LOGIC;
  signal \data_byte[6]_i_2_n_0\ : STD_LOGIC;
  signal \data_byte[7]_i_1_n_0\ : STD_LOGIC;
  signal \data_byte[7]_i_2_n_0\ : STD_LOGIC;
  signal \data_byte[7]_i_3_n_0\ : STD_LOGIC;
  signal \data_byte[7]_i_4_n_0\ : STD_LOGIC;
  signal \data_byte[7]_i_5_n_0\ : STD_LOGIC;
  signal \^o_data_avail\ : STD_LOGIC;
  signal \^o_data_byte\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal rx : STD_LOGIC;
  signal rx_buffer : STD_LOGIC;
  signal \state[0]_i_1_n_0\ : STD_LOGIC;
  signal \state[0]_i_2_n_0\ : STD_LOGIC;
  signal \state[1]_i_1_n_0\ : STD_LOGIC;
  signal \state[1]_i_2_n_0\ : STD_LOGIC;
  signal \state[1]_i_3_n_0\ : STD_LOGIC;
  signal \state[1]_i_4_n_0\ : STD_LOGIC;
  signal \state_reg_n_0_[0]\ : STD_LOGIC;
  signal \state_reg_n_0_[1]\ : STD_LOGIC;
  signal \NLW_counter0_carry__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_counter0_carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \bit_index[0]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \bit_index[1]_i_1\ : label is "soft_lutpair0";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of counter0_carry : label is 35;
  attribute ADDER_THRESHOLD of \counter0_carry__0\ : label is 35;
  attribute ADDER_THRESHOLD of \counter0_carry__1\ : label is 35;
  attribute ADDER_THRESHOLD of \counter0_carry__2\ : label is 35;
  attribute SOFT_HLUTNM of data_avail_i_4 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \data_byte[5]_i_2\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \data_byte[6]_i_2\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \data_byte[7]_i_2\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \data_byte[7]_i_3\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \state[0]_i_2\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \state[1]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \state[1]_i_4\ : label is "soft_lutpair2";
begin
  o_data_avail <= \^o_data_avail\;
  o_data_byte(7 downto 0) <= \^o_data_byte\(7 downto 0);
\bit_index[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6660"
    )
        port map (
      I0 => \bit_index_reg_n_0_[0]\,
      I1 => \data_byte[7]_i_4_n_0\,
      I2 => \state_reg_n_0_[0]\,
      I3 => \state_reg_n_0_[1]\,
      O => \bit_index[0]_i_1_n_0\
    );
\bit_index[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6A6A6A00"
    )
        port map (
      I0 => \bit_index_reg_n_0_[1]\,
      I1 => \data_byte[7]_i_4_n_0\,
      I2 => \bit_index_reg_n_0_[0]\,
      I3 => \state_reg_n_0_[0]\,
      I4 => \state_reg_n_0_[1]\,
      O => \bit_index[1]_i_1_n_0\
    );
\bit_index[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAA6AAA6AAA0000"
    )
        port map (
      I0 => \bit_index_reg_n_0_[2]\,
      I1 => \data_byte[7]_i_4_n_0\,
      I2 => \bit_index_reg_n_0_[0]\,
      I3 => \bit_index_reg_n_0_[1]\,
      I4 => \state_reg_n_0_[0]\,
      I5 => \state_reg_n_0_[1]\,
      O => \bit_index[2]_i_1_n_0\
    );
\bit_index_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clock,
      CE => '1',
      D => \bit_index[0]_i_1_n_0\,
      Q => \bit_index_reg_n_0_[0]\,
      R => '0'
    );
\bit_index_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clock,
      CE => '1',
      D => \bit_index[1]_i_1_n_0\,
      Q => \bit_index_reg_n_0_[1]\,
      R => '0'
    );
\bit_index_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clock,
      CE => '1',
      D => \bit_index[2]_i_1_n_0\,
      Q => \bit_index_reg_n_0_[2]\,
      R => '0'
    );
counter0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => counter0_carry_n_0,
      CO(2) => counter0_carry_n_1,
      CO(1) => counter0_carry_n_2,
      CO(0) => counter0_carry_n_3,
      CYINIT => \counter_reg_n_0_[0]\,
      DI(3 downto 0) => B"0000",
      O(3) => counter0_carry_n_4,
      O(2) => counter0_carry_n_5,
      O(1) => counter0_carry_n_6,
      O(0) => counter0_carry_n_7,
      S(3) => \counter_reg_n_0_[4]\,
      S(2) => \counter_reg_n_0_[3]\,
      S(1) => \counter_reg_n_0_[2]\,
      S(0) => \counter_reg_n_0_[1]\
    );
\counter0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => counter0_carry_n_0,
      CO(3) => \counter0_carry__0_n_0\,
      CO(2) => \counter0_carry__0_n_1\,
      CO(1) => \counter0_carry__0_n_2\,
      CO(0) => \counter0_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter0_carry__0_n_4\,
      O(2) => \counter0_carry__0_n_5\,
      O(1) => \counter0_carry__0_n_6\,
      O(0) => \counter0_carry__0_n_7\,
      S(3) => \counter_reg_n_0_[8]\,
      S(2) => \counter_reg_n_0_[7]\,
      S(1) => \counter_reg_n_0_[6]\,
      S(0) => \counter_reg_n_0_[5]\
    );
\counter0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter0_carry__0_n_0\,
      CO(3) => \counter0_carry__1_n_0\,
      CO(2) => \counter0_carry__1_n_1\,
      CO(1) => \counter0_carry__1_n_2\,
      CO(0) => \counter0_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter0_carry__1_n_4\,
      O(2) => \counter0_carry__1_n_5\,
      O(1) => \counter0_carry__1_n_6\,
      O(0) => \counter0_carry__1_n_7\,
      S(3) => \counter_reg_n_0_[12]\,
      S(2) => \counter_reg_n_0_[11]\,
      S(1) => \counter_reg_n_0_[10]\,
      S(0) => \counter_reg_n_0_[9]\
    );
\counter0_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter0_carry__1_n_0\,
      CO(3 downto 2) => \NLW_counter0_carry__2_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \counter0_carry__2_n_2\,
      CO(0) => \counter0_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_counter0_carry__2_O_UNCONNECTED\(3),
      O(2) => \counter0_carry__2_n_5\,
      O(1) => \counter0_carry__2_n_6\,
      O(0) => \counter0_carry__2_n_7\,
      S(3) => '0',
      S(2) => \counter_reg_n_0_[15]\,
      S(1) => \counter_reg_n_0_[14]\,
      S(0) => \counter_reg_n_0_[13]\
    );
\counter[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00405540"
    )
        port map (
      I0 => \counter_reg_n_0_[0]\,
      I1 => \state[1]_i_2_n_0\,
      I2 => \state_reg_n_0_[0]\,
      I3 => \state_reg_n_0_[1]\,
      I4 => data_avail_i_2_n_0,
      O => \counter[0]_i_1_n_0\
    );
\counter[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0080AA80"
    )
        port map (
      I0 => \counter0_carry__1_n_6\,
      I1 => \state[1]_i_2_n_0\,
      I2 => \state_reg_n_0_[0]\,
      I3 => \state_reg_n_0_[1]\,
      I4 => data_avail_i_2_n_0,
      O => \counter[10]_i_1_n_0\
    );
\counter[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0080AA80"
    )
        port map (
      I0 => \counter0_carry__1_n_5\,
      I1 => \state[1]_i_2_n_0\,
      I2 => \state_reg_n_0_[0]\,
      I3 => \state_reg_n_0_[1]\,
      I4 => data_avail_i_2_n_0,
      O => \counter[11]_i_1_n_0\
    );
\counter[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0080AA80"
    )
        port map (
      I0 => \counter0_carry__1_n_4\,
      I1 => \state[1]_i_2_n_0\,
      I2 => \state_reg_n_0_[0]\,
      I3 => \state_reg_n_0_[1]\,
      I4 => data_avail_i_2_n_0,
      O => \counter[12]_i_1_n_0\
    );
\counter[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0080AA80"
    )
        port map (
      I0 => \counter0_carry__2_n_7\,
      I1 => \state[1]_i_2_n_0\,
      I2 => \state_reg_n_0_[0]\,
      I3 => \state_reg_n_0_[1]\,
      I4 => data_avail_i_2_n_0,
      O => \counter[13]_i_1_n_0\
    );
\counter[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0080AA80"
    )
        port map (
      I0 => \counter0_carry__2_n_6\,
      I1 => \state[1]_i_2_n_0\,
      I2 => \state_reg_n_0_[0]\,
      I3 => \state_reg_n_0_[1]\,
      I4 => data_avail_i_2_n_0,
      O => \counter[14]_i_1_n_0\
    );
\counter[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FBFF"
    )
        port map (
      I0 => \state[1]_i_2_n_0\,
      I1 => rx,
      I2 => \state_reg_n_0_[1]\,
      I3 => \state_reg_n_0_[0]\,
      O => \counter[15]_i_1_n_0\
    );
\counter[15]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0080AA80"
    )
        port map (
      I0 => \counter0_carry__2_n_5\,
      I1 => \state[1]_i_2_n_0\,
      I2 => \state_reg_n_0_[0]\,
      I3 => \state_reg_n_0_[1]\,
      I4 => data_avail_i_2_n_0,
      O => \counter[15]_i_2_n_0\
    );
\counter[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0080AA80"
    )
        port map (
      I0 => counter0_carry_n_7,
      I1 => \state[1]_i_2_n_0\,
      I2 => \state_reg_n_0_[0]\,
      I3 => \state_reg_n_0_[1]\,
      I4 => data_avail_i_2_n_0,
      O => \counter[1]_i_1_n_0\
    );
\counter[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0080AA80"
    )
        port map (
      I0 => counter0_carry_n_6,
      I1 => \state[1]_i_2_n_0\,
      I2 => \state_reg_n_0_[0]\,
      I3 => \state_reg_n_0_[1]\,
      I4 => data_avail_i_2_n_0,
      O => \counter[2]_i_1_n_0\
    );
\counter[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0080AA80"
    )
        port map (
      I0 => counter0_carry_n_5,
      I1 => \state[1]_i_2_n_0\,
      I2 => \state_reg_n_0_[0]\,
      I3 => \state_reg_n_0_[1]\,
      I4 => data_avail_i_2_n_0,
      O => \counter[3]_i_1_n_0\
    );
\counter[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0080AA80"
    )
        port map (
      I0 => counter0_carry_n_4,
      I1 => \state[1]_i_2_n_0\,
      I2 => \state_reg_n_0_[0]\,
      I3 => \state_reg_n_0_[1]\,
      I4 => data_avail_i_2_n_0,
      O => \counter[4]_i_1_n_0\
    );
\counter[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0080AA80"
    )
        port map (
      I0 => \counter0_carry__0_n_7\,
      I1 => \state[1]_i_2_n_0\,
      I2 => \state_reg_n_0_[0]\,
      I3 => \state_reg_n_0_[1]\,
      I4 => data_avail_i_2_n_0,
      O => \counter[5]_i_1_n_0\
    );
\counter[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0080AA80"
    )
        port map (
      I0 => \counter0_carry__0_n_6\,
      I1 => \state[1]_i_2_n_0\,
      I2 => \state_reg_n_0_[0]\,
      I3 => \state_reg_n_0_[1]\,
      I4 => data_avail_i_2_n_0,
      O => \counter[6]_i_1_n_0\
    );
\counter[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0080AA80"
    )
        port map (
      I0 => \counter0_carry__0_n_5\,
      I1 => \state[1]_i_2_n_0\,
      I2 => \state_reg_n_0_[0]\,
      I3 => \state_reg_n_0_[1]\,
      I4 => data_avail_i_2_n_0,
      O => \counter[7]_i_1_n_0\
    );
\counter[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0080AA80"
    )
        port map (
      I0 => \counter0_carry__0_n_4\,
      I1 => \state[1]_i_2_n_0\,
      I2 => \state_reg_n_0_[0]\,
      I3 => \state_reg_n_0_[1]\,
      I4 => data_avail_i_2_n_0,
      O => \counter[8]_i_1_n_0\
    );
\counter[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0080AA80"
    )
        port map (
      I0 => \counter0_carry__1_n_7\,
      I1 => \state[1]_i_2_n_0\,
      I2 => \state_reg_n_0_[0]\,
      I3 => \state_reg_n_0_[1]\,
      I4 => data_avail_i_2_n_0,
      O => \counter[9]_i_1_n_0\
    );
\counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clock,
      CE => \counter[15]_i_1_n_0\,
      D => \counter[0]_i_1_n_0\,
      Q => \counter_reg_n_0_[0]\,
      R => '0'
    );
\counter_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clock,
      CE => \counter[15]_i_1_n_0\,
      D => \counter[10]_i_1_n_0\,
      Q => \counter_reg_n_0_[10]\,
      R => '0'
    );
\counter_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clock,
      CE => \counter[15]_i_1_n_0\,
      D => \counter[11]_i_1_n_0\,
      Q => \counter_reg_n_0_[11]\,
      R => '0'
    );
\counter_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clock,
      CE => \counter[15]_i_1_n_0\,
      D => \counter[12]_i_1_n_0\,
      Q => \counter_reg_n_0_[12]\,
      R => '0'
    );
\counter_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clock,
      CE => \counter[15]_i_1_n_0\,
      D => \counter[13]_i_1_n_0\,
      Q => \counter_reg_n_0_[13]\,
      R => '0'
    );
\counter_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clock,
      CE => \counter[15]_i_1_n_0\,
      D => \counter[14]_i_1_n_0\,
      Q => \counter_reg_n_0_[14]\,
      R => '0'
    );
\counter_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clock,
      CE => \counter[15]_i_1_n_0\,
      D => \counter[15]_i_2_n_0\,
      Q => \counter_reg_n_0_[15]\,
      R => '0'
    );
\counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clock,
      CE => \counter[15]_i_1_n_0\,
      D => \counter[1]_i_1_n_0\,
      Q => \counter_reg_n_0_[1]\,
      R => '0'
    );
\counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clock,
      CE => \counter[15]_i_1_n_0\,
      D => \counter[2]_i_1_n_0\,
      Q => \counter_reg_n_0_[2]\,
      R => '0'
    );
\counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clock,
      CE => \counter[15]_i_1_n_0\,
      D => \counter[3]_i_1_n_0\,
      Q => \counter_reg_n_0_[3]\,
      R => '0'
    );
\counter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clock,
      CE => \counter[15]_i_1_n_0\,
      D => \counter[4]_i_1_n_0\,
      Q => \counter_reg_n_0_[4]\,
      R => '0'
    );
\counter_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clock,
      CE => \counter[15]_i_1_n_0\,
      D => \counter[5]_i_1_n_0\,
      Q => \counter_reg_n_0_[5]\,
      R => '0'
    );
\counter_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clock,
      CE => \counter[15]_i_1_n_0\,
      D => \counter[6]_i_1_n_0\,
      Q => \counter_reg_n_0_[6]\,
      R => '0'
    );
\counter_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clock,
      CE => \counter[15]_i_1_n_0\,
      D => \counter[7]_i_1_n_0\,
      Q => \counter_reg_n_0_[7]\,
      R => '0'
    );
\counter_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clock,
      CE => \counter[15]_i_1_n_0\,
      D => \counter[8]_i_1_n_0\,
      Q => \counter_reg_n_0_[8]\,
      R => '0'
    );
\counter_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clock,
      CE => \counter[15]_i_1_n_0\,
      D => \counter[9]_i_1_n_0\,
      Q => \counter_reg_n_0_[9]\,
      R => '0'
    );
data_avail_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EAA0"
    )
        port map (
      I0 => \^o_data_avail\,
      I1 => data_avail_i_2_n_0,
      I2 => \state_reg_n_0_[0]\,
      I3 => \state_reg_n_0_[1]\,
      O => data_avail_i_1_n_0
    );
data_avail_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFAAEAAAAAAAAA"
    )
        port map (
      I0 => data_avail_i_3_n_0,
      I1 => \counter_reg_n_0_[2]\,
      I2 => \counter_reg_n_0_[5]\,
      I3 => data_avail_i_4_n_0,
      I4 => data_avail_i_5_n_0,
      I5 => \counter_reg_n_0_[10]\,
      O => data_avail_i_2_n_0
    );
data_avail_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \counter_reg_n_0_[11]\,
      I1 => \counter_reg_n_0_[15]\,
      I2 => \counter_reg_n_0_[14]\,
      I3 => \counter_reg_n_0_[13]\,
      I4 => \counter_reg_n_0_[12]\,
      O => data_avail_i_3_n_0
    );
data_avail_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \counter_reg_n_0_[4]\,
      I1 => \counter_reg_n_0_[3]\,
      O => data_avail_i_4_n_0
    );
data_avail_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \counter_reg_n_0_[8]\,
      I1 => \counter_reg_n_0_[7]\,
      I2 => \counter_reg_n_0_[9]\,
      I3 => \counter_reg_n_0_[6]\,
      O => data_avail_i_5_n_0
    );
data_avail_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clock,
      CE => '1',
      D => data_avail_i_1_n_0,
      Q => \^o_data_avail\,
      R => '0'
    );
\data_byte[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBABBBB888A8888"
    )
        port map (
      I0 => rx,
      I1 => \data_byte[7]_i_2_n_0\,
      I2 => \bit_index_reg_n_0_[2]\,
      I3 => \data_byte[4]_i_2_n_0\,
      I4 => \data_byte[7]_i_4_n_0\,
      I5 => \^o_data_byte\(0),
      O => \data_byte[0]_i_1_n_0\
    );
\data_byte[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBABBBB888A8888"
    )
        port map (
      I0 => rx,
      I1 => \data_byte[7]_i_2_n_0\,
      I2 => \bit_index_reg_n_0_[2]\,
      I3 => \data_byte[5]_i_2_n_0\,
      I4 => \data_byte[7]_i_4_n_0\,
      I5 => \^o_data_byte\(1),
      O => \data_byte[1]_i_1_n_0\
    );
\data_byte[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBABBBB888A8888"
    )
        port map (
      I0 => rx,
      I1 => \data_byte[7]_i_2_n_0\,
      I2 => \bit_index_reg_n_0_[2]\,
      I3 => \data_byte[6]_i_2_n_0\,
      I4 => \data_byte[7]_i_4_n_0\,
      I5 => \^o_data_byte\(2),
      O => \data_byte[2]_i_1_n_0\
    );
\data_byte[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBABBBB888A8888"
    )
        port map (
      I0 => rx,
      I1 => \data_byte[7]_i_2_n_0\,
      I2 => \bit_index_reg_n_0_[2]\,
      I3 => \data_byte[7]_i_3_n_0\,
      I4 => \data_byte[7]_i_4_n_0\,
      I5 => \^o_data_byte\(3),
      O => \data_byte[3]_i_1_n_0\
    );
\data_byte[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BABBBBBB8A888888"
    )
        port map (
      I0 => rx,
      I1 => \data_byte[7]_i_2_n_0\,
      I2 => \data_byte[4]_i_2_n_0\,
      I3 => \bit_index_reg_n_0_[2]\,
      I4 => \data_byte[7]_i_4_n_0\,
      I5 => \^o_data_byte\(4),
      O => \data_byte[4]_i_1_n_0\
    );
\data_byte[4]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \bit_index_reg_n_0_[0]\,
      I1 => \bit_index_reg_n_0_[1]\,
      O => \data_byte[4]_i_2_n_0\
    );
\data_byte[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BABBBBBB8A888888"
    )
        port map (
      I0 => rx,
      I1 => \data_byte[7]_i_2_n_0\,
      I2 => \data_byte[5]_i_2_n_0\,
      I3 => \bit_index_reg_n_0_[2]\,
      I4 => \data_byte[7]_i_4_n_0\,
      I5 => \^o_data_byte\(5),
      O => \data_byte[5]_i_1_n_0\
    );
\data_byte[5]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \bit_index_reg_n_0_[1]\,
      I1 => \bit_index_reg_n_0_[0]\,
      O => \data_byte[5]_i_2_n_0\
    );
\data_byte[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BABBBBBB8A888888"
    )
        port map (
      I0 => rx,
      I1 => \data_byte[7]_i_2_n_0\,
      I2 => \data_byte[6]_i_2_n_0\,
      I3 => \bit_index_reg_n_0_[2]\,
      I4 => \data_byte[7]_i_4_n_0\,
      I5 => \^o_data_byte\(6),
      O => \data_byte[6]_i_1_n_0\
    );
\data_byte[6]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \bit_index_reg_n_0_[0]\,
      I1 => \bit_index_reg_n_0_[1]\,
      O => \data_byte[6]_i_2_n_0\
    );
\data_byte[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BABBBBBB8A888888"
    )
        port map (
      I0 => rx,
      I1 => \data_byte[7]_i_2_n_0\,
      I2 => \data_byte[7]_i_3_n_0\,
      I3 => \bit_index_reg_n_0_[2]\,
      I4 => \data_byte[7]_i_4_n_0\,
      I5 => \^o_data_byte\(7),
      O => \data_byte[7]_i_1_n_0\
    );
\data_byte[7]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => \state_reg_n_0_[0]\,
      I1 => \state_reg_n_0_[1]\,
      I2 => rx,
      O => \data_byte[7]_i_2_n_0\
    );
\data_byte[7]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \bit_index_reg_n_0_[0]\,
      I1 => \bit_index_reg_n_0_[1]\,
      O => \data_byte[7]_i_3_n_0\
    );
\data_byte[7]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FF8A0000"
    )
        port map (
      I0 => \counter_reg_n_0_[10]\,
      I1 => data_avail_i_5_n_0,
      I2 => \data_byte[7]_i_5_n_0\,
      I3 => data_avail_i_3_n_0,
      I4 => \state_reg_n_0_[1]\,
      I5 => \state_reg_n_0_[0]\,
      O => \data_byte[7]_i_4_n_0\
    );
\data_byte[7]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \counter_reg_n_0_[3]\,
      I1 => \counter_reg_n_0_[4]\,
      I2 => \counter_reg_n_0_[5]\,
      I3 => \counter_reg_n_0_[2]\,
      O => \data_byte[7]_i_5_n_0\
    );
\data_byte_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clock,
      CE => '1',
      D => \data_byte[0]_i_1_n_0\,
      Q => \^o_data_byte\(0),
      R => '0'
    );
\data_byte_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clock,
      CE => '1',
      D => \data_byte[1]_i_1_n_0\,
      Q => \^o_data_byte\(1),
      R => '0'
    );
\data_byte_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clock,
      CE => '1',
      D => \data_byte[2]_i_1_n_0\,
      Q => \^o_data_byte\(2),
      R => '0'
    );
\data_byte_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clock,
      CE => '1',
      D => \data_byte[3]_i_1_n_0\,
      Q => \^o_data_byte\(3),
      R => '0'
    );
\data_byte_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clock,
      CE => '1',
      D => \data_byte[4]_i_1_n_0\,
      Q => \^o_data_byte\(4),
      R => '0'
    );
\data_byte_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clock,
      CE => '1',
      D => \data_byte[5]_i_1_n_0\,
      Q => \^o_data_byte\(5),
      R => '0'
    );
\data_byte_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clock,
      CE => '1',
      D => \data_byte[6]_i_1_n_0\,
      Q => \^o_data_byte\(6),
      R => '0'
    );
\data_byte_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clock,
      CE => '1',
      D => \data_byte[7]_i_1_n_0\,
      Q => \^o_data_byte\(7),
      R => '0'
    );
rx_buffer_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clock,
      CE => '1',
      D => i_rx,
      Q => rx_buffer,
      R => '0'
    );
rx_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clock,
      CE => '1',
      D => rx_buffer,
      Q => rx,
      R => '0'
    );
\state[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F50FF330F500033"
    )
        port map (
      I0 => \state[0]_i_2_n_0\,
      I1 => rx,
      I2 => data_avail_i_2_n_0,
      I3 => \state_reg_n_0_[0]\,
      I4 => \state_reg_n_0_[1]\,
      I5 => \state[1]_i_2_n_0\,
      O => \state[0]_i_1_n_0\
    );
\state[0]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => \bit_index_reg_n_0_[1]\,
      I1 => \bit_index_reg_n_0_[0]\,
      I2 => \bit_index_reg_n_0_[2]\,
      O => \state[0]_i_2_n_0\
    );
\state[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"50F053F0"
    )
        port map (
      I0 => data_avail_i_2_n_0,
      I1 => \state[1]_i_2_n_0\,
      I2 => \state_reg_n_0_[1]\,
      I3 => \state_reg_n_0_[0]\,
      I4 => rx,
      O => \state[1]_i_1_n_0\
    );
\state[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFFFFFFFFFFFFFF"
    )
        port map (
      I0 => data_avail_i_3_n_0,
      I1 => \state[1]_i_3_n_0\,
      I2 => \state[1]_i_4_n_0\,
      I3 => \counter_reg_n_0_[2]\,
      I4 => \counter_reg_n_0_[9]\,
      I5 => \counter_reg_n_0_[1]\,
      O => \state[1]_i_2_n_0\
    );
\state[1]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \counter_reg_n_0_[5]\,
      I1 => \counter_reg_n_0_[0]\,
      I2 => \counter_reg_n_0_[10]\,
      I3 => \counter_reg_n_0_[6]\,
      O => \state[1]_i_3_n_0\
    );
\state[1]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFF7"
    )
        port map (
      I0 => \counter_reg_n_0_[3]\,
      I1 => \counter_reg_n_0_[4]\,
      I2 => \counter_reg_n_0_[8]\,
      I3 => \counter_reg_n_0_[7]\,
      O => \state[1]_i_4_n_0\
    );
\state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clock,
      CE => '1',
      D => \state[0]_i_1_n_0\,
      Q => \state_reg_n_0_[0]\,
      R => '0'
    );
\state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clock,
      CE => '1',
      D => \state[1]_i_1_n_0\,
      Q => \state_reg_n_0_[1]\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_uart_rx_0_0 is
  port (
    clock : in STD_LOGIC;
    i_rx : in STD_LOGIC;
    o_data_avail : out STD_LOGIC;
    o_data_byte : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_uart_rx_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_uart_rx_0_0 : entity is "design_1_uart_rx_0_0,uart_rx,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_uart_rx_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_uart_rx_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_uart_rx_0_0 : entity is "uart_rx,Vivado 2022.2";
end design_1_uart_rx_0_0;

architecture STRUCTURE of design_1_uart_rx_0_0 is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clock : signal is "xilinx.com:signal:clock:1.0 clock CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clock : signal is "XIL_INTERFACENAME clock, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0";
begin
inst: entity work.design_1_uart_rx_0_0_uart_rx
     port map (
      clock => clock,
      i_rx => i_rx,
      o_data_avail => o_data_avail,
      o_data_byte(7 downto 0) => o_data_byte(7 downto 0)
    );
end STRUCTURE;
