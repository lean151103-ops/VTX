# VTX
8/1/2026
FPGA/UART: 2 IP core uart_rx and  uart_tx
UART_loopback.py is using for testing 2 IP Core
---- mistake: Line 43 in uart_rx.v 
--------------- if (rx == 1) : Wrong
--------------- replace with: if (rx == 0) 
