-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
-- Date        : Fri Jan 23 12:08:44 2026
-- Host        : DESKTOP-518F4EG running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               d:/Xilinx/Xlinx_project/test_uart_23-1/test_uart_23-1.gen/sources_1/bd/design_1/ip/design_1_test_led_0_0/design_1_test_led_0_0_stub.vhdl
-- Design      : design_1_test_led_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_test_led_0_0 is
  Port ( 
    data_rx : in STD_LOGIC_VECTOR ( 7 downto 0 );
    data_tx : in STD_LOGIC_VECTOR ( 7 downto 0 );
    led_0_rx : out STD_LOGIC;
    led_1_rx : out STD_LOGIC;
    led_2_tx : out STD_LOGIC;
    led_3_tx : out STD_LOGIC
  );

end design_1_test_led_0_0;

architecture stub of design_1_test_led_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "data_rx[7:0],data_tx[7:0],led_0_rx,led_1_rx,led_2_tx,led_3_tx";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "test_led,Vivado 2022.2";
begin
end;
