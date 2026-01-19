`timescale 1ns / 1ps

module wrapper_rx_fifo(
    input wire clk,
    input wire rst_n,
    input wire [7:0] data_byte,
    input wire data_avail,
    input wire full,
    output reg wr_en,
    output reg [7:0] din
    );
    always @(posedge clk) begin
        if (!rst_n) begin
            wr_en <= 1'b0;
            din   <= 8'd0;
        end else begin
            wr_en <= data_avail && !full; 
            if (data_avail && !full)
                din <= data_byte;
        end
    end
endmodule
