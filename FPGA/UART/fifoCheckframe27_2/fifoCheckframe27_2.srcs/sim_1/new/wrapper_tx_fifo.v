`timescale 10ns / 10ps

module wrapper_tx_fifo (
    input  wire       clk,
    input  wire       rst_n,

    input  wire       fifo_empty,
    input  wire [7:0] fifo_dout,
    output reg        fifo_rd_en,

    output reg        tx_tenable,
    output reg  [7:0] tx_tdin,
    input  wire       tx_tdone
);

    localparam S_IDLE = 1'b0;
    localparam S_BUSY = 1'b1;

    reg st;
    reg tx_busy;

    initial begin
        st         = S_IDLE;
        tx_busy    = 1'b0;
        fifo_rd_en = 1'b0;
        tx_tenable = 1'b0;
        tx_tdin    = 8'h00;
    end

    always @(posedge clk) begin
        if (!rst_n) begin
            fifo_rd_en <= 1'b0;
            tx_tenable <= 1'b0;
            tx_tdin    <= 8'h00;
            st         <= S_IDLE;
            tx_busy    <= 1'b0;
        end else begin
            fifo_rd_en <= 1'b0;
            tx_tenable <= 1'b0;

            if (tx_tenable)
                tx_busy <= 1'b1;
            else if (tx_tdone)
                tx_busy <= 1'b0;

            case (st)
                S_IDLE: begin
                    if (!fifo_empty && !tx_busy) begin
                        tx_tdin    <= fifo_dout;
                        tx_tenable <= 1'b1;
                        fifo_rd_en <= 1'b1;
                        st <= S_BUSY;
                    end
                end

                S_BUSY: begin
                    if (tx_tdone) begin
                        st <= S_IDLE;
                    end
                end

                default: st <= S_IDLE;
            endcase
        end
    end

endmodule
