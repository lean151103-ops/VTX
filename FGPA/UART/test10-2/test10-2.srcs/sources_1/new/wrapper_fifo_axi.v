module wrapper_fifo_axi (
    input  wire        clk,
    input  wire        rst_n,

    // FIFO FWFT input
    input  wire        empty,
    input  wire [7:0]  dout,
    output reg         rd_en,

    // AXI-Stream out (no TLAST)
    output reg  [7:0]  s_axis_tdata,
    output reg         s_axis_tvalid,
    input  wire        s_axis_tready
);

    localparam [7:0] Header1 = 8'hAA;
    localparam [7:0] Header2 = 8'h55;

    localparam integer Frame_size   = 108; // AA 55 + SEQ(2) + PAYLOAD(100) + CRC(4)
    localparam integer Seq_size     = 2;
    localparam integer Payload_size = 100;
    localparam integer Crc_size     = 4;

    reg [7:0]  Frame_buf [0:Frame_size-1];
    reg [15:0] wr_ptr, rd_ptr;

    reg [1:0]  seq_cnt;
    reg [7:0]  payload_cnt;
    reg [2:0]  crc_cnt;

    localparam [3:0]
        S_IDLE    = 4'd0,
        S_H2      = 4'd1,
        S_SEQ     = 4'd2,
        S_PAYLOAD = 4'd3,
        S_CRC     = 4'd4,
        S_CHECK   = 4'd5,
        S_FLUSH   = 4'd6;

    reg [3:0] st;

    wire axis_hs = s_axis_tvalid & s_axis_tready;

    reg [31:0] crc_calc;
    reg [31:0] crc_rx;

    // CRC32 (reflected) poly = 0xEDB88320
    function [31:0] crc32_update_byte;
        input [31:0] crc_in;
        input [7:0]  data;
        integer i;
        reg [31:0] c;
        begin
            c = crc_in ^ {24'h0, data};
            for (i=0; i<8; i=i+1) begin
                if (c[0]) c = (c >> 1) ^ 32'hEDB88320;
                else      c = (c >> 1);
            end
            crc32_update_byte = c;
        end
    endfunction

    always @(posedge clk) begin
        if (!rst_n) begin
            st <= S_IDLE;
            rd_en <= 1'b0;

            wr_ptr <= 0;
            rd_ptr <= 0;
            seq_cnt <= 0;
            payload_cnt <= 0;
            crc_cnt <= 0;

            crc_calc <= 32'hFFFF_FFFF;
            crc_rx   <= 32'h0;

            s_axis_tvalid <= 1'b0;
            s_axis_tdata  <= 8'h00;
        end else begin
            // defaults
            rd_en <= 1'b0;

            case (st)
                // Find Header1 (AA)
                S_IDLE: begin
                    s_axis_tvalid <= 1'b0;
                    wr_ptr <= 0;
                    rd_ptr <= 0;
                    seq_cnt <= 0;
                    payload_cnt <= 0;
                    crc_cnt <= 0;
                    crc_rx <= 32'h0;

                    if (!empty && !rd_en) begin
                        if (dout == Header1) begin
                            Frame_buf[wr_ptr] <= dout;     // AA
                            wr_ptr <= wr_ptr + 1;
                            rd_en <= 1'b1;      // consume AA
                            st <= S_H2;
                        end else begin
                            rd_en <= 1'b1;      // drop byte
                            st <= S_IDLE;
                        end
                    end
                end

                // Check Header2 (55)
                S_H2: begin
                    if (!empty && !rd_en) begin
                        if (dout == Header2) begin
                            Frame_buf[wr_ptr] <= dout; // 55
                            wr_ptr <= wr_ptr + 1;
                            seq_cnt <= 0;
                            rd_en <= 1'b1;       // consume 55
                            st <= S_SEQ;
                        end else begin
                            rd_en <= 1'b1;       // drop and restart
                            st <= S_H2;
                        end
                    end
                end

                // Read SEQ(2) bytes (not in CRC)
                S_SEQ: begin
                    if (!empty && !rd_en) begin
                        Frame_buf[wr_ptr] <= dout;
                        wr_ptr <= wr_ptr + 1;
                        rd_en <= 1'b1;

                        if (seq_cnt == Seq_size-1) begin
                            seq_cnt <= 0;
                            payload_cnt <= 0;
                            crc_cnt <= 0;
                            crc_rx <= 32'h0;
                            crc_calc <= 32'hFFFF_FFFF; // reset CRC right before payload
                            st <= S_PAYLOAD;
                        end else begin
                            seq_cnt <= seq_cnt + 1;
                            st <= S_SEQ;
                        end
                    end
                end

                // Read PAYLOAD(100) bytes + CRC update (payload only)
                S_PAYLOAD: begin
                    if (!empty && !rd_en) begin
                        Frame_buf[wr_ptr] <= dout;
                        wr_ptr <= wr_ptr + 1;
                        crc_calc <= crc32_update_byte(crc_calc, dout);
                        rd_en <= 1'b1;

                        if (payload_cnt == Payload_size-1) begin
                            payload_cnt <= 0;
                            crc_cnt <= 0;
                            st <= S_CRC;
                        end else begin
                            payload_cnt <= payload_cnt + 1;
                            st <= S_PAYLOAD;
                        end
                    end
                end

                // Read CRC(4) bytes (assume LSB-first)
                S_CRC: begin
                    if (!empty && !rd_en) begin
                        Frame_buf[wr_ptr] <= dout;
                        wr_ptr      <= wr_ptr + 1;
                        rd_en       <= 1'b1;

                        case (crc_cnt)
                            0: crc_rx[7:0]   <= dout;
                            1: crc_rx[15:8]  <= dout;
                            2: crc_rx[23:16] <= dout;
                            3: crc_rx[31:24] <= dout;
                        endcase

                        if (crc_cnt == Crc_size-1) begin
                            crc_cnt <= 0;
                            st <= S_CHECK;
                        end else begin
                            crc_cnt <= crc_cnt + 1;
                            st <= S_CRC;
                        end
                    end
                end

                // Compare CRC
                S_CHECK: begin
                    if ( (crc_calc ^ 32'hFFFF_FFFF ) == crc_rx ) begin
                        rd_ptr <= 0;
                        st <= S_FLUSH;      // OK -> output whole frame
                    end else begin
                        st <= S_IDLE;       // FAIL -> drop
                    end
                end

                S_FLUSH: begin
                    s_axis_tvalid <= 1'b1;
                    s_axis_tdata  <= Frame_buf[rd_ptr];

                    if (axis_hs) begin
                        if (rd_ptr == Frame_size-1) begin
                            s_axis_tvalid <= 1'b0;
                            st <= S_IDLE;
                        end else begin
                            rd_ptr <= rd_ptr + 1;
                            st <= S_FLUSH;
                        end
                    end
                end

                default: st <= S_IDLE;
            endcase
        end
    end

endmodule
