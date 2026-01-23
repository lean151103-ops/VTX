-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
-- Date        : Fri Jan 23 12:08:44 2026
-- Host        : DESKTOP-518F4EG running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               d:/Xilinx/Xlinx_project/test_uart_23-1/test_uart_23-1.gen/sources_1/bd/design_1/ip/design_1_test_led_0_0/design_1_test_led_0_0_sim_netlist.vhdl
-- Design      : design_1_test_led_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_test_led_0_0 is
  port (
    data_rx : in STD_LOGIC_VECTOR ( 7 downto 0 );
    data_tx : in STD_LOGIC_VECTOR ( 7 downto 0 );
    led_0_rx : out STD_LOGIC;
    led_1_rx : out STD_LOGIC;
    led_2_tx : out STD_LOGIC;
    led_3_tx : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_test_led_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_test_led_0_0 : entity is "design_1_test_led_0_0,test_led,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_test_led_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_test_led_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_test_led_0_0 : entity is "test_led,Vivado 2022.2";
end design_1_test_led_0_0;

architecture STRUCTURE of design_1_test_led_0_0 is
  signal \^data_rx\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \^data_tx\ : STD_LOGIC_VECTOR ( 7 downto 0 );
begin
  \^data_rx\(1 downto 0) <= data_rx(1 downto 0);
  \^data_tx\(1 downto 0) <= data_tx(1 downto 0);
  led_0_rx <= \^data_rx\(0);
  led_1_rx <= \^data_rx\(1);
  led_2_tx <= \^data_tx\(0);
  led_3_tx <= \^data_tx\(1);
end STRUCTURE;
