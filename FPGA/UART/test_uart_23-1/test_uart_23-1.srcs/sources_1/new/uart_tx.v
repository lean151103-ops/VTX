`timescale 10ns / 10ps

module uart_tx #(
    parameter CLOCK_UART = 1085
)(
    input  wire       tclock,
    input  wire       tenable,
    input  wire [7:0] tdin,
    output reg        tdone,
    output reg        TX
);

/********************************************
******  parameter  ************************
*******************************************/
localparam IDLE_STATE  = 2'b00;
localparam START_STATE = 2'b01;
localparam DATA_STATE  = 2'b10;
localparam STOP_STATE  = 2'b11;

reg [1:0] state_tx = IDLE_STATE;
integer clk_count_tx = 0;
integer bit_index_tx = 0;

/******************************************/
/*********** transmit ****************/
always @(posedge tclock) begin
    case (state_tx)
        IDLE_STATE: begin
            TX           = 1'b1;
            clk_count_tx = 0;
            tdone        = 1'b0;
            bit_index_tx = 0;

            if (tenable == 1'b1) begin
                state_tx = START_STATE;
            end else begin
                state_tx = IDLE_STATE;
            end
        end

        START_STATE: begin
            TX = 1'b0;  // keo xuong khoi idle
            if (clk_count_tx < CLOCK_UART) begin
                clk_count_tx = clk_count_tx + 1;
                state_tx     = START_STATE;
            end else begin
                clk_count_tx = 0;
                state_tx     = DATA_STATE;
            end
        end

        DATA_STATE: begin
            TX = tdin[bit_index_tx];

            if (clk_count_tx < CLOCK_UART) begin
                clk_count_tx = clk_count_tx + 1;
                state_tx     = DATA_STATE;
            end else begin
                if (bit_index_tx < 7) begin
                    bit_index_tx = bit_index_tx + 1;
                    state_tx     = DATA_STATE;
                end else begin
                    bit_index_tx = 0;
                    state_tx     = STOP_STATE;
                end
                clk_count_tx = 0;
            end
        end

        STOP_STATE: begin
            TX = 1'b1;

            if (clk_count_tx < CLOCK_UART) begin
                clk_count_tx = clk_count_tx + 1;
                state_tx     = STOP_STATE;
            end else begin
                tdone        = 1'b1;
                clk_count_tx = 0;
                state_tx     = IDLE_STATE;
            end
        end

        default: begin
        end
    endcase
end

endmodule
