set_property PACKAGE_PIN W15 [get_ports TX_0]
set_property PACKAGE_PIN V15 [get_ports i_rx_0]
set_property IOSTANDARD LVCMOS33 [get_ports TX_0]
set_property IOSTANDARD LVCMOS33 [get_ports i_rx_0]

##Clock signal
set_property -dict {PACKAGE_PIN K17 IOSTANDARD LVCMOS33} [get_ports clk_in1_0]
create_clock -period 8.000 -name sys_clk_pin -waveform {0.000 4.000} -add [get_ports clk_in1_0]


set_property PACKAGE_PIN D18 [get_ports led_0]
set_property IOSTANDARD LVCMOS33 [get_ports led_0]
