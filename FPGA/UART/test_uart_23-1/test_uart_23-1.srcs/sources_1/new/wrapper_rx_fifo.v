`timescale 1ns / 1ps

module wrapper_rx_fifo(
    input wire rx_avail,
    input wire [7:0] data_byte,
    input wire full,
    output wire wr_en,
    output wire [7:0] din
    );
    assign din = data_byte;
    assign wr_en = rx_avail && !full;
endmodule
