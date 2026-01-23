-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
-- Date        : Fri Jan 23 12:08:44 2026
-- Host        : DESKTOP-518F4EG running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_wrapper_tx_fifo_0_0_stub.vhdl
-- Design      : design_1_wrapper_tx_fifo_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    clk : in STD_LOGIC;
    rst_n : in STD_LOGIC;
    fifo_empty : in STD_LOGIC;
    fifo_dout : in STD_LOGIC_VECTOR ( 7 downto 0 );
    fifo_rd_en : out STD_LOGIC;
    tx_tenable : out STD_LOGIC;
    tx_tdin : out STD_LOGIC_VECTOR ( 7 downto 0 );
    tx_tdone : in STD_LOGIC
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,rst_n,fifo_empty,fifo_dout[7:0],fifo_rd_en,tx_tenable,tx_tdin[7:0],tx_tdone";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "wrapper_tx_fifo,Vivado 2022.2";
begin
end;
