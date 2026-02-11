-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
-- Date        : Tue Feb 10 15:43:10 2026
-- Host        : TelemetryK3_07 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               d:/Xlinx/A_project/test10-2/test10-2.gen/sources_1/bd/design_1/ip/design_1_wrapper_rx_fifo_0_0/design_1_wrapper_rx_fifo_0_0_sim_netlist.vhdl
-- Design      : design_1_wrapper_rx_fifo_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_wrapper_rx_fifo_0_0 is
  port (
    rx_avail : in STD_LOGIC;
    data_byte : in STD_LOGIC_VECTOR ( 7 downto 0 );
    full : in STD_LOGIC;
    wr_en : out STD_LOGIC;
    din : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_wrapper_rx_fifo_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_wrapper_rx_fifo_0_0 : entity is "design_1_wrapper_rx_fifo_0_0,wrapper_rx_fifo,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_wrapper_rx_fifo_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_wrapper_rx_fifo_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_wrapper_rx_fifo_0_0 : entity is "wrapper_rx_fifo,Vivado 2022.2";
end design_1_wrapper_rx_fifo_0_0;

architecture STRUCTURE of design_1_wrapper_rx_fifo_0_0 is
  signal \^data_byte\ : STD_LOGIC_VECTOR ( 7 downto 0 );
begin
  \^data_byte\(7 downto 0) <= data_byte(7 downto 0);
  din(7 downto 0) <= \^data_byte\(7 downto 0);
wr_en_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => rx_avail,
      I1 => full,
      O => wr_en
    );
end STRUCTURE;
