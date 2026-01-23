-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
-- Date        : Fri Jan 23 12:08:45 2026
-- Host        : DESKTOP-518F4EG running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               d:/Xilinx/Xlinx_project/test_uart_23-1/test_uart_23-1.gen/sources_1/bd/design_1/ip/design_1_wrapper_tx_fifo_0_0/design_1_wrapper_tx_fifo_0_0_sim_netlist.vhdl
-- Design      : design_1_wrapper_tx_fifo_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_wrapper_tx_fifo_0_0_wrapper_tx_fifo is
  port (
    tx_tdin : out STD_LOGIC_VECTOR ( 7 downto 0 );
    tx_tenable : out STD_LOGIC;
    fifo_empty : in STD_LOGIC;
    fifo_dout : in STD_LOGIC_VECTOR ( 7 downto 0 );
    clk : in STD_LOGIC;
    rst_n : in STD_LOGIC;
    tx_tdone : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_wrapper_tx_fifo_0_0_wrapper_tx_fifo : entity is "wrapper_tx_fifo";
end design_1_wrapper_tx_fifo_0_0_wrapper_tx_fifo;

architecture STRUCTURE of design_1_wrapper_tx_fifo_0_0_wrapper_tx_fifo is
  signal fifo_rd_en_i_1_n_0 : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal st : STD_LOGIC;
  signal st_i_1_n_0 : STD_LOGIC;
  signal tx_busy : STD_LOGIC;
  signal tx_busy_i_1_n_0 : STD_LOGIC;
  signal \tx_tdin[7]_i_2_n_0\ : STD_LOGIC;
  signal \^tx_tenable\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of fifo_rd_en_i_1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of st_i_1 : label is "soft_lutpair0";
begin
  tx_tenable <= \^tx_tenable\;
fifo_rd_en_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => tx_busy,
      I1 => fifo_empty,
      I2 => rst_n,
      I3 => st,
      O => fifo_rd_en_i_1_n_0
    );
fifo_rd_en_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => fifo_rd_en_i_1_n_0,
      Q => \^tx_tenable\,
      R => '0'
    );
st_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01F10000"
    )
        port map (
      I0 => tx_busy,
      I1 => fifo_empty,
      I2 => st,
      I3 => tx_tdone,
      I4 => rst_n,
      O => st_i_1_n_0
    );
st_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => st_i_1_n_0,
      Q => st,
      R => '0'
    );
tx_busy_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F200"
    )
        port map (
      I0 => tx_busy,
      I1 => tx_tdone,
      I2 => \^tx_tenable\,
      I3 => rst_n,
      O => tx_busy_i_1_n_0
    );
tx_busy_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => tx_busy_i_1_n_0,
      Q => tx_busy,
      R => '0'
    );
\tx_tdin[7]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => rst_n,
      O => p_0_in
    );
\tx_tdin[7]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => tx_busy,
      I1 => fifo_empty,
      I2 => st,
      O => \tx_tdin[7]_i_2_n_0\
    );
\tx_tdin_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \tx_tdin[7]_i_2_n_0\,
      D => fifo_dout(0),
      Q => tx_tdin(0),
      R => p_0_in
    );
\tx_tdin_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \tx_tdin[7]_i_2_n_0\,
      D => fifo_dout(1),
      Q => tx_tdin(1),
      R => p_0_in
    );
\tx_tdin_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \tx_tdin[7]_i_2_n_0\,
      D => fifo_dout(2),
      Q => tx_tdin(2),
      R => p_0_in
    );
\tx_tdin_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \tx_tdin[7]_i_2_n_0\,
      D => fifo_dout(3),
      Q => tx_tdin(3),
      R => p_0_in
    );
\tx_tdin_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \tx_tdin[7]_i_2_n_0\,
      D => fifo_dout(4),
      Q => tx_tdin(4),
      R => p_0_in
    );
\tx_tdin_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \tx_tdin[7]_i_2_n_0\,
      D => fifo_dout(5),
      Q => tx_tdin(5),
      R => p_0_in
    );
\tx_tdin_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \tx_tdin[7]_i_2_n_0\,
      D => fifo_dout(6),
      Q => tx_tdin(6),
      R => p_0_in
    );
\tx_tdin_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \tx_tdin[7]_i_2_n_0\,
      D => fifo_dout(7),
      Q => tx_tdin(7),
      R => p_0_in
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_wrapper_tx_fifo_0_0 is
  port (
    clk : in STD_LOGIC;
    rst_n : in STD_LOGIC;
    fifo_empty : in STD_LOGIC;
    fifo_dout : in STD_LOGIC_VECTOR ( 7 downto 0 );
    fifo_rd_en : out STD_LOGIC;
    tx_tenable : out STD_LOGIC;
    tx_tdin : out STD_LOGIC_VECTOR ( 7 downto 0 );
    tx_tdone : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_wrapper_tx_fifo_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_wrapper_tx_fifo_0_0 : entity is "design_1_wrapper_tx_fifo_0_0,wrapper_tx_fifo,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_wrapper_tx_fifo_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_wrapper_tx_fifo_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_wrapper_tx_fifo_0_0 : entity is "wrapper_tx_fifo,Vivado 2022.2";
end design_1_wrapper_tx_fifo_0_0;

architecture STRUCTURE of design_1_wrapper_tx_fifo_0_0 is
  signal \^tx_tenable\ : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of rst_n : signal is "xilinx.com:signal:reset:1.0 rst_n RST";
  attribute X_INTERFACE_PARAMETER of rst_n : signal is "XIL_INTERFACENAME rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
  fifo_rd_en <= \^tx_tenable\;
  tx_tenable <= \^tx_tenable\;
inst: entity work.design_1_wrapper_tx_fifo_0_0_wrapper_tx_fifo
     port map (
      clk => clk,
      fifo_dout(7 downto 0) => fifo_dout(7 downto 0),
      fifo_empty => fifo_empty,
      rst_n => rst_n,
      tx_tdin(7 downto 0) => tx_tdin(7 downto 0),
      tx_tdone => tx_tdone,
      tx_tenable => \^tx_tenable\
    );
end STRUCTURE;
