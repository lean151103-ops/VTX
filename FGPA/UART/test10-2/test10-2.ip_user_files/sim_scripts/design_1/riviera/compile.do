vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/fifo_generator_v13_2_7
vlib riviera/axis_infrastructure_v1_1_0
vlib riviera/axis_data_fifo_v2_0_9
vlib riviera/xlconstant_v1_1_7

vmap xil_defaultlib riviera/xil_defaultlib
vmap fifo_generator_v13_2_7 riviera/fifo_generator_v13_2_7
vmap axis_infrastructure_v1_1_0 riviera/axis_infrastructure_v1_1_0
vmap axis_data_fifo_v2_0_9 riviera/axis_data_fifo_v2_0_9
vmap xlconstant_v1_1_7 riviera/xlconstant_v1_1_7

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../test10-2.gen/sources_1/bd/design_1/ipshared/8713/hdl" "+incdir+../../../../test10-2.gen/sources_1/bd/design_1/ipshared/7698" \
"../../../bd/design_1/ip/design_1_wrapper_rx_fifo_0_0/sim/design_1_wrapper_rx_fifo_0_0.v" \

vlog -work fifo_generator_v13_2_7  -v2k5 "+incdir+../../../../test10-2.gen/sources_1/bd/design_1/ipshared/8713/hdl" "+incdir+../../../../test10-2.gen/sources_1/bd/design_1/ipshared/7698" \
"../../../../test10-2.gen/sources_1/bd/design_1/ipshared/83df/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_7 -93  \
"../../../../test10-2.gen/sources_1/bd/design_1/ipshared/83df/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_7  -v2k5 "+incdir+../../../../test10-2.gen/sources_1/bd/design_1/ipshared/8713/hdl" "+incdir+../../../../test10-2.gen/sources_1/bd/design_1/ipshared/7698" \
"../../../../test10-2.gen/sources_1/bd/design_1/ipshared/83df/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../test10-2.gen/sources_1/bd/design_1/ipshared/8713/hdl" "+incdir+../../../../test10-2.gen/sources_1/bd/design_1/ipshared/7698" \
"../../../bd/design_1/ip/design_1_fifo_generator_0_0/sim/design_1_fifo_generator_0_0.v" \

vlog -work axis_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../test10-2.gen/sources_1/bd/design_1/ipshared/8713/hdl" "+incdir+../../../../test10-2.gen/sources_1/bd/design_1/ipshared/7698" \
"../../../../test10-2.gen/sources_1/bd/design_1/ipshared/8713/hdl/axis_infrastructure_v1_1_vl_rfs.v" \

vlog -work axis_data_fifo_v2_0_9  -v2k5 "+incdir+../../../../test10-2.gen/sources_1/bd/design_1/ipshared/8713/hdl" "+incdir+../../../../test10-2.gen/sources_1/bd/design_1/ipshared/7698" \
"../../../../test10-2.gen/sources_1/bd/design_1/ipshared/dbd8/hdl/axis_data_fifo_v2_0_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../test10-2.gen/sources_1/bd/design_1/ipshared/8713/hdl" "+incdir+../../../../test10-2.gen/sources_1/bd/design_1/ipshared/7698" \
"../../../bd/design_1/ip/design_1_axis_data_fifo_0_0/sim/design_1_axis_data_fifo_0_0.v" \
"../../../bd/design_1/ip/design_1_wrapper_fifo_axi_0_1/sim/design_1_wrapper_fifo_axi_0_1.v" \
"../../../bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0.v" \
"../../../bd/design_1/ip/design_1_uart_rx_0_0/sim/design_1_uart_rx_0_0.v" \
"../../../bd/design_1/sim/design_1.v" \

vlog -work xlconstant_v1_1_7  -v2k5 "+incdir+../../../../test10-2.gen/sources_1/bd/design_1/ipshared/8713/hdl" "+incdir+../../../../test10-2.gen/sources_1/bd/design_1/ipshared/7698" \
"../../../../test10-2.gen/sources_1/bd/design_1/ipshared/badb/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../test10-2.gen/sources_1/bd/design_1/ipshared/8713/hdl" "+incdir+../../../../test10-2.gen/sources_1/bd/design_1/ipshared/7698" \
"../../../bd/design_1/ip/design_1_xlconstant_0_0/sim/design_1_xlconstant_0_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

