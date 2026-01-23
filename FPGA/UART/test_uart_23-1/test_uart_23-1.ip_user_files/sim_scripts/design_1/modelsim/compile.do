vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/fifo_generator_v13_2_7
vlib modelsim_lib/msim/xlconstant_v1_1_7

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap fifo_generator_v13_2_7 modelsim_lib/msim/fifo_generator_v13_2_7
vmap xlconstant_v1_1_7 modelsim_lib/msim/xlconstant_v1_1_7

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../test_uart_23-1.gen/sources_1/bd/design_1/ipshared/7698" \
"../../../bd/design_1/ip/design_1_uart_rx_0_0/sim/design_1_uart_rx_0_0.v" \
"../../../bd/design_1/ip/design_1_uart_tx_0_0/sim/design_1_uart_tx_0_0.v" \

vlog -work fifo_generator_v13_2_7  -incr -mfcu  "+incdir+../../../../test_uart_23-1.gen/sources_1/bd/design_1/ipshared/7698" \
"../../../../test_uart_23-1.gen/sources_1/bd/design_1/ipshared/83df/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_7  -93  \
"../../../../test_uart_23-1.gen/sources_1/bd/design_1/ipshared/83df/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_7  -incr -mfcu  "+incdir+../../../../test_uart_23-1.gen/sources_1/bd/design_1/ipshared/7698" \
"../../../../test_uart_23-1.gen/sources_1/bd/design_1/ipshared/83df/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../test_uart_23-1.gen/sources_1/bd/design_1/ipshared/7698" \
"../../../bd/design_1/ip/design_1_fifo_generator_0_0/sim/design_1_fifo_generator_0_0.v" \
"../../../bd/design_1/ip/design_1_wrapper_rx_fifo_0_0/sim/design_1_wrapper_rx_fifo_0_0.v" \
"../../../bd/design_1/ip/design_1_wrapper_tx_fifo_0_0/sim/design_1_wrapper_tx_fifo_0_0.v" \
"../../../bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0.v" \

vlog -work xlconstant_v1_1_7  -incr -mfcu  "+incdir+../../../../test_uart_23-1.gen/sources_1/bd/design_1/ipshared/7698" \
"../../../../test_uart_23-1.gen/sources_1/bd/design_1/ipshared/badb/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../test_uart_23-1.gen/sources_1/bd/design_1/ipshared/7698" \
"../../../bd/design_1/ip/design_1_xlconstant_0_0/sim/design_1_xlconstant_0_0.v" \
"../../../bd/design_1/ip/design_1_test_led_0_0/sim/design_1_test_led_0_0.v" \
"../../../bd/design_1/sim/design_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

