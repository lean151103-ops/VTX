-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
-- Date        : Tue Feb 10 15:43:14 2026
-- Host        : TelemetryK3_07 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               d:/Xlinx/A_project/test10-2/test10-2.gen/sources_1/bd/design_1/ip/design_1_wrapper_fifo_axi_0_1/design_1_wrapper_fifo_axi_0_1_sim_netlist.vhdl
-- Design      : design_1_wrapper_fifo_axi_0_1
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_wrapper_fifo_axi_0_1_wrapper_fifo_axi is
  port (
    s_axis_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_tvalid_reg_0 : out STD_LOGIC;
    rd_en : out STD_LOGIC;
    rst_n : in STD_LOGIC;
    dout : in STD_LOGIC_VECTOR ( 7 downto 0 );
    clk : in STD_LOGIC;
    empty : in STD_LOGIC;
    s_axis_tready : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_wrapper_fifo_axi_0_1_wrapper_fifo_axi : entity is "wrapper_fifo_axi";
end design_1_wrapper_fifo_axi_0_1_wrapper_fifo_axi;

architecture STRUCTURE of design_1_wrapper_fifo_axi_0_1_wrapper_fifo_axi is
  signal Frame_buf : STD_LOGIC;
  signal Frame_buf_reg_i_1_n_0 : STD_LOGIC;
  signal Frame_buf_reg_i_2_n_0 : STD_LOGIC;
  signal Frame_buf_reg_i_3_n_0 : STD_LOGIC;
  signal Frame_buf_reg_i_5_n_0 : STD_LOGIC;
  signal Frame_buf_reg_i_6_n_0 : STD_LOGIC;
  signal Frame_buf_reg_i_7_n_0 : STD_LOGIC;
  signal Frame_buf_reg_i_8_n_0 : STD_LOGIC;
  signal crc_calc : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \crc_calc[0]_i_1_n_0\ : STD_LOGIC;
  signal \crc_calc[10]_i_1_n_0\ : STD_LOGIC;
  signal \crc_calc[11]_i_1_n_0\ : STD_LOGIC;
  signal \crc_calc[12]_i_1_n_0\ : STD_LOGIC;
  signal \crc_calc[13]_i_1_n_0\ : STD_LOGIC;
  signal \crc_calc[14]_i_1_n_0\ : STD_LOGIC;
  signal \crc_calc[15]_i_1_n_0\ : STD_LOGIC;
  signal \crc_calc[16]_i_1_n_0\ : STD_LOGIC;
  signal \crc_calc[17]_i_1_n_0\ : STD_LOGIC;
  signal \crc_calc[18]_i_1_n_0\ : STD_LOGIC;
  signal \crc_calc[18]_i_2_n_0\ : STD_LOGIC;
  signal \crc_calc[19]_i_1_n_0\ : STD_LOGIC;
  signal \crc_calc[1]_i_1_n_0\ : STD_LOGIC;
  signal \crc_calc[20]_i_1_n_0\ : STD_LOGIC;
  signal \crc_calc[21]_i_1_n_0\ : STD_LOGIC;
  signal \crc_calc[21]_i_2_n_0\ : STD_LOGIC;
  signal \crc_calc[22]_i_1_n_0\ : STD_LOGIC;
  signal \crc_calc[23]_i_1_n_0\ : STD_LOGIC;
  signal \crc_calc[23]_i_2_n_0\ : STD_LOGIC;
  signal \crc_calc[24]_i_1_n_0\ : STD_LOGIC;
  signal \crc_calc[24]_i_2_n_0\ : STD_LOGIC;
  signal \crc_calc[25]_i_1_n_0\ : STD_LOGIC;
  signal \crc_calc[25]_i_2_n_0\ : STD_LOGIC;
  signal \crc_calc[26]_i_1_n_0\ : STD_LOGIC;
  signal \crc_calc[26]_i_2_n_0\ : STD_LOGIC;
  signal \crc_calc[27]_i_1_n_0\ : STD_LOGIC;
  signal \crc_calc[27]_i_2_n_0\ : STD_LOGIC;
  signal \crc_calc[27]_i_3_n_0\ : STD_LOGIC;
  signal \crc_calc[28]_i_1_n_0\ : STD_LOGIC;
  signal \crc_calc[28]_i_2_n_0\ : STD_LOGIC;
  signal \crc_calc[29]_i_1_n_0\ : STD_LOGIC;
  signal \crc_calc[29]_i_2_n_0\ : STD_LOGIC;
  signal \crc_calc[29]_i_3_n_0\ : STD_LOGIC;
  signal \crc_calc[2]_i_1_n_0\ : STD_LOGIC;
  signal \crc_calc[30]_i_1_n_0\ : STD_LOGIC;
  signal \crc_calc[30]_i_2_n_0\ : STD_LOGIC;
  signal \crc_calc[31]_i_1_n_0\ : STD_LOGIC;
  signal \crc_calc[31]_i_2_n_0\ : STD_LOGIC;
  signal \crc_calc[3]_i_1_n_0\ : STD_LOGIC;
  signal \crc_calc[4]_i_1_n_0\ : STD_LOGIC;
  signal \crc_calc[5]_i_1_n_0\ : STD_LOGIC;
  signal \crc_calc[6]_i_1_n_0\ : STD_LOGIC;
  signal \crc_calc[7]_i_1_n_0\ : STD_LOGIC;
  signal \crc_calc[8]_i_1_n_0\ : STD_LOGIC;
  signal \crc_calc[9]_i_1_n_0\ : STD_LOGIC;
  signal crc_cnt : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \crc_cnt[0]_i_1_n_0\ : STD_LOGIC;
  signal \crc_cnt[1]_i_1_n_0\ : STD_LOGIC;
  signal \crc_cnt[2]_i_1_n_0\ : STD_LOGIC;
  signal \crc_cnt[2]_i_2_n_0\ : STD_LOGIC;
  signal \crc_cnt[2]_i_3_n_0\ : STD_LOGIC;
  signal crc_rx : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \crc_rx[15]_i_1_n_0\ : STD_LOGIC;
  signal \crc_rx[23]_i_1_n_0\ : STD_LOGIC;
  signal \crc_rx[24]_i_1_n_0\ : STD_LOGIC;
  signal \crc_rx[25]_i_1_n_0\ : STD_LOGIC;
  signal \crc_rx[26]_i_1_n_0\ : STD_LOGIC;
  signal \crc_rx[27]_i_1_n_0\ : STD_LOGIC;
  signal \crc_rx[28]_i_1_n_0\ : STD_LOGIC;
  signal \crc_rx[29]_i_1_n_0\ : STD_LOGIC;
  signal \crc_rx[30]_i_1_n_0\ : STD_LOGIC;
  signal \crc_rx[31]_i_1_n_0\ : STD_LOGIC;
  signal \crc_rx[31]_i_2_n_0\ : STD_LOGIC;
  signal \crc_rx[31]_i_3_n_0\ : STD_LOGIC;
  signal \crc_rx[31]_i_4_n_0\ : STD_LOGIC;
  signal \crc_rx[7]_i_1_n_0\ : STD_LOGIC;
  signal data0 : STD_LOGIC_VECTOR ( 6 downto 1 );
  signal p_2_in : STD_LOGIC_VECTOR ( 15 downto 7 );
  signal \p_2_in__0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal payload_cnt : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \payload_cnt[4]_i_2_n_0\ : STD_LOGIC;
  signal \payload_cnt[4]_i_3_n_0\ : STD_LOGIC;
  signal \payload_cnt[4]_i_4_n_0\ : STD_LOGIC;
  signal \payload_cnt[4]_i_5_n_0\ : STD_LOGIC;
  signal \payload_cnt[5]_i_2_n_0\ : STD_LOGIC;
  signal \payload_cnt[6]_i_2_n_0\ : STD_LOGIC;
  signal \payload_cnt[7]_i_1_n_0\ : STD_LOGIC;
  signal \payload_cnt[7]_i_3_n_0\ : STD_LOGIC;
  signal \payload_cnt[7]_i_4_n_0\ : STD_LOGIC;
  signal \payload_cnt[7]_i_5_n_0\ : STD_LOGIC;
  signal rd_en_i_1_n_0 : STD_LOGIC;
  signal rd_ptr : STD_LOGIC_VECTOR ( 15 downto 7 );
  signal rd_ptr0 : STD_LOGIC_VECTOR ( 15 downto 1 );
  signal \rd_ptr[0]_i_1_n_0\ : STD_LOGIC;
  signal \rd_ptr[15]_i_1_n_0\ : STD_LOGIC;
  signal \rd_ptr[15]_i_3_n_0\ : STD_LOGIC;
  signal \rd_ptr[1]_i_1_n_0\ : STD_LOGIC;
  signal \rd_ptr[2]_i_1_n_0\ : STD_LOGIC;
  signal \rd_ptr[3]_i_1_n_0\ : STD_LOGIC;
  signal \rd_ptr[4]_i_1_n_0\ : STD_LOGIC;
  signal \rd_ptr[5]_i_1_n_0\ : STD_LOGIC;
  signal \rd_ptr[6]_i_1_n_0\ : STD_LOGIC;
  signal \rd_ptr_reg[12]_i_2_n_0\ : STD_LOGIC;
  signal \rd_ptr_reg[12]_i_2_n_1\ : STD_LOGIC;
  signal \rd_ptr_reg[12]_i_2_n_2\ : STD_LOGIC;
  signal \rd_ptr_reg[12]_i_2_n_3\ : STD_LOGIC;
  signal \rd_ptr_reg[15]_i_4_n_2\ : STD_LOGIC;
  signal \rd_ptr_reg[15]_i_4_n_3\ : STD_LOGIC;
  signal \rd_ptr_reg[1]_i_2_n_0\ : STD_LOGIC;
  signal \rd_ptr_reg[1]_i_2_n_1\ : STD_LOGIC;
  signal \rd_ptr_reg[1]_i_2_n_2\ : STD_LOGIC;
  signal \rd_ptr_reg[1]_i_2_n_3\ : STD_LOGIC;
  signal \rd_ptr_reg[8]_i_2_n_0\ : STD_LOGIC;
  signal \rd_ptr_reg[8]_i_2_n_1\ : STD_LOGIC;
  signal \rd_ptr_reg[8]_i_2_n_2\ : STD_LOGIC;
  signal \rd_ptr_reg[8]_i_2_n_3\ : STD_LOGIC;
  signal rd_ptr_reg_rep : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal s_axis_tvalid_i_1_n_0 : STD_LOGIC;
  signal s_axis_tvalid_i_2_n_0 : STD_LOGIC;
  signal s_axis_tvalid_i_3_n_0 : STD_LOGIC;
  signal s_axis_tvalid_i_4_n_0 : STD_LOGIC;
  signal s_axis_tvalid_i_5_n_0 : STD_LOGIC;
  signal s_axis_tvalid_i_6_n_0 : STD_LOGIC;
  signal s_axis_tvalid_i_7_n_0 : STD_LOGIC;
  signal \^s_axis_tvalid_reg_0\ : STD_LOGIC;
  signal seq_cnt : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \seq_cnt[0]_i_1_n_0\ : STD_LOGIC;
  signal \seq_cnt[1]_i_1_n_0\ : STD_LOGIC;
  signal \seq_cnt[1]_i_2_n_0\ : STD_LOGIC;
  signal \seq_cnt[1]_i_3_n_0\ : STD_LOGIC;
  signal \st1_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \st1_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \st1_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \st1_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \st1_carry__0_n_0\ : STD_LOGIC;
  signal \st1_carry__0_n_1\ : STD_LOGIC;
  signal \st1_carry__0_n_2\ : STD_LOGIC;
  signal \st1_carry__0_n_3\ : STD_LOGIC;
  signal \st1_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \st1_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \st1_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \st1_carry__1_n_1\ : STD_LOGIC;
  signal \st1_carry__1_n_2\ : STD_LOGIC;
  signal \st1_carry__1_n_3\ : STD_LOGIC;
  signal st1_carry_i_1_n_0 : STD_LOGIC;
  signal st1_carry_i_2_n_0 : STD_LOGIC;
  signal st1_carry_i_3_n_0 : STD_LOGIC;
  signal st1_carry_i_4_n_0 : STD_LOGIC;
  signal st1_carry_n_0 : STD_LOGIC;
  signal st1_carry_n_1 : STD_LOGIC;
  signal st1_carry_n_2 : STD_LOGIC;
  signal st1_carry_n_3 : STD_LOGIC;
  signal \st[0]_i_1_n_0\ : STD_LOGIC;
  signal \st[0]_i_2_n_0\ : STD_LOGIC;
  signal \st[0]_i_3_n_0\ : STD_LOGIC;
  signal \st[0]_i_4_n_0\ : STD_LOGIC;
  signal \st[0]_i_5_n_0\ : STD_LOGIC;
  signal \st[1]_i_1_n_0\ : STD_LOGIC;
  signal \st[1]_i_2_n_0\ : STD_LOGIC;
  signal \st[2]_i_1_n_0\ : STD_LOGIC;
  signal \st[2]_i_2_n_0\ : STD_LOGIC;
  signal \st[2]_i_3_n_0\ : STD_LOGIC;
  signal \st_reg_n_0_[0]\ : STD_LOGIC;
  signal \st_reg_n_0_[1]\ : STD_LOGIC;
  signal \st_reg_n_0_[2]\ : STD_LOGIC;
  signal \wr_ptr0_carry__0_n_3\ : STD_LOGIC;
  signal wr_ptr0_carry_n_0 : STD_LOGIC;
  signal wr_ptr0_carry_n_1 : STD_LOGIC;
  signal wr_ptr0_carry_n_2 : STD_LOGIC;
  signal wr_ptr0_carry_n_3 : STD_LOGIC;
  signal \wr_ptr[0]_i_1_n_0\ : STD_LOGIC;
  signal \wr_ptr[1]_i_1_n_0\ : STD_LOGIC;
  signal \wr_ptr[2]_i_1_n_0\ : STD_LOGIC;
  signal \wr_ptr[3]_i_1_n_0\ : STD_LOGIC;
  signal \wr_ptr[4]_i_1_n_0\ : STD_LOGIC;
  signal \wr_ptr[5]_i_1_n_0\ : STD_LOGIC;
  signal \wr_ptr[6]_i_1_n_0\ : STD_LOGIC;
  signal \wr_ptr[6]_i_2_n_0\ : STD_LOGIC;
  signal \wr_ptr[6]_i_3_n_0\ : STD_LOGIC;
  signal \wr_ptr[6]_i_4_n_0\ : STD_LOGIC;
  signal \wr_ptr[6]_i_5_n_0\ : STD_LOGIC;
  signal \wr_ptr_reg_n_0_[0]\ : STD_LOGIC;
  signal \wr_ptr_reg_n_0_[1]\ : STD_LOGIC;
  signal \wr_ptr_reg_n_0_[2]\ : STD_LOGIC;
  signal \wr_ptr_reg_n_0_[3]\ : STD_LOGIC;
  signal \wr_ptr_reg_n_0_[4]\ : STD_LOGIC;
  signal \wr_ptr_reg_n_0_[5]\ : STD_LOGIC;
  signal \wr_ptr_reg_n_0_[6]\ : STD_LOGIC;
  signal NLW_Frame_buf_reg_DOADO_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_Frame_buf_reg_DOBDO_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 8 );
  signal NLW_Frame_buf_reg_DOPADOP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_Frame_buf_reg_DOPBDOP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \NLW_rd_ptr_reg[15]_i_4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_rd_ptr_reg[15]_i_4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_st1_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_st1_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_st1_carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_st1_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_wr_ptr0_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_wr_ptr0_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of Frame_buf_reg : label is "p0_d8";
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of Frame_buf_reg : label is "p0_d8";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of Frame_buf_reg : label is "{SYNTH-6 {cell *THIS*}}";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of Frame_buf_reg : label is 864;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of Frame_buf_reg : label is "inst/Frame_buf_reg";
  attribute RTL_RAM_TYPE : string;
  attribute RTL_RAM_TYPE of Frame_buf_reg : label is "RAM_SDP";
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of Frame_buf_reg : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of Frame_buf_reg : label is 1023;
  attribute ram_offset : integer;
  attribute ram_offset of Frame_buf_reg : label is 896;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of Frame_buf_reg : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of Frame_buf_reg : label is 7;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of Frame_buf_reg_i_5 : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \crc_calc[0]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \crc_calc[10]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \crc_calc[17]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \crc_calc[18]_i_2\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \crc_calc[20]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \crc_calc[23]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \crc_calc[24]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \crc_calc[24]_i_2\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \crc_calc[25]_i_2\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \crc_calc[26]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \crc_calc[27]_i_2\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \crc_calc[27]_i_3\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \crc_calc[29]_i_2\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \crc_calc[29]_i_3\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \crc_calc[2]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \crc_calc[30]_i_2\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \crc_calc[31]_i_2\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \crc_calc[4]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \crc_calc[8]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \crc_calc[9]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \crc_cnt[0]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \crc_cnt[2]_i_2\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \crc_rx[24]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \crc_rx[25]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \crc_rx[26]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \crc_rx[27]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \crc_rx[28]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \crc_rx[29]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \crc_rx[30]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \crc_rx[31]_i_2\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \crc_rx[31]_i_3\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \payload_cnt[0]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \payload_cnt[4]_i_2\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \payload_cnt[4]_i_3\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \payload_cnt[4]_i_4\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \payload_cnt[4]_i_5\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \payload_cnt[5]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \payload_cnt[7]_i_3\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of rd_en_i_1 : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \rd_ptr[0]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \rd_ptr[10]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \rd_ptr[11]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \rd_ptr[12]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \rd_ptr[13]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \rd_ptr[14]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \rd_ptr[15]_i_2\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \rd_ptr[2]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \rd_ptr[3]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \rd_ptr[4]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \rd_ptr[5]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \rd_ptr[6]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \rd_ptr[7]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \rd_ptr[8]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \rd_ptr[9]_i_1\ : label is "soft_lutpair29";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \rd_ptr_reg[12]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \rd_ptr_reg[15]_i_4\ : label is 35;
  attribute ADDER_THRESHOLD of \rd_ptr_reg[1]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \rd_ptr_reg[8]_i_2\ : label is 35;
  attribute SOFT_HLUTNM of s_axis_tvalid_i_2 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of s_axis_tvalid_i_5 : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \seq_cnt[1]_i_2\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \seq_cnt[1]_i_3\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \wr_ptr[0]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \wr_ptr[1]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \wr_ptr[2]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \wr_ptr[3]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \wr_ptr[4]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \wr_ptr[5]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \wr_ptr[6]_i_4\ : label is "soft_lutpair14";
begin
  s_axis_tvalid_reg_0 <= \^s_axis_tvalid_reg_0\;
Frame_buf_reg: unisim.vcomponents.RAMB18E1
    generic map(
      DOA_REG => 0,
      DOB_REG => 0,
      INIT_A => X"00000",
      INIT_B => X"00000",
      RAM_MODE => "TDP",
      RDADDR_COLLISION_HWCONFIG => "DELAYED_WRITE",
      READ_WIDTH_A => 18,
      READ_WIDTH_B => 18,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "7SERIES",
      SRVAL_A => X"00000",
      SRVAL_B => X"00000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 18,
      WRITE_WIDTH_B => 18
    )
        port map (
      ADDRARDADDR(13 downto 11) => B"111",
      ADDRARDADDR(10) => \wr_ptr_reg_n_0_[6]\,
      ADDRARDADDR(9) => \wr_ptr_reg_n_0_[5]\,
      ADDRARDADDR(8) => \wr_ptr_reg_n_0_[4]\,
      ADDRARDADDR(7) => \wr_ptr_reg_n_0_[3]\,
      ADDRARDADDR(6) => \wr_ptr_reg_n_0_[2]\,
      ADDRARDADDR(5) => \wr_ptr_reg_n_0_[1]\,
      ADDRARDADDR(4) => \wr_ptr_reg_n_0_[0]\,
      ADDRARDADDR(3 downto 0) => B"1111",
      ADDRBWRADDR(13 downto 11) => B"111",
      ADDRBWRADDR(10 downto 4) => rd_ptr_reg_rep(6 downto 0),
      ADDRBWRADDR(3 downto 0) => B"1111",
      CLKARDCLK => clk,
      CLKBWRCLK => clk,
      DIADI(15 downto 8) => B"00000000",
      DIADI(7 downto 0) => dout(7 downto 0),
      DIBDI(15 downto 0) => B"0000000011111111",
      DIPADIP(1 downto 0) => B"00",
      DIPBDIP(1 downto 0) => B"00",
      DOADO(15 downto 0) => NLW_Frame_buf_reg_DOADO_UNCONNECTED(15 downto 0),
      DOBDO(15 downto 8) => NLW_Frame_buf_reg_DOBDO_UNCONNECTED(15 downto 8),
      DOBDO(7 downto 0) => s_axis_tdata(7 downto 0),
      DOPADOP(1 downto 0) => NLW_Frame_buf_reg_DOPADOP_UNCONNECTED(1 downto 0),
      DOPBDOP(1 downto 0) => NLW_Frame_buf_reg_DOPBDOP_UNCONNECTED(1 downto 0),
      ENARDEN => Frame_buf_reg_i_1_n_0,
      ENBWREN => Frame_buf_reg_i_2_n_0,
      REGCEAREGCE => '0',
      REGCEB => '0',
      RSTRAMARSTRAM => '0',
      RSTRAMB => Frame_buf_reg_i_3_n_0,
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      WEA(1) => Frame_buf,
      WEA(0) => Frame_buf,
      WEBWE(3 downto 0) => B"0000"
    );
Frame_buf_reg_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0FFF0FEF0FEF0FE"
    )
        port map (
      I0 => \st_reg_n_0_[1]\,
      I1 => \st_reg_n_0_[2]\,
      I2 => Frame_buf_reg_i_5_n_0,
      I3 => empty,
      I4 => \st_reg_n_0_[0]\,
      I5 => Frame_buf_reg_i_6_n_0,
      O => Frame_buf_reg_i_1_n_0
    );
Frame_buf_reg_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"08FF"
    )
        port map (
      I0 => \st_reg_n_0_[2]\,
      I1 => \st_reg_n_0_[1]\,
      I2 => \st_reg_n_0_[0]\,
      I3 => rst_n,
      O => Frame_buf_reg_i_2_n_0
    );
Frame_buf_reg_i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => rst_n,
      O => Frame_buf_reg_i_3_n_0
    );
Frame_buf_reg_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1F00"
    )
        port map (
      I0 => \st_reg_n_0_[0]\,
      I1 => \st_reg_n_0_[1]\,
      I2 => \st_reg_n_0_[2]\,
      I3 => rst_n,
      O => Frame_buf
    );
Frame_buf_reg_i_5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => dout(1),
      I1 => dout(0),
      I2 => empty,
      I3 => \st_reg_n_0_[0]\,
      I4 => Frame_buf_reg_i_7_n_0,
      O => Frame_buf_reg_i_5_n_0
    );
Frame_buf_reg_i_6: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00200000"
    )
        port map (
      I0 => dout(0),
      I1 => dout(1),
      I2 => dout(2),
      I3 => dout(3),
      I4 => Frame_buf_reg_i_8_n_0,
      O => Frame_buf_reg_i_6_n_0
    );
Frame_buf_reg_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000002000000000"
    )
        port map (
      I0 => dout(5),
      I1 => dout(4),
      I2 => dout(3),
      I3 => dout(2),
      I4 => dout(6),
      I5 => dout(7),
      O => Frame_buf_reg_i_7_n_0
    );
Frame_buf_reg_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => dout(7),
      I1 => dout(6),
      I2 => dout(5),
      I3 => dout(4),
      O => Frame_buf_reg_i_8_n_0
    );
\crc_calc[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"96FF"
    )
        port map (
      I0 => dout(2),
      I1 => crc_calc(2),
      I2 => crc_calc(8),
      I3 => \st_reg_n_0_[0]\,
      O => \crc_calc[0]_i_1_n_0\
    );
\crc_calc[10]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"96FF"
    )
        port map (
      I0 => dout(2),
      I1 => crc_calc(2),
      I2 => crc_calc(18),
      I3 => \st_reg_n_0_[0]\,
      O => \crc_calc[10]_i_1_n_0\
    );
\crc_calc[11]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"96FF"
    )
        port map (
      I0 => dout(3),
      I1 => crc_calc(3),
      I2 => crc_calc(19),
      I3 => \st_reg_n_0_[0]\,
      O => \crc_calc[11]_i_1_n_0\
    );
\crc_calc[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"96696996FFFFFFFF"
    )
        port map (
      I0 => crc_calc(20),
      I1 => crc_calc(4),
      I2 => dout(4),
      I3 => crc_calc(0),
      I4 => dout(0),
      I5 => \st_reg_n_0_[0]\,
      O => \crc_calc[12]_i_1_n_0\
    );
\crc_calc[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"96696996FFFFFFFF"
    )
        port map (
      I0 => crc_calc(21),
      I1 => \crc_calc[25]_i_2_n_0\,
      I2 => dout(5),
      I3 => crc_calc(5),
      I4 => \crc_calc[29]_i_3_n_0\,
      I5 => \st_reg_n_0_[0]\,
      O => \crc_calc[13]_i_1_n_0\
    );
\crc_calc[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"96696996FFFFFFFF"
    )
        port map (
      I0 => \crc_calc[18]_i_2_n_0\,
      I1 => crc_calc(6),
      I2 => dout(6),
      I3 => crc_calc(22),
      I4 => \crc_calc[25]_i_2_n_0\,
      I5 => \st_reg_n_0_[0]\,
      O => \crc_calc[14]_i_1_n_0\
    );
\crc_calc[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"96696996FFFFFFFF"
    )
        port map (
      I0 => \crc_calc[18]_i_2_n_0\,
      I1 => crc_calc(23),
      I2 => \crc_calc[25]_i_2_n_0\,
      I3 => \crc_calc[27]_i_2_n_0\,
      I4 => \crc_calc[30]_i_2_n_0\,
      I5 => \st_reg_n_0_[0]\,
      O => \crc_calc[15]_i_1_n_0\
    );
\crc_calc[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"69969669FFFFFFFF"
    )
        port map (
      I0 => crc_calc(3),
      I1 => dout(3),
      I2 => \crc_calc[18]_i_2_n_0\,
      I3 => \crc_calc[28]_i_2_n_0\,
      I4 => crc_calc(24),
      I5 => \st_reg_n_0_[0]\,
      O => \crc_calc[16]_i_1_n_0\
    );
\crc_calc[17]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6996FFFF"
    )
        port map (
      I0 => \crc_calc[24]_i_2_n_0\,
      I1 => crc_calc(25),
      I2 => crc_calc(3),
      I3 => dout(3),
      I4 => \st_reg_n_0_[0]\,
      O => \crc_calc[17]_i_1_n_0\
    );
\crc_calc[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"96696996FFFFFFFF"
    )
        port map (
      I0 => \crc_calc[24]_i_2_n_0\,
      I1 => dout(6),
      I2 => crc_calc(6),
      I3 => \crc_calc[18]_i_2_n_0\,
      I4 => crc_calc(26),
      I5 => \st_reg_n_0_[0]\,
      O => \crc_calc[18]_i_1_n_0\
    );
\crc_calc[18]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => dout(2),
      I1 => crc_calc(2),
      O => \crc_calc[18]_i_2_n_0\
    );
\crc_calc[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"69969669FFFFFFFF"
    )
        port map (
      I0 => dout(5),
      I1 => crc_calc(5),
      I2 => \crc_calc[26]_i_2_n_0\,
      I3 => crc_calc(27),
      I4 => \crc_calc[30]_i_2_n_0\,
      I5 => \st_reg_n_0_[0]\,
      O => \crc_calc[19]_i_1_n_0\
    );
\crc_calc[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"96696996FFFFFFFF"
    )
        port map (
      I0 => crc_calc(9),
      I1 => crc_calc(3),
      I2 => dout(3),
      I3 => crc_calc(0),
      I4 => dout(0),
      I5 => \st_reg_n_0_[0]\,
      O => \crc_calc[1]_i_1_n_0\
    );
\crc_calc[20]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"69FF"
    )
        port map (
      I0 => \crc_calc[23]_i_2_n_0\,
      I1 => crc_calc(28),
      I2 => \crc_calc[30]_i_2_n_0\,
      I3 => \st_reg_n_0_[0]\,
      O => \crc_calc[20]_i_1_n_0\
    );
\crc_calc[21]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"69969669FFFFFFFF"
    )
        port map (
      I0 => dout(4),
      I1 => crc_calc(4),
      I2 => crc_calc(29),
      I3 => \crc_calc[21]_i_2_n_0\,
      I4 => \crc_calc[30]_i_2_n_0\,
      I5 => \st_reg_n_0_[0]\,
      O => \crc_calc[21]_i_1_n_0\
    );
\crc_calc[21]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9669699669969669"
    )
        port map (
      I0 => dout(1),
      I1 => crc_calc(1),
      I2 => dout(5),
      I3 => crc_calc(5),
      I4 => crc_calc(2),
      I5 => dout(2),
      O => \crc_calc[21]_i_2_n_0\
    );
\crc_calc[22]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"9669FFFF"
    )
        port map (
      I0 => crc_calc(30),
      I1 => \crc_calc[26]_i_2_n_0\,
      I2 => crc_calc(5),
      I3 => dout(5),
      I4 => \st_reg_n_0_[0]\,
      O => \crc_calc[22]_i_1_n_0\
    );
\crc_calc[23]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"69FF"
    )
        port map (
      I0 => \crc_calc[23]_i_2_n_0\,
      I1 => crc_calc(31),
      I2 => \crc_calc[30]_i_2_n_0\,
      I3 => \st_reg_n_0_[0]\,
      O => \crc_calc[23]_i_1_n_0\
    );
\crc_calc[23]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9669699669969669"
    )
        port map (
      I0 => dout(6),
      I1 => crc_calc(6),
      I2 => dout(4),
      I3 => crc_calc(4),
      I4 => \crc_calc[25]_i_2_n_0\,
      I5 => \crc_calc[27]_i_2_n_0\,
      O => \crc_calc[23]_i_2_n_0\
    );
\crc_calc[24]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6996FFFF"
    )
        port map (
      I0 => \crc_calc[24]_i_2_n_0\,
      I1 => crc_calc(2),
      I2 => dout(2),
      I3 => \crc_calc[30]_i_2_n_0\,
      I4 => \st_reg_n_0_[0]\,
      O => \crc_calc[24]_i_1_n_0\
    );
\crc_calc[24]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"69969669"
    )
        port map (
      I0 => \crc_calc[28]_i_2_n_0\,
      I1 => dout(1),
      I2 => crc_calc(1),
      I3 => dout(5),
      I4 => crc_calc(5),
      O => \crc_calc[24]_i_2_n_0\
    );
\crc_calc[25]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"69969669FFFFFFFF"
    )
        port map (
      I0 => \crc_calc[26]_i_2_n_0\,
      I1 => \crc_calc[25]_i_2_n_0\,
      I2 => dout(5),
      I3 => crc_calc(5),
      I4 => \crc_calc[29]_i_3_n_0\,
      I5 => \st_reg_n_0_[0]\,
      O => \crc_calc[25]_i_1_n_0\
    );
\crc_calc[25]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => dout(1),
      I1 => crc_calc(1),
      O => \crc_calc[25]_i_2_n_0\
    );
\crc_calc[26]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"96FF"
    )
        port map (
      I0 => \crc_calc[26]_i_2_n_0\,
      I1 => \crc_calc[28]_i_2_n_0\,
      I2 => \crc_calc[30]_i_2_n_0\,
      I3 => \st_reg_n_0_[0]\,
      O => \crc_calc[26]_i_1_n_0\
    );
\crc_calc[26]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9669699669969669"
    )
        port map (
      I0 => dout(6),
      I1 => crc_calc(6),
      I2 => dout(2),
      I3 => crc_calc(2),
      I4 => crc_calc(3),
      I5 => dout(3),
      O => \crc_calc[26]_i_2_n_0\
    );
\crc_calc[27]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"96696996FFFFFFFF"
    )
        port map (
      I0 => \crc_calc[27]_i_2_n_0\,
      I1 => dout(4),
      I2 => crc_calc(4),
      I3 => \crc_calc[27]_i_3_n_0\,
      I4 => \crc_calc[30]_i_2_n_0\,
      I5 => \st_reg_n_0_[0]\,
      O => \crc_calc[27]_i_1_n_0\
    );
\crc_calc[27]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => dout(3),
      I1 => crc_calc(3),
      O => \crc_calc[27]_i_2_n_0\
    );
\crc_calc[27]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => dout(5),
      I1 => crc_calc(5),
      O => \crc_calc[27]_i_3_n_0\
    );
\crc_calc[28]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"69969669FFFFFFFF"
    )
        port map (
      I0 => \crc_calc[28]_i_2_n_0\,
      I1 => crc_calc(5),
      I2 => dout(5),
      I3 => crc_calc(6),
      I4 => dout(6),
      I5 => \st_reg_n_0_[0]\,
      O => \crc_calc[28]_i_1_n_0\
    );
\crc_calc[28]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9669"
    )
        port map (
      I0 => crc_calc(4),
      I1 => dout(4),
      I2 => crc_calc(0),
      I3 => dout(0),
      O => \crc_calc[28]_i_2_n_0\
    );
\crc_calc[29]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"96696996FFFFFFFF"
    )
        port map (
      I0 => \crc_calc[29]_i_2_n_0\,
      I1 => dout(5),
      I2 => crc_calc(5),
      I3 => \crc_calc[29]_i_3_n_0\,
      I4 => \crc_calc[30]_i_2_n_0\,
      I5 => \st_reg_n_0_[0]\,
      O => \crc_calc[29]_i_1_n_0\
    );
\crc_calc[29]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => dout(6),
      I1 => crc_calc(6),
      O => \crc_calc[29]_i_2_n_0\
    );
\crc_calc[29]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => dout(0),
      I1 => crc_calc(0),
      O => \crc_calc[29]_i_3_n_0\
    );
\crc_calc[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"9669FFFF"
    )
        port map (
      I0 => \crc_calc[28]_i_2_n_0\,
      I1 => crc_calc(10),
      I2 => crc_calc(1),
      I3 => dout(1),
      I4 => \st_reg_n_0_[0]\,
      O => \crc_calc[2]_i_1_n_0\
    );
\crc_calc[30]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"96696996FFFFFFFF"
    )
        port map (
      I0 => crc_calc(0),
      I1 => dout(0),
      I2 => crc_calc(6),
      I3 => dout(6),
      I4 => \crc_calc[30]_i_2_n_0\,
      I5 => \st_reg_n_0_[0]\,
      O => \crc_calc[30]_i_1_n_0\
    );
\crc_calc[30]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => crc_calc(7),
      I1 => dout(7),
      I2 => crc_calc(1),
      I3 => dout(1),
      O => \crc_calc[30]_i_2_n_0\
    );
\crc_calc[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000F200"
    )
        port map (
      I0 => seq_cnt(0),
      I1 => seq_cnt(1),
      I2 => \st_reg_n_0_[0]\,
      I3 => \st_reg_n_0_[1]\,
      I4 => empty,
      I5 => \st_reg_n_0_[2]\,
      O => \crc_calc[31]_i_1_n_0\
    );
\crc_calc[31]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6996FFFF"
    )
        port map (
      I0 => dout(1),
      I1 => crc_calc(1),
      I2 => dout(7),
      I3 => crc_calc(7),
      I4 => \st_reg_n_0_[0]\,
      O => \crc_calc[31]_i_2_n_0\
    );
\crc_calc[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"96696996FFFFFFFF"
    )
        port map (
      I0 => crc_calc(11),
      I1 => \crc_calc[25]_i_2_n_0\,
      I2 => dout(5),
      I3 => crc_calc(5),
      I4 => \crc_calc[18]_i_2_n_0\,
      I5 => \st_reg_n_0_[0]\,
      O => \crc_calc[3]_i_1_n_0\
    );
\crc_calc[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"9669FFFF"
    )
        port map (
      I0 => \crc_calc[26]_i_2_n_0\,
      I1 => crc_calc(12),
      I2 => crc_calc(0),
      I3 => dout(0),
      I4 => \st_reg_n_0_[0]\,
      O => \crc_calc[4]_i_1_n_0\
    );
\crc_calc[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"96696996FFFFFFFF"
    )
        port map (
      I0 => \crc_calc[27]_i_2_n_0\,
      I1 => dout(4),
      I2 => crc_calc(4),
      I3 => crc_calc(13),
      I4 => \crc_calc[30]_i_2_n_0\,
      I5 => \st_reg_n_0_[0]\,
      O => \crc_calc[5]_i_1_n_0\
    );
\crc_calc[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"96696996FFFFFFFF"
    )
        port map (
      I0 => crc_calc(14),
      I1 => crc_calc(5),
      I2 => dout(5),
      I3 => crc_calc(4),
      I4 => dout(4),
      I5 => \st_reg_n_0_[0]\,
      O => \crc_calc[6]_i_1_n_0\
    );
\crc_calc[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"96696996FFFFFFFF"
    )
        port map (
      I0 => crc_calc(15),
      I1 => \crc_calc[29]_i_2_n_0\,
      I2 => dout(5),
      I3 => crc_calc(5),
      I4 => \crc_calc[29]_i_3_n_0\,
      I5 => \st_reg_n_0_[0]\,
      O => \crc_calc[7]_i_1_n_0\
    );
\crc_calc[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6996FFFF"
    )
        port map (
      I0 => crc_calc(16),
      I1 => crc_calc(6),
      I2 => dout(6),
      I3 => \crc_calc[30]_i_2_n_0\,
      I4 => \st_reg_n_0_[0]\,
      O => \crc_calc[8]_i_1_n_0\
    );
\crc_calc[9]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"96FF"
    )
        port map (
      I0 => crc_calc(17),
      I1 => crc_calc(7),
      I2 => dout(7),
      I3 => \st_reg_n_0_[0]\,
      O => \crc_calc[9]_i_1_n_0\
    );
\crc_calc_reg[0]\: unisim.vcomponents.FDSE
     port map (
      C => clk,
      CE => \crc_calc[31]_i_1_n_0\,
      D => \crc_calc[0]_i_1_n_0\,
      Q => crc_calc(0),
      S => Frame_buf_reg_i_3_n_0
    );
\crc_calc_reg[10]\: unisim.vcomponents.FDSE
     port map (
      C => clk,
      CE => \crc_calc[31]_i_1_n_0\,
      D => \crc_calc[10]_i_1_n_0\,
      Q => crc_calc(10),
      S => Frame_buf_reg_i_3_n_0
    );
\crc_calc_reg[11]\: unisim.vcomponents.FDSE
     port map (
      C => clk,
      CE => \crc_calc[31]_i_1_n_0\,
      D => \crc_calc[11]_i_1_n_0\,
      Q => crc_calc(11),
      S => Frame_buf_reg_i_3_n_0
    );
\crc_calc_reg[12]\: unisim.vcomponents.FDSE
     port map (
      C => clk,
      CE => \crc_calc[31]_i_1_n_0\,
      D => \crc_calc[12]_i_1_n_0\,
      Q => crc_calc(12),
      S => Frame_buf_reg_i_3_n_0
    );
\crc_calc_reg[13]\: unisim.vcomponents.FDSE
     port map (
      C => clk,
      CE => \crc_calc[31]_i_1_n_0\,
      D => \crc_calc[13]_i_1_n_0\,
      Q => crc_calc(13),
      S => Frame_buf_reg_i_3_n_0
    );
\crc_calc_reg[14]\: unisim.vcomponents.FDSE
     port map (
      C => clk,
      CE => \crc_calc[31]_i_1_n_0\,
      D => \crc_calc[14]_i_1_n_0\,
      Q => crc_calc(14),
      S => Frame_buf_reg_i_3_n_0
    );
\crc_calc_reg[15]\: unisim.vcomponents.FDSE
     port map (
      C => clk,
      CE => \crc_calc[31]_i_1_n_0\,
      D => \crc_calc[15]_i_1_n_0\,
      Q => crc_calc(15),
      S => Frame_buf_reg_i_3_n_0
    );
\crc_calc_reg[16]\: unisim.vcomponents.FDSE
     port map (
      C => clk,
      CE => \crc_calc[31]_i_1_n_0\,
      D => \crc_calc[16]_i_1_n_0\,
      Q => crc_calc(16),
      S => Frame_buf_reg_i_3_n_0
    );
\crc_calc_reg[17]\: unisim.vcomponents.FDSE
     port map (
      C => clk,
      CE => \crc_calc[31]_i_1_n_0\,
      D => \crc_calc[17]_i_1_n_0\,
      Q => crc_calc(17),
      S => Frame_buf_reg_i_3_n_0
    );
\crc_calc_reg[18]\: unisim.vcomponents.FDSE
     port map (
      C => clk,
      CE => \crc_calc[31]_i_1_n_0\,
      D => \crc_calc[18]_i_1_n_0\,
      Q => crc_calc(18),
      S => Frame_buf_reg_i_3_n_0
    );
\crc_calc_reg[19]\: unisim.vcomponents.FDSE
     port map (
      C => clk,
      CE => \crc_calc[31]_i_1_n_0\,
      D => \crc_calc[19]_i_1_n_0\,
      Q => crc_calc(19),
      S => Frame_buf_reg_i_3_n_0
    );
\crc_calc_reg[1]\: unisim.vcomponents.FDSE
     port map (
      C => clk,
      CE => \crc_calc[31]_i_1_n_0\,
      D => \crc_calc[1]_i_1_n_0\,
      Q => crc_calc(1),
      S => Frame_buf_reg_i_3_n_0
    );
\crc_calc_reg[20]\: unisim.vcomponents.FDSE
     port map (
      C => clk,
      CE => \crc_calc[31]_i_1_n_0\,
      D => \crc_calc[20]_i_1_n_0\,
      Q => crc_calc(20),
      S => Frame_buf_reg_i_3_n_0
    );
\crc_calc_reg[21]\: unisim.vcomponents.FDSE
     port map (
      C => clk,
      CE => \crc_calc[31]_i_1_n_0\,
      D => \crc_calc[21]_i_1_n_0\,
      Q => crc_calc(21),
      S => Frame_buf_reg_i_3_n_0
    );
\crc_calc_reg[22]\: unisim.vcomponents.FDSE
     port map (
      C => clk,
      CE => \crc_calc[31]_i_1_n_0\,
      D => \crc_calc[22]_i_1_n_0\,
      Q => crc_calc(22),
      S => Frame_buf_reg_i_3_n_0
    );
\crc_calc_reg[23]\: unisim.vcomponents.FDSE
     port map (
      C => clk,
      CE => \crc_calc[31]_i_1_n_0\,
      D => \crc_calc[23]_i_1_n_0\,
      Q => crc_calc(23),
      S => Frame_buf_reg_i_3_n_0
    );
\crc_calc_reg[24]\: unisim.vcomponents.FDSE
     port map (
      C => clk,
      CE => \crc_calc[31]_i_1_n_0\,
      D => \crc_calc[24]_i_1_n_0\,
      Q => crc_calc(24),
      S => Frame_buf_reg_i_3_n_0
    );
\crc_calc_reg[25]\: unisim.vcomponents.FDSE
     port map (
      C => clk,
      CE => \crc_calc[31]_i_1_n_0\,
      D => \crc_calc[25]_i_1_n_0\,
      Q => crc_calc(25),
      S => Frame_buf_reg_i_3_n_0
    );
\crc_calc_reg[26]\: unisim.vcomponents.FDSE
     port map (
      C => clk,
      CE => \crc_calc[31]_i_1_n_0\,
      D => \crc_calc[26]_i_1_n_0\,
      Q => crc_calc(26),
      S => Frame_buf_reg_i_3_n_0
    );
\crc_calc_reg[27]\: unisim.vcomponents.FDSE
     port map (
      C => clk,
      CE => \crc_calc[31]_i_1_n_0\,
      D => \crc_calc[27]_i_1_n_0\,
      Q => crc_calc(27),
      S => Frame_buf_reg_i_3_n_0
    );
\crc_calc_reg[28]\: unisim.vcomponents.FDSE
     port map (
      C => clk,
      CE => \crc_calc[31]_i_1_n_0\,
      D => \crc_calc[28]_i_1_n_0\,
      Q => crc_calc(28),
      S => Frame_buf_reg_i_3_n_0
    );
\crc_calc_reg[29]\: unisim.vcomponents.FDSE
     port map (
      C => clk,
      CE => \crc_calc[31]_i_1_n_0\,
      D => \crc_calc[29]_i_1_n_0\,
      Q => crc_calc(29),
      S => Frame_buf_reg_i_3_n_0
    );
\crc_calc_reg[2]\: unisim.vcomponents.FDSE
     port map (
      C => clk,
      CE => \crc_calc[31]_i_1_n_0\,
      D => \crc_calc[2]_i_1_n_0\,
      Q => crc_calc(2),
      S => Frame_buf_reg_i_3_n_0
    );
\crc_calc_reg[30]\: unisim.vcomponents.FDSE
     port map (
      C => clk,
      CE => \crc_calc[31]_i_1_n_0\,
      D => \crc_calc[30]_i_1_n_0\,
      Q => crc_calc(30),
      S => Frame_buf_reg_i_3_n_0
    );
\crc_calc_reg[31]\: unisim.vcomponents.FDSE
     port map (
      C => clk,
      CE => \crc_calc[31]_i_1_n_0\,
      D => \crc_calc[31]_i_2_n_0\,
      Q => crc_calc(31),
      S => Frame_buf_reg_i_3_n_0
    );
\crc_calc_reg[3]\: unisim.vcomponents.FDSE
     port map (
      C => clk,
      CE => \crc_calc[31]_i_1_n_0\,
      D => \crc_calc[3]_i_1_n_0\,
      Q => crc_calc(3),
      S => Frame_buf_reg_i_3_n_0
    );
\crc_calc_reg[4]\: unisim.vcomponents.FDSE
     port map (
      C => clk,
      CE => \crc_calc[31]_i_1_n_0\,
      D => \crc_calc[4]_i_1_n_0\,
      Q => crc_calc(4),
      S => Frame_buf_reg_i_3_n_0
    );
\crc_calc_reg[5]\: unisim.vcomponents.FDSE
     port map (
      C => clk,
      CE => \crc_calc[31]_i_1_n_0\,
      D => \crc_calc[5]_i_1_n_0\,
      Q => crc_calc(5),
      S => Frame_buf_reg_i_3_n_0
    );
\crc_calc_reg[6]\: unisim.vcomponents.FDSE
     port map (
      C => clk,
      CE => \crc_calc[31]_i_1_n_0\,
      D => \crc_calc[6]_i_1_n_0\,
      Q => crc_calc(6),
      S => Frame_buf_reg_i_3_n_0
    );
\crc_calc_reg[7]\: unisim.vcomponents.FDSE
     port map (
      C => clk,
      CE => \crc_calc[31]_i_1_n_0\,
      D => \crc_calc[7]_i_1_n_0\,
      Q => crc_calc(7),
      S => Frame_buf_reg_i_3_n_0
    );
\crc_calc_reg[8]\: unisim.vcomponents.FDSE
     port map (
      C => clk,
      CE => \crc_calc[31]_i_1_n_0\,
      D => \crc_calc[8]_i_1_n_0\,
      Q => crc_calc(8),
      S => Frame_buf_reg_i_3_n_0
    );
\crc_calc_reg[9]\: unisim.vcomponents.FDSE
     port map (
      C => clk,
      CE => \crc_calc[31]_i_1_n_0\,
      D => \crc_calc[9]_i_1_n_0\,
      Q => crc_calc(9),
      S => Frame_buf_reg_i_3_n_0
    );
\crc_cnt[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"C0FFEA00"
    )
        port map (
      I0 => \st_reg_n_0_[2]\,
      I1 => \st_reg_n_0_[1]\,
      I2 => empty,
      I3 => \crc_cnt[2]_i_3_n_0\,
      I4 => crc_cnt(0),
      O => \crc_cnt[0]_i_1_n_0\
    );
\crc_cnt[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F4FFF800"
    )
        port map (
      I0 => crc_cnt(0),
      I1 => \st_reg_n_0_[2]\,
      I2 => \crc_cnt[2]_i_2_n_0\,
      I3 => \crc_cnt[2]_i_3_n_0\,
      I4 => crc_cnt(1),
      O => \crc_cnt[1]_i_1_n_0\
    );
\crc_cnt[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF70FFFFFF000000"
    )
        port map (
      I0 => crc_cnt(1),
      I1 => crc_cnt(0),
      I2 => \st_reg_n_0_[2]\,
      I3 => \crc_cnt[2]_i_2_n_0\,
      I4 => \crc_cnt[2]_i_3_n_0\,
      I5 => crc_cnt(2),
      O => \crc_cnt[2]_i_1_n_0\
    );
\crc_cnt[2]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => empty,
      I1 => \st_reg_n_0_[1]\,
      O => \crc_cnt[2]_i_2_n_0\
    );
\crc_cnt[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAFBAAF"
    )
        port map (
      I0 => \crc_rx[31]_i_4_n_0\,
      I1 => \payload_cnt[7]_i_3_n_0\,
      I2 => \st_reg_n_0_[1]\,
      I3 => \st_reg_n_0_[0]\,
      I4 => \st_reg_n_0_[2]\,
      I5 => empty,
      O => \crc_cnt[2]_i_3_n_0\
    );
\crc_cnt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \crc_cnt[0]_i_1_n_0\,
      Q => crc_cnt(0),
      R => Frame_buf_reg_i_3_n_0
    );
\crc_cnt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \crc_cnt[1]_i_1_n_0\,
      Q => crc_cnt(1),
      R => Frame_buf_reg_i_3_n_0
    );
\crc_cnt_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \crc_cnt[2]_i_1_n_0\,
      Q => crc_cnt(2),
      R => Frame_buf_reg_i_3_n_0
    );
\crc_rx[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF0200"
    )
        port map (
      I0 => \crc_rx[31]_i_3_n_0\,
      I1 => crc_cnt(2),
      I2 => crc_cnt(1),
      I3 => crc_cnt(0),
      I4 => \crc_rx[31]_i_4_n_0\,
      O => \crc_rx[15]_i_1_n_0\
    );
\crc_rx[23]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF0008"
    )
        port map (
      I0 => \crc_rx[31]_i_3_n_0\,
      I1 => crc_cnt(1),
      I2 => crc_cnt(2),
      I3 => crc_cnt(0),
      I4 => \crc_rx[31]_i_4_n_0\,
      O => \crc_rx[23]_i_1_n_0\
    );
\crc_rx[24]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \st_reg_n_0_[2]\,
      I1 => dout(0),
      I2 => \st_reg_n_0_[1]\,
      I3 => empty,
      O => \crc_rx[24]_i_1_n_0\
    );
\crc_rx[25]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \st_reg_n_0_[2]\,
      I1 => dout(1),
      I2 => \st_reg_n_0_[1]\,
      I3 => empty,
      O => \crc_rx[25]_i_1_n_0\
    );
\crc_rx[26]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \st_reg_n_0_[2]\,
      I1 => dout(2),
      I2 => \st_reg_n_0_[1]\,
      I3 => empty,
      O => \crc_rx[26]_i_1_n_0\
    );
\crc_rx[27]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \st_reg_n_0_[2]\,
      I1 => dout(3),
      I2 => \st_reg_n_0_[1]\,
      I3 => empty,
      O => \crc_rx[27]_i_1_n_0\
    );
\crc_rx[28]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \st_reg_n_0_[2]\,
      I1 => dout(4),
      I2 => \st_reg_n_0_[1]\,
      I3 => empty,
      O => \crc_rx[28]_i_1_n_0\
    );
\crc_rx[29]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \st_reg_n_0_[2]\,
      I1 => dout(5),
      I2 => \st_reg_n_0_[1]\,
      I3 => empty,
      O => \crc_rx[29]_i_1_n_0\
    );
\crc_rx[30]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \st_reg_n_0_[2]\,
      I1 => dout(6),
      I2 => \st_reg_n_0_[1]\,
      I3 => empty,
      O => \crc_rx[30]_i_1_n_0\
    );
\crc_rx[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF2000"
    )
        port map (
      I0 => crc_cnt(1),
      I1 => crc_cnt(2),
      I2 => crc_cnt(0),
      I3 => \crc_rx[31]_i_3_n_0\,
      I4 => \crc_rx[31]_i_4_n_0\,
      O => \crc_rx[31]_i_1_n_0\
    );
\crc_rx[31]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \st_reg_n_0_[2]\,
      I1 => dout(7),
      I2 => \st_reg_n_0_[1]\,
      I3 => empty,
      O => \crc_rx[31]_i_2_n_0\
    );
\crc_rx[31]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => \st_reg_n_0_[1]\,
      I1 => \st_reg_n_0_[0]\,
      I2 => empty,
      O => \crc_rx[31]_i_3_n_0\
    );
\crc_rx[31]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000011111511"
    )
        port map (
      I0 => \st_reg_n_0_[0]\,
      I1 => \st_reg_n_0_[1]\,
      I2 => empty,
      I3 => seq_cnt(0),
      I4 => seq_cnt(1),
      I5 => \st_reg_n_0_[2]\,
      O => \crc_rx[31]_i_4_n_0\
    );
\crc_rx[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF0002"
    )
        port map (
      I0 => \crc_rx[31]_i_3_n_0\,
      I1 => crc_cnt(2),
      I2 => crc_cnt(1),
      I3 => crc_cnt(0),
      I4 => \crc_rx[31]_i_4_n_0\,
      O => \crc_rx[7]_i_1_n_0\
    );
\crc_rx_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \crc_rx[7]_i_1_n_0\,
      D => \crc_rx[24]_i_1_n_0\,
      Q => crc_rx(0),
      R => Frame_buf_reg_i_3_n_0
    );
\crc_rx_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \crc_rx[15]_i_1_n_0\,
      D => \crc_rx[26]_i_1_n_0\,
      Q => crc_rx(10),
      R => Frame_buf_reg_i_3_n_0
    );
\crc_rx_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \crc_rx[15]_i_1_n_0\,
      D => \crc_rx[27]_i_1_n_0\,
      Q => crc_rx(11),
      R => Frame_buf_reg_i_3_n_0
    );
\crc_rx_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \crc_rx[15]_i_1_n_0\,
      D => \crc_rx[28]_i_1_n_0\,
      Q => crc_rx(12),
      R => Frame_buf_reg_i_3_n_0
    );
\crc_rx_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \crc_rx[15]_i_1_n_0\,
      D => \crc_rx[29]_i_1_n_0\,
      Q => crc_rx(13),
      R => Frame_buf_reg_i_3_n_0
    );
\crc_rx_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \crc_rx[15]_i_1_n_0\,
      D => \crc_rx[30]_i_1_n_0\,
      Q => crc_rx(14),
      R => Frame_buf_reg_i_3_n_0
    );
\crc_rx_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \crc_rx[15]_i_1_n_0\,
      D => \crc_rx[31]_i_2_n_0\,
      Q => crc_rx(15),
      R => Frame_buf_reg_i_3_n_0
    );
\crc_rx_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \crc_rx[23]_i_1_n_0\,
      D => \crc_rx[24]_i_1_n_0\,
      Q => crc_rx(16),
      R => Frame_buf_reg_i_3_n_0
    );
\crc_rx_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \crc_rx[23]_i_1_n_0\,
      D => \crc_rx[25]_i_1_n_0\,
      Q => crc_rx(17),
      R => Frame_buf_reg_i_3_n_0
    );
\crc_rx_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \crc_rx[23]_i_1_n_0\,
      D => \crc_rx[26]_i_1_n_0\,
      Q => crc_rx(18),
      R => Frame_buf_reg_i_3_n_0
    );
\crc_rx_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \crc_rx[23]_i_1_n_0\,
      D => \crc_rx[27]_i_1_n_0\,
      Q => crc_rx(19),
      R => Frame_buf_reg_i_3_n_0
    );
\crc_rx_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \crc_rx[7]_i_1_n_0\,
      D => \crc_rx[25]_i_1_n_0\,
      Q => crc_rx(1),
      R => Frame_buf_reg_i_3_n_0
    );
\crc_rx_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \crc_rx[23]_i_1_n_0\,
      D => \crc_rx[28]_i_1_n_0\,
      Q => crc_rx(20),
      R => Frame_buf_reg_i_3_n_0
    );
\crc_rx_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \crc_rx[23]_i_1_n_0\,
      D => \crc_rx[29]_i_1_n_0\,
      Q => crc_rx(21),
      R => Frame_buf_reg_i_3_n_0
    );
\crc_rx_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \crc_rx[23]_i_1_n_0\,
      D => \crc_rx[30]_i_1_n_0\,
      Q => crc_rx(22),
      R => Frame_buf_reg_i_3_n_0
    );
\crc_rx_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \crc_rx[23]_i_1_n_0\,
      D => \crc_rx[31]_i_2_n_0\,
      Q => crc_rx(23),
      R => Frame_buf_reg_i_3_n_0
    );
\crc_rx_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \crc_rx[31]_i_1_n_0\,
      D => \crc_rx[24]_i_1_n_0\,
      Q => crc_rx(24),
      R => Frame_buf_reg_i_3_n_0
    );
\crc_rx_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \crc_rx[31]_i_1_n_0\,
      D => \crc_rx[25]_i_1_n_0\,
      Q => crc_rx(25),
      R => Frame_buf_reg_i_3_n_0
    );
\crc_rx_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \crc_rx[31]_i_1_n_0\,
      D => \crc_rx[26]_i_1_n_0\,
      Q => crc_rx(26),
      R => Frame_buf_reg_i_3_n_0
    );
\crc_rx_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \crc_rx[31]_i_1_n_0\,
      D => \crc_rx[27]_i_1_n_0\,
      Q => crc_rx(27),
      R => Frame_buf_reg_i_3_n_0
    );
\crc_rx_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \crc_rx[31]_i_1_n_0\,
      D => \crc_rx[28]_i_1_n_0\,
      Q => crc_rx(28),
      R => Frame_buf_reg_i_3_n_0
    );
\crc_rx_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \crc_rx[31]_i_1_n_0\,
      D => \crc_rx[29]_i_1_n_0\,
      Q => crc_rx(29),
      R => Frame_buf_reg_i_3_n_0
    );
\crc_rx_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \crc_rx[7]_i_1_n_0\,
      D => \crc_rx[26]_i_1_n_0\,
      Q => crc_rx(2),
      R => Frame_buf_reg_i_3_n_0
    );
\crc_rx_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \crc_rx[31]_i_1_n_0\,
      D => \crc_rx[30]_i_1_n_0\,
      Q => crc_rx(30),
      R => Frame_buf_reg_i_3_n_0
    );
\crc_rx_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \crc_rx[31]_i_1_n_0\,
      D => \crc_rx[31]_i_2_n_0\,
      Q => crc_rx(31),
      R => Frame_buf_reg_i_3_n_0
    );
\crc_rx_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \crc_rx[7]_i_1_n_0\,
      D => \crc_rx[27]_i_1_n_0\,
      Q => crc_rx(3),
      R => Frame_buf_reg_i_3_n_0
    );
\crc_rx_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \crc_rx[7]_i_1_n_0\,
      D => \crc_rx[28]_i_1_n_0\,
      Q => crc_rx(4),
      R => Frame_buf_reg_i_3_n_0
    );
\crc_rx_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \crc_rx[7]_i_1_n_0\,
      D => \crc_rx[29]_i_1_n_0\,
      Q => crc_rx(5),
      R => Frame_buf_reg_i_3_n_0
    );
\crc_rx_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \crc_rx[7]_i_1_n_0\,
      D => \crc_rx[30]_i_1_n_0\,
      Q => crc_rx(6),
      R => Frame_buf_reg_i_3_n_0
    );
\crc_rx_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \crc_rx[7]_i_1_n_0\,
      D => \crc_rx[31]_i_2_n_0\,
      Q => crc_rx(7),
      R => Frame_buf_reg_i_3_n_0
    );
\crc_rx_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \crc_rx[15]_i_1_n_0\,
      D => \crc_rx[24]_i_1_n_0\,
      Q => crc_rx(8),
      R => Frame_buf_reg_i_3_n_0
    );
\crc_rx_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \crc_rx[15]_i_1_n_0\,
      D => \crc_rx[25]_i_1_n_0\,
      Q => crc_rx(9),
      R => Frame_buf_reg_i_3_n_0
    );
\payload_cnt[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"50C0"
    )
        port map (
      I0 => payload_cnt(0),
      I1 => empty,
      I2 => \st_reg_n_0_[1]\,
      I3 => \st_reg_n_0_[0]\,
      O => \p_2_in__0\(0)
    );
\payload_cnt[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"28280000FF000000"
    )
        port map (
      I0 => \payload_cnt[7]_i_3_n_0\,
      I1 => payload_cnt(1),
      I2 => payload_cnt(0),
      I3 => empty,
      I4 => \st_reg_n_0_[1]\,
      I5 => \st_reg_n_0_[0]\,
      O => \p_2_in__0\(1)
    );
\payload_cnt[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"82820000FF000000"
    )
        port map (
      I0 => \payload_cnt[7]_i_3_n_0\,
      I1 => payload_cnt(2),
      I2 => \payload_cnt[4]_i_4_n_0\,
      I3 => empty,
      I4 => \st_reg_n_0_[1]\,
      I5 => \st_reg_n_0_[0]\,
      O => \p_2_in__0\(2)
    );
\payload_cnt[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF80800880"
    )
        port map (
      I0 => \payload_cnt[7]_i_3_n_0\,
      I1 => \payload_cnt[4]_i_2_n_0\,
      I2 => payload_cnt(3),
      I3 => payload_cnt(2),
      I4 => \payload_cnt[4]_i_4_n_0\,
      I5 => \payload_cnt[4]_i_5_n_0\,
      O => \p_2_in__0\(3)
    );
\payload_cnt[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF80800880"
    )
        port map (
      I0 => \payload_cnt[7]_i_3_n_0\,
      I1 => \payload_cnt[4]_i_2_n_0\,
      I2 => payload_cnt(4),
      I3 => \payload_cnt[4]_i_3_n_0\,
      I4 => \payload_cnt[4]_i_4_n_0\,
      I5 => \payload_cnt[4]_i_5_n_0\,
      O => \p_2_in__0\(4)
    );
\payload_cnt[4]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \st_reg_n_0_[0]\,
      I1 => \st_reg_n_0_[1]\,
      O => \payload_cnt[4]_i_2_n_0\
    );
\payload_cnt[4]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => payload_cnt(2),
      I1 => payload_cnt(3),
      O => \payload_cnt[4]_i_3_n_0\
    );
\payload_cnt[4]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => payload_cnt(0),
      I1 => payload_cnt(1),
      O => \payload_cnt[4]_i_4_n_0\
    );
\payload_cnt[4]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => \st_reg_n_0_[0]\,
      I1 => \st_reg_n_0_[1]\,
      I2 => empty,
      O => \payload_cnt[4]_i_5_n_0\
    );
\payload_cnt[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8800F000"
    )
        port map (
      I0 => \payload_cnt[7]_i_3_n_0\,
      I1 => \payload_cnt[5]_i_2_n_0\,
      I2 => empty,
      I3 => \st_reg_n_0_[1]\,
      I4 => \st_reg_n_0_[0]\,
      O => \p_2_in__0\(5)
    );
\payload_cnt[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => payload_cnt(2),
      I1 => payload_cnt(3),
      I2 => payload_cnt(4),
      I3 => payload_cnt(1),
      I4 => payload_cnt(0),
      I5 => payload_cnt(5),
      O => \payload_cnt[5]_i_2_n_0\
    );
\payload_cnt[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"28280000FF000000"
    )
        port map (
      I0 => \payload_cnt[7]_i_3_n_0\,
      I1 => payload_cnt(6),
      I2 => \payload_cnt[6]_i_2_n_0\,
      I3 => empty,
      I4 => \st_reg_n_0_[1]\,
      I5 => \st_reg_n_0_[0]\,
      O => \p_2_in__0\(6)
    );
\payload_cnt[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => payload_cnt(4),
      I1 => payload_cnt(2),
      I2 => payload_cnt(3),
      I3 => payload_cnt(5),
      I4 => payload_cnt(0),
      I5 => payload_cnt(1),
      O => \payload_cnt[6]_i_2_n_0\
    );
\payload_cnt[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0055000000105555"
    )
        port map (
      I0 => \st_reg_n_0_[2]\,
      I1 => seq_cnt(1),
      I2 => seq_cnt(0),
      I3 => empty,
      I4 => \st_reg_n_0_[1]\,
      I5 => \st_reg_n_0_[0]\,
      O => \payload_cnt[7]_i_1_n_0\
    );
\payload_cnt[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"28280000FF000000"
    )
        port map (
      I0 => \payload_cnt[7]_i_3_n_0\,
      I1 => payload_cnt(7),
      I2 => \payload_cnt[7]_i_4_n_0\,
      I3 => empty,
      I4 => \st_reg_n_0_[1]\,
      I5 => \st_reg_n_0_[0]\,
      O => \p_2_in__0\(7)
    );
\payload_cnt[7]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => payload_cnt(4),
      I1 => payload_cnt(7),
      I2 => payload_cnt(2),
      I3 => payload_cnt(3),
      I4 => \payload_cnt[7]_i_5_n_0\,
      O => \payload_cnt[7]_i_3_n_0\
    );
\payload_cnt[7]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000800000000000"
    )
        port map (
      I0 => payload_cnt(4),
      I1 => payload_cnt(2),
      I2 => payload_cnt(3),
      I3 => payload_cnt(6),
      I4 => \payload_cnt[4]_i_4_n_0\,
      I5 => payload_cnt(5),
      O => \payload_cnt[7]_i_4_n_0\
    );
\payload_cnt[7]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => payload_cnt(5),
      I1 => payload_cnt(0),
      I2 => payload_cnt(1),
      I3 => payload_cnt(6),
      O => \payload_cnt[7]_i_5_n_0\
    );
\payload_cnt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \payload_cnt[7]_i_1_n_0\,
      D => \p_2_in__0\(0),
      Q => payload_cnt(0),
      R => Frame_buf_reg_i_3_n_0
    );
\payload_cnt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \payload_cnt[7]_i_1_n_0\,
      D => \p_2_in__0\(1),
      Q => payload_cnt(1),
      R => Frame_buf_reg_i_3_n_0
    );
\payload_cnt_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \payload_cnt[7]_i_1_n_0\,
      D => \p_2_in__0\(2),
      Q => payload_cnt(2),
      R => Frame_buf_reg_i_3_n_0
    );
\payload_cnt_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \payload_cnt[7]_i_1_n_0\,
      D => \p_2_in__0\(3),
      Q => payload_cnt(3),
      R => Frame_buf_reg_i_3_n_0
    );
\payload_cnt_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \payload_cnt[7]_i_1_n_0\,
      D => \p_2_in__0\(4),
      Q => payload_cnt(4),
      R => Frame_buf_reg_i_3_n_0
    );
\payload_cnt_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \payload_cnt[7]_i_1_n_0\,
      D => \p_2_in__0\(5),
      Q => payload_cnt(5),
      R => Frame_buf_reg_i_3_n_0
    );
\payload_cnt_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \payload_cnt[7]_i_1_n_0\,
      D => \p_2_in__0\(6),
      Q => payload_cnt(6),
      R => Frame_buf_reg_i_3_n_0
    );
\payload_cnt_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \payload_cnt[7]_i_1_n_0\,
      D => \p_2_in__0\(7),
      Q => payload_cnt(7),
      R => Frame_buf_reg_i_3_n_0
    );
rd_en_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"11150000"
    )
        port map (
      I0 => empty,
      I1 => \st_reg_n_0_[2]\,
      I2 => \st_reg_n_0_[1]\,
      I3 => \st_reg_n_0_[0]\,
      I4 => rst_n,
      O => rd_en_i_1_n_0
    );
rd_en_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rd_en_i_1_n_0,
      Q => rd_en,
      R => '0'
    );
\rd_ptr[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \st_reg_n_0_[1]\,
      I1 => rd_ptr_reg_rep(0),
      O => \rd_ptr[0]_i_1_n_0\
    );
\rd_ptr[10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \st_reg_n_0_[1]\,
      I1 => rd_ptr0(10),
      O => p_2_in(10)
    );
\rd_ptr[11]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \st_reg_n_0_[1]\,
      I1 => rd_ptr0(11),
      O => p_2_in(11)
    );
\rd_ptr[12]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \st_reg_n_0_[1]\,
      I1 => rd_ptr0(12),
      O => p_2_in(12)
    );
\rd_ptr[13]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \st_reg_n_0_[1]\,
      I1 => rd_ptr0(13),
      O => p_2_in(13)
    );
\rd_ptr[14]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \st_reg_n_0_[1]\,
      I1 => rd_ptr0(14),
      O => p_2_in(14)
    );
\rd_ptr[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000C00AA0000FF"
    )
        port map (
      I0 => \st1_carry__1_n_1\,
      I1 => s_axis_tvalid_i_3_n_0,
      I2 => \rd_ptr[15]_i_3_n_0\,
      I3 => \st_reg_n_0_[2]\,
      I4 => \st_reg_n_0_[0]\,
      I5 => \st_reg_n_0_[1]\,
      O => \rd_ptr[15]_i_1_n_0\
    );
\rd_ptr[15]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \st_reg_n_0_[1]\,
      I1 => rd_ptr0(15),
      O => p_2_in(15)
    );
\rd_ptr[15]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^s_axis_tvalid_reg_0\,
      I1 => s_axis_tready,
      O => \rd_ptr[15]_i_3_n_0\
    );
\rd_ptr[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \st_reg_n_0_[1]\,
      I1 => rd_ptr0(1),
      O => \rd_ptr[1]_i_1_n_0\
    );
\rd_ptr[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \st_reg_n_0_[1]\,
      I1 => rd_ptr0(2),
      O => \rd_ptr[2]_i_1_n_0\
    );
\rd_ptr[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \st_reg_n_0_[1]\,
      I1 => rd_ptr0(3),
      O => \rd_ptr[3]_i_1_n_0\
    );
\rd_ptr[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \st_reg_n_0_[1]\,
      I1 => rd_ptr0(4),
      O => \rd_ptr[4]_i_1_n_0\
    );
\rd_ptr[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \st_reg_n_0_[1]\,
      I1 => rd_ptr0(5),
      O => \rd_ptr[5]_i_1_n_0\
    );
\rd_ptr[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \st_reg_n_0_[1]\,
      I1 => rd_ptr0(6),
      O => \rd_ptr[6]_i_1_n_0\
    );
\rd_ptr[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \st_reg_n_0_[1]\,
      I1 => rd_ptr0(7),
      O => p_2_in(7)
    );
\rd_ptr[8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \st_reg_n_0_[1]\,
      I1 => rd_ptr0(8),
      O => p_2_in(8)
    );
\rd_ptr[9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \st_reg_n_0_[1]\,
      I1 => rd_ptr0(9),
      O => p_2_in(9)
    );
\rd_ptr_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rd_ptr[15]_i_1_n_0\,
      D => \rd_ptr[0]_i_1_n_0\,
      Q => rd_ptr_reg_rep(0),
      R => Frame_buf_reg_i_3_n_0
    );
\rd_ptr_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rd_ptr[15]_i_1_n_0\,
      D => p_2_in(10),
      Q => rd_ptr(10),
      R => Frame_buf_reg_i_3_n_0
    );
\rd_ptr_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rd_ptr[15]_i_1_n_0\,
      D => p_2_in(11),
      Q => rd_ptr(11),
      R => Frame_buf_reg_i_3_n_0
    );
\rd_ptr_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rd_ptr[15]_i_1_n_0\,
      D => p_2_in(12),
      Q => rd_ptr(12),
      R => Frame_buf_reg_i_3_n_0
    );
\rd_ptr_reg[12]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \rd_ptr_reg[8]_i_2_n_0\,
      CO(3) => \rd_ptr_reg[12]_i_2_n_0\,
      CO(2) => \rd_ptr_reg[12]_i_2_n_1\,
      CO(1) => \rd_ptr_reg[12]_i_2_n_2\,
      CO(0) => \rd_ptr_reg[12]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => rd_ptr0(12 downto 9),
      S(3 downto 0) => rd_ptr(12 downto 9)
    );
\rd_ptr_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rd_ptr[15]_i_1_n_0\,
      D => p_2_in(13),
      Q => rd_ptr(13),
      R => Frame_buf_reg_i_3_n_0
    );
\rd_ptr_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rd_ptr[15]_i_1_n_0\,
      D => p_2_in(14),
      Q => rd_ptr(14),
      R => Frame_buf_reg_i_3_n_0
    );
\rd_ptr_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rd_ptr[15]_i_1_n_0\,
      D => p_2_in(15),
      Q => rd_ptr(15),
      R => Frame_buf_reg_i_3_n_0
    );
\rd_ptr_reg[15]_i_4\: unisim.vcomponents.CARRY4
     port map (
      CI => \rd_ptr_reg[12]_i_2_n_0\,
      CO(3 downto 2) => \NLW_rd_ptr_reg[15]_i_4_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \rd_ptr_reg[15]_i_4_n_2\,
      CO(0) => \rd_ptr_reg[15]_i_4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_rd_ptr_reg[15]_i_4_O_UNCONNECTED\(3),
      O(2 downto 0) => rd_ptr0(15 downto 13),
      S(3) => '0',
      S(2 downto 0) => rd_ptr(15 downto 13)
    );
\rd_ptr_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rd_ptr[15]_i_1_n_0\,
      D => \rd_ptr[1]_i_1_n_0\,
      Q => rd_ptr_reg_rep(1),
      R => Frame_buf_reg_i_3_n_0
    );
\rd_ptr_reg[1]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \rd_ptr_reg[1]_i_2_n_0\,
      CO(2) => \rd_ptr_reg[1]_i_2_n_1\,
      CO(1) => \rd_ptr_reg[1]_i_2_n_2\,
      CO(0) => \rd_ptr_reg[1]_i_2_n_3\,
      CYINIT => rd_ptr_reg_rep(0),
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => rd_ptr0(4 downto 1),
      S(3 downto 0) => rd_ptr_reg_rep(4 downto 1)
    );
\rd_ptr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rd_ptr[15]_i_1_n_0\,
      D => \rd_ptr[2]_i_1_n_0\,
      Q => rd_ptr_reg_rep(2),
      R => Frame_buf_reg_i_3_n_0
    );
\rd_ptr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rd_ptr[15]_i_1_n_0\,
      D => \rd_ptr[3]_i_1_n_0\,
      Q => rd_ptr_reg_rep(3),
      R => Frame_buf_reg_i_3_n_0
    );
\rd_ptr_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rd_ptr[15]_i_1_n_0\,
      D => \rd_ptr[4]_i_1_n_0\,
      Q => rd_ptr_reg_rep(4),
      R => Frame_buf_reg_i_3_n_0
    );
\rd_ptr_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rd_ptr[15]_i_1_n_0\,
      D => \rd_ptr[5]_i_1_n_0\,
      Q => rd_ptr_reg_rep(5),
      R => Frame_buf_reg_i_3_n_0
    );
\rd_ptr_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rd_ptr[15]_i_1_n_0\,
      D => \rd_ptr[6]_i_1_n_0\,
      Q => rd_ptr_reg_rep(6),
      R => Frame_buf_reg_i_3_n_0
    );
\rd_ptr_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rd_ptr[15]_i_1_n_0\,
      D => p_2_in(7),
      Q => rd_ptr(7),
      R => Frame_buf_reg_i_3_n_0
    );
\rd_ptr_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rd_ptr[15]_i_1_n_0\,
      D => p_2_in(8),
      Q => rd_ptr(8),
      R => Frame_buf_reg_i_3_n_0
    );
\rd_ptr_reg[8]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \rd_ptr_reg[1]_i_2_n_0\,
      CO(3) => \rd_ptr_reg[8]_i_2_n_0\,
      CO(2) => \rd_ptr_reg[8]_i_2_n_1\,
      CO(1) => \rd_ptr_reg[8]_i_2_n_2\,
      CO(0) => \rd_ptr_reg[8]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => rd_ptr0(8 downto 5),
      S(3 downto 2) => rd_ptr(8 downto 7),
      S(1 downto 0) => rd_ptr_reg_rep(6 downto 5)
    );
\rd_ptr_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rd_ptr[15]_i_1_n_0\,
      D => p_2_in(9),
      Q => rd_ptr(9),
      R => Frame_buf_reg_i_3_n_0
    );
s_axis_tvalid_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EE226E2200000000"
    )
        port map (
      I0 => \^s_axis_tvalid_reg_0\,
      I1 => s_axis_tvalid_i_2_n_0,
      I2 => s_axis_tready,
      I3 => \st_reg_n_0_[2]\,
      I4 => s_axis_tvalid_i_3_n_0,
      I5 => rst_n,
      O => s_axis_tvalid_i_1_n_0
    );
s_axis_tvalid_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"41"
    )
        port map (
      I0 => \st_reg_n_0_[0]\,
      I1 => \st_reg_n_0_[2]\,
      I2 => \st_reg_n_0_[1]\,
      O => s_axis_tvalid_i_2_n_0
    );
s_axis_tvalid_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => s_axis_tvalid_i_4_n_0,
      I1 => s_axis_tvalid_i_5_n_0,
      I2 => s_axis_tvalid_i_6_n_0,
      I3 => s_axis_tvalid_i_7_n_0,
      O => s_axis_tvalid_i_3_n_0
    );
s_axis_tvalid_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFDF"
    )
        port map (
      I0 => rd_ptr_reg_rep(5),
      I1 => rd_ptr_reg_rep(4),
      I2 => rd_ptr_reg_rep(6),
      I3 => rd_ptr(7),
      O => s_axis_tvalid_i_4_n_0
    );
s_axis_tvalid_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF7F"
    )
        port map (
      I0 => rd_ptr_reg_rep(1),
      I1 => rd_ptr_reg_rep(0),
      I2 => rd_ptr_reg_rep(3),
      I3 => rd_ptr_reg_rep(2),
      O => s_axis_tvalid_i_5_n_0
    );
s_axis_tvalid_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => rd_ptr(13),
      I1 => rd_ptr(12),
      I2 => rd_ptr(15),
      I3 => rd_ptr(14),
      O => s_axis_tvalid_i_6_n_0
    );
s_axis_tvalid_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => rd_ptr(9),
      I1 => rd_ptr(8),
      I2 => rd_ptr(11),
      I3 => rd_ptr(10),
      O => s_axis_tvalid_i_7_n_0
    );
s_axis_tvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_axis_tvalid_i_1_n_0,
      Q => \^s_axis_tvalid_reg_0\,
      R => '0'
    );
\seq_cnt[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EE62626200000000"
    )
        port map (
      I0 => seq_cnt(0),
      I1 => \seq_cnt[1]_i_2_n_0\,
      I2 => \st_reg_n_0_[1]\,
      I3 => empty,
      I4 => \st_reg_n_0_[0]\,
      I5 => rst_n,
      O => \seq_cnt[0]_i_1_n_0\
    );
\seq_cnt[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEE22A200000000"
    )
        port map (
      I0 => seq_cnt(1),
      I1 => \seq_cnt[1]_i_2_n_0\,
      I2 => \st_reg_n_0_[1]\,
      I3 => seq_cnt(0),
      I4 => \seq_cnt[1]_i_3_n_0\,
      I5 => rst_n,
      O => \seq_cnt[1]_i_1_n_0\
    );
\seq_cnt[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0005050D"
    )
        port map (
      I0 => \st_reg_n_0_[0]\,
      I1 => Frame_buf_reg_i_6_n_0,
      I2 => \st_reg_n_0_[2]\,
      I3 => empty,
      I4 => \st_reg_n_0_[1]\,
      O => \seq_cnt[1]_i_2_n_0\
    );
\seq_cnt[1]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => empty,
      I1 => \st_reg_n_0_[0]\,
      O => \seq_cnt[1]_i_3_n_0\
    );
\seq_cnt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \seq_cnt[0]_i_1_n_0\,
      Q => seq_cnt(0),
      R => '0'
    );
\seq_cnt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \seq_cnt[1]_i_1_n_0\,
      Q => seq_cnt(1),
      R => '0'
    );
st1_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => st1_carry_n_0,
      CO(2) => st1_carry_n_1,
      CO(1) => st1_carry_n_2,
      CO(0) => st1_carry_n_3,
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => NLW_st1_carry_O_UNCONNECTED(3 downto 0),
      S(3) => st1_carry_i_1_n_0,
      S(2) => st1_carry_i_2_n_0,
      S(1) => st1_carry_i_3_n_0,
      S(0) => st1_carry_i_4_n_0
    );
\st1_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => st1_carry_n_0,
      CO(3) => \st1_carry__0_n_0\,
      CO(2) => \st1_carry__0_n_1\,
      CO(1) => \st1_carry__0_n_2\,
      CO(0) => \st1_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_st1_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \st1_carry__0_i_1_n_0\,
      S(2) => \st1_carry__0_i_2_n_0\,
      S(1) => \st1_carry__0_i_3_n_0\,
      S(0) => \st1_carry__0_i_4_n_0\
    );
\st1_carry__0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000066006600000"
    )
        port map (
      I0 => crc_rx(23),
      I1 => crc_calc(23),
      I2 => crc_rx(22),
      I3 => crc_calc(22),
      I4 => crc_calc(21),
      I5 => crc_rx(21),
      O => \st1_carry__0_i_1_n_0\
    );
\st1_carry__0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000066006600000"
    )
        port map (
      I0 => crc_rx(20),
      I1 => crc_calc(20),
      I2 => crc_rx(19),
      I3 => crc_calc(19),
      I4 => crc_calc(18),
      I5 => crc_rx(18),
      O => \st1_carry__0_i_2_n_0\
    );
\st1_carry__0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000066006600000"
    )
        port map (
      I0 => crc_rx(17),
      I1 => crc_calc(17),
      I2 => crc_rx(16),
      I3 => crc_calc(16),
      I4 => crc_calc(15),
      I5 => crc_rx(15),
      O => \st1_carry__0_i_3_n_0\
    );
\st1_carry__0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000066006600000"
    )
        port map (
      I0 => crc_rx(14),
      I1 => crc_calc(14),
      I2 => crc_rx(13),
      I3 => crc_calc(13),
      I4 => crc_calc(12),
      I5 => crc_rx(12),
      O => \st1_carry__0_i_4_n_0\
    );
\st1_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \st1_carry__0_n_0\,
      CO(3) => \NLW_st1_carry__1_CO_UNCONNECTED\(3),
      CO(2) => \st1_carry__1_n_1\,
      CO(1) => \st1_carry__1_n_2\,
      CO(0) => \st1_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_st1_carry__1_O_UNCONNECTED\(3 downto 0),
      S(3) => '0',
      S(2) => \st1_carry__1_i_1_n_0\,
      S(1) => \st1_carry__1_i_2_n_0\,
      S(0) => \st1_carry__1_i_3_n_0\
    );
\st1_carry__1_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0660"
    )
        port map (
      I0 => crc_calc(30),
      I1 => crc_rx(30),
      I2 => crc_calc(31),
      I3 => crc_rx(31),
      O => \st1_carry__1_i_1_n_0\
    );
\st1_carry__1_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000066006600000"
    )
        port map (
      I0 => crc_rx(29),
      I1 => crc_calc(29),
      I2 => crc_rx(28),
      I3 => crc_calc(28),
      I4 => crc_calc(27),
      I5 => crc_rx(27),
      O => \st1_carry__1_i_2_n_0\
    );
\st1_carry__1_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000066006600000"
    )
        port map (
      I0 => crc_rx(26),
      I1 => crc_calc(26),
      I2 => crc_rx(25),
      I3 => crc_calc(25),
      I4 => crc_calc(24),
      I5 => crc_rx(24),
      O => \st1_carry__1_i_3_n_0\
    );
st1_carry_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000066006600000"
    )
        port map (
      I0 => crc_rx(11),
      I1 => crc_calc(11),
      I2 => crc_rx(10),
      I3 => crc_calc(10),
      I4 => crc_calc(9),
      I5 => crc_rx(9),
      O => st1_carry_i_1_n_0
    );
st1_carry_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000066006600000"
    )
        port map (
      I0 => crc_rx(8),
      I1 => crc_calc(8),
      I2 => crc_rx(7),
      I3 => crc_calc(7),
      I4 => crc_calc(6),
      I5 => crc_rx(6),
      O => st1_carry_i_2_n_0
    );
st1_carry_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000066006600000"
    )
        port map (
      I0 => crc_rx(5),
      I1 => crc_calc(5),
      I2 => crc_rx(4),
      I3 => crc_calc(4),
      I4 => crc_calc(3),
      I5 => crc_rx(3),
      O => st1_carry_i_3_n_0
    );
st1_carry_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000066006600000"
    )
        port map (
      I0 => crc_rx(2),
      I1 => crc_calc(2),
      I2 => crc_rx(1),
      I3 => crc_calc(1),
      I4 => crc_calc(0),
      I5 => crc_rx(0),
      O => st1_carry_i_4_n_0
    );
\st[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00FFFFFF040000"
    )
        port map (
      I0 => \st[0]_i_2_n_0\,
      I1 => \st_reg_n_0_[2]\,
      I2 => \st_reg_n_0_[1]\,
      I3 => \st[0]_i_3_n_0\,
      I4 => \st[2]_i_3_n_0\,
      I5 => \st_reg_n_0_[0]\,
      O => \st[0]_i_1_n_0\
    );
\st[0]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"DF"
    )
        port map (
      I0 => crc_cnt(1),
      I1 => crc_cnt(2),
      I2 => crc_cnt(0),
      O => \st[0]_i_2_n_0\
    );
\st[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAFAAABBAA"
    )
        port map (
      I0 => \st[0]_i_4_n_0\,
      I1 => \st[0]_i_5_n_0\,
      I2 => \payload_cnt[7]_i_3_n_0\,
      I3 => \st_reg_n_0_[1]\,
      I4 => \st_reg_n_0_[0]\,
      I5 => \st_reg_n_0_[2]\,
      O => \st[0]_i_3_n_0\
    );
\st[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000010000000000"
    )
        port map (
      I0 => \st_reg_n_0_[1]\,
      I1 => \st_reg_n_0_[0]\,
      I2 => \st_reg_n_0_[2]\,
      I3 => dout(1),
      I4 => dout(0),
      I5 => Frame_buf_reg_i_7_n_0,
      O => \st[0]_i_4_n_0\
    );
\st[0]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => seq_cnt(1),
      I1 => seq_cnt(0),
      O => \st[0]_i_5_n_0\
    );
\st[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF51FFFFFF000000"
    )
        port map (
      I0 => \st_reg_n_0_[0]\,
      I1 => \st_reg_n_0_[2]\,
      I2 => s_axis_tvalid_i_3_n_0,
      I3 => \st[1]_i_2_n_0\,
      I4 => \st[2]_i_3_n_0\,
      I5 => \st_reg_n_0_[1]\,
      O => \st[1]_i_1_n_0\
    );
\st[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00C0AAF000C0AA00"
    )
        port map (
      I0 => \payload_cnt[7]_i_3_n_0\,
      I1 => \st1_carry__1_n_1\,
      I2 => \st_reg_n_0_[0]\,
      I3 => \st_reg_n_0_[1]\,
      I4 => \st_reg_n_0_[2]\,
      I5 => Frame_buf_reg_i_6_n_0,
      O => \st[1]_i_2_n_0\
    );
\st[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \st[2]_i_2_n_0\,
      I1 => \st[2]_i_3_n_0\,
      I2 => \st_reg_n_0_[2]\,
      O => \st[2]_i_1_n_0\
    );
\st[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0C8C008C3C8C308C"
    )
        port map (
      I0 => s_axis_tvalid_i_3_n_0,
      I1 => \st_reg_n_0_[2]\,
      I2 => \st_reg_n_0_[1]\,
      I3 => \st_reg_n_0_[0]\,
      I4 => \st1_carry__1_n_1\,
      I5 => \payload_cnt[7]_i_3_n_0\,
      O => \st[2]_i_2_n_0\
    );
\st[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF00FF80D500FF"
    )
        port map (
      I0 => \st_reg_n_0_[1]\,
      I1 => s_axis_tready,
      I2 => \^s_axis_tvalid_reg_0\,
      I3 => empty,
      I4 => \st_reg_n_0_[2]\,
      I5 => \st_reg_n_0_[0]\,
      O => \st[2]_i_3_n_0\
    );
\st_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \st[0]_i_1_n_0\,
      Q => \st_reg_n_0_[0]\,
      R => Frame_buf_reg_i_3_n_0
    );
\st_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \st[1]_i_1_n_0\,
      Q => \st_reg_n_0_[1]\,
      R => Frame_buf_reg_i_3_n_0
    );
\st_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \st[2]_i_1_n_0\,
      Q => \st_reg_n_0_[2]\,
      R => Frame_buf_reg_i_3_n_0
    );
wr_ptr0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => wr_ptr0_carry_n_0,
      CO(2) => wr_ptr0_carry_n_1,
      CO(1) => wr_ptr0_carry_n_2,
      CO(0) => wr_ptr0_carry_n_3,
      CYINIT => \wr_ptr_reg_n_0_[0]\,
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(4 downto 1),
      S(3) => \wr_ptr_reg_n_0_[4]\,
      S(2) => \wr_ptr_reg_n_0_[3]\,
      S(1) => \wr_ptr_reg_n_0_[2]\,
      S(0) => \wr_ptr_reg_n_0_[1]\
    );
\wr_ptr0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => wr_ptr0_carry_n_0,
      CO(3 downto 1) => \NLW_wr_ptr0_carry__0_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \wr_ptr0_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => \NLW_wr_ptr0_carry__0_O_UNCONNECTED\(3 downto 2),
      O(1 downto 0) => data0(6 downto 5),
      S(3 downto 2) => B"00",
      S(1) => \wr_ptr_reg_n_0_[6]\,
      S(0) => \wr_ptr_reg_n_0_[5]\
    );
\wr_ptr[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \wr_ptr[6]_i_3_n_0\,
      I1 => \wr_ptr_reg_n_0_[0]\,
      O => \wr_ptr[0]_i_1_n_0\
    );
\wr_ptr[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \wr_ptr[6]_i_3_n_0\,
      I1 => data0(1),
      O => \wr_ptr[1]_i_1_n_0\
    );
\wr_ptr[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \wr_ptr[6]_i_3_n_0\,
      I1 => data0(2),
      O => \wr_ptr[2]_i_1_n_0\
    );
\wr_ptr[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \wr_ptr[6]_i_3_n_0\,
      I1 => data0(3),
      O => \wr_ptr[3]_i_1_n_0\
    );
\wr_ptr[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \wr_ptr[6]_i_3_n_0\,
      I1 => data0(4),
      O => \wr_ptr[4]_i_1_n_0\
    );
\wr_ptr[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \wr_ptr[6]_i_3_n_0\,
      I1 => data0(5),
      O => \wr_ptr[5]_i_1_n_0\
    );
\wr_ptr[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"011F011B"
    )
        port map (
      I0 => \st_reg_n_0_[1]\,
      I1 => \st_reg_n_0_[0]\,
      I2 => empty,
      I3 => \st_reg_n_0_[2]\,
      I4 => Frame_buf_reg_i_6_n_0,
      O => \wr_ptr[6]_i_1_n_0\
    );
\wr_ptr[6]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \wr_ptr[6]_i_3_n_0\,
      I1 => data0(6),
      O => \wr_ptr[6]_i_2_n_0\
    );
\wr_ptr[6]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEEEEEEEEFEEEEE"
    )
        port map (
      I0 => \wr_ptr[6]_i_4_n_0\,
      I1 => \st_reg_n_0_[2]\,
      I2 => \wr_ptr[6]_i_5_n_0\,
      I3 => dout(0),
      I4 => dout(1),
      I5 => dout(2),
      O => \wr_ptr[6]_i_3_n_0\
    );
\wr_ptr[6]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \st_reg_n_0_[0]\,
      I1 => \st_reg_n_0_[1]\,
      O => \wr_ptr[6]_i_4_n_0\
    );
\wr_ptr[6]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000002000000000"
    )
        port map (
      I0 => dout(3),
      I1 => dout(4),
      I2 => dout(5),
      I3 => dout(6),
      I4 => empty,
      I5 => dout(7),
      O => \wr_ptr[6]_i_5_n_0\
    );
\wr_ptr_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \wr_ptr[6]_i_1_n_0\,
      D => \wr_ptr[0]_i_1_n_0\,
      Q => \wr_ptr_reg_n_0_[0]\,
      R => Frame_buf_reg_i_3_n_0
    );
\wr_ptr_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \wr_ptr[6]_i_1_n_0\,
      D => \wr_ptr[1]_i_1_n_0\,
      Q => \wr_ptr_reg_n_0_[1]\,
      R => Frame_buf_reg_i_3_n_0
    );
\wr_ptr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \wr_ptr[6]_i_1_n_0\,
      D => \wr_ptr[2]_i_1_n_0\,
      Q => \wr_ptr_reg_n_0_[2]\,
      R => Frame_buf_reg_i_3_n_0
    );
\wr_ptr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \wr_ptr[6]_i_1_n_0\,
      D => \wr_ptr[3]_i_1_n_0\,
      Q => \wr_ptr_reg_n_0_[3]\,
      R => Frame_buf_reg_i_3_n_0
    );
\wr_ptr_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \wr_ptr[6]_i_1_n_0\,
      D => \wr_ptr[4]_i_1_n_0\,
      Q => \wr_ptr_reg_n_0_[4]\,
      R => Frame_buf_reg_i_3_n_0
    );
\wr_ptr_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \wr_ptr[6]_i_1_n_0\,
      D => \wr_ptr[5]_i_1_n_0\,
      Q => \wr_ptr_reg_n_0_[5]\,
      R => Frame_buf_reg_i_3_n_0
    );
\wr_ptr_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \wr_ptr[6]_i_1_n_0\,
      D => \wr_ptr[6]_i_2_n_0\,
      Q => \wr_ptr_reg_n_0_[6]\,
      R => Frame_buf_reg_i_3_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_wrapper_fifo_axi_0_1 is
  port (
    clk : in STD_LOGIC;
    rst_n : in STD_LOGIC;
    empty : in STD_LOGIC;
    dout : in STD_LOGIC_VECTOR ( 7 downto 0 );
    rd_en : out STD_LOGIC;
    s_axis_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_tvalid : out STD_LOGIC;
    s_axis_tready : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_wrapper_fifo_axi_0_1 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_wrapper_fifo_axi_0_1 : entity is "design_1_wrapper_fifo_axi_0_1,wrapper_fifo_axi,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_wrapper_fifo_axi_0_1 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_wrapper_fifo_axi_0_1 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_wrapper_fifo_axi_0_1 : entity is "wrapper_fifo_axi,Vivado 2022.2";
end design_1_wrapper_fifo_axi_0_1;

architecture STRUCTURE of design_1_wrapper_fifo_axi_0_1 is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, ASSOCIATED_BUSIF s_axis, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of rst_n : signal is "xilinx.com:signal:reset:1.0 rst_n RST";
  attribute X_INTERFACE_PARAMETER of rst_n : signal is "XIL_INTERFACENAME rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axis_tready : signal is "xilinx.com:interface:axis:1.0 s_axis TREADY";
  attribute X_INTERFACE_PARAMETER of s_axis_tready : signal is "XIL_INTERFACENAME s_axis, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 125000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 s_axis TVALID";
  attribute X_INTERFACE_INFO of s_axis_tdata : signal is "xilinx.com:interface:axis:1.0 s_axis TDATA";
begin
inst: entity work.design_1_wrapper_fifo_axi_0_1_wrapper_fifo_axi
     port map (
      clk => clk,
      dout(7 downto 0) => dout(7 downto 0),
      empty => empty,
      rd_en => rd_en,
      rst_n => rst_n,
      s_axis_tdata(7 downto 0) => s_axis_tdata(7 downto 0),
      s_axis_tready => s_axis_tready,
      s_axis_tvalid_reg_0 => s_axis_tvalid
    );
end STRUCTURE;
