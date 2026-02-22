`timescale 1ns/1ps

module fifo_checkFrame (
    input  wire        clk,
    input  wire        rst_n,

    // byte stream in (t? uart_rx)
    input  wire        in_valid,
    input  wire [7:0]  in_byte,

    // AXI-Stream out (no TLAST)
    output reg  [7:0]  m_axis_tdata,
    output reg         m_axis_tvalid,
    output reg         m_axis_tlast,
    input  wire        m_axis_tready,

    output reg         frame_ok_pulse,
    output reg         frame_err_pulse
);
    // ================= Frame format =================
    localparam [7:0] Header1 = 8'hAA;
    localparam [7:0] Header2 = 8'h55;

    localparam integer Frame_size   = 108;
    localparam integer Seq_size     = 2;
    localparam integer Payload_size = 100;
    localparam integer Crc_size     = 4;

    // ============================================================
    // FIFO frame_buf (108B) - Verilog thu?n, clear-then-push chu?n
    // ============================================================
    localparam integer DEPTH = Frame_size;
    localparam integer AW    = 7; // 128 > 108

    reg  [7:0]     mem [0:DEPTH-1];
    reg  [AW-1:0]  wptr, rptr;
    reg  [7:0]     count;                 // 0..108

    wire           empty = (count == 0);
    wire           full  = (count == DEPTH);
    wire [7:0]     dout  = mem[rptr];     // FWFT

    reg  clr;
    reg  push;
    reg  pop;

    // next-state signals
    reg [AW-1:0] wptr_n, rptr_n;
    reg [7:0]    count_n;
    reg          full_base, empty_base;

    wire [AW-1:0] wptr_base  = (clr) ? {AW{1'b0}} : wptr;
    wire [AW-1:0] rptr_base  = (clr) ? {AW{1'b0}} : rptr;
    wire [7:0]    count_base = (clr) ? 8'd0       : count;

    always @(*) begin
        full_base  = (count_base == DEPTH);
        empty_base = (count_base == 0);

        wptr_n  = wptr_base;
        rptr_n  = rptr_base;
        count_n = count_base;

        if (push && !full_base) begin
            if (wptr_base == DEPTH-1) wptr_n = 0;
            else                      wptr_n = wptr_base + 1'b1;
        end

        if (pop && !empty_base) begin
            if (rptr_base == DEPTH-1) rptr_n = 0;
            else                      rptr_n = rptr_base + 1'b1;
        end

        case ({(push && !full_base), (pop && !empty_base)})
            2'b10: count_n = count_base + 1'b1;
            2'b01: count_n = count_base - 1'b1;
            default: count_n = count_base;
        endcase
    end

    always @(posedge clk) begin
        if (!rst_n) begin
            wptr  <= 0;
            rptr  <= 0;
            count <= 0;
        end else begin
            if (push && !full_base) begin
                mem[wptr_base] <= in_byte;
            end

            wptr  <= wptr_n;
            rptr  <= rptr_n;
            count <= count_n;
        end
    end

    // ================= CRC =================
    reg [31:0] crc_calc, crc_rx;
    reg [1:0]  seq_cnt;
    reg [7:0]  payload_cnt;
    reg [2:0]  crc_cnt;
    wire [31:0] crc_final = crc_calc ^ 32'hFFFF_FFFF;

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

    // ================= FSM =================
    localparam [3:0]
        S_FIND_AA = 4'd0,
        S_FIND_55 = 4'd1,
        S_SEQ     = 4'd2,
        S_PAYLOAD = 4'd3,
        S_CRC     = 4'd4,
        S_CHECK   = 4'd5,
        S_FLUSH   = 4'd6;

    reg [3:0] st;
    wire axis_hs = m_axis_tvalid & m_axis_tready;

    always @(posedge clk) begin
        if (!rst_n) begin
            st <= S_FIND_AA;

            clr  <= 1'b1;
            push <= 1'b0;
            pop  <= 1'b0;

            seq_cnt <= 0;
            payload_cnt <= 0;
            crc_cnt <= 0;
            crc_calc <= 32'hFFFF_FFFF;
            crc_rx   <= 32'h0;

            m_axis_tvalid <= 1'b0;
            m_axis_tdata  <= 8'h00;
            m_axis_tlast  <= 1'b0;

            frame_ok_pulse  <= 1'b0;
            frame_err_pulse <= 1'b0;

        end else begin
            clr  <= 1'b0;
            push <= 1'b0;
            pop  <= 1'b0;

            frame_ok_pulse  <= 1'b0;
            frame_err_pulse <= 1'b0;

            case (st)

                S_FIND_AA: begin
                    m_axis_tvalid <= 1'b0;
                    m_axis_tlast <= 1'b0;

                    seq_cnt <= 0;
                    payload_cnt <= 0;
                    crc_cnt <= 0;
                    crc_rx <= 32'h0;

                    if (in_valid) begin
                        if (in_byte == Header1) begin
                            clr  <= 1'b1;
                            push <= 1'b1;
                            st <= S_FIND_55;
                        end
                    end
                end

                S_FIND_55: begin
                    if (in_valid) begin
                        if (in_byte == Header2) begin
                            push <= 1'b1;
                            seq_cnt <= 0;
                            st <= S_SEQ;
                        end else if (in_byte == Header1) begin
                            clr  <= 1'b1;
                            push <= 1'b1;
                            st <= S_FIND_55;
                        end else begin
                            st <= S_FIND_AA;
                        end
                    end
                end

                S_SEQ: begin
                    if (in_valid) begin
                        push <= 1'b1;
                        if (seq_cnt == Seq_size-1) begin
                            seq_cnt <= 0;
                            payload_cnt <= 0;
                            crc_cnt <= 0;
                            crc_rx <= 32'h0;
                            crc_calc <= 32'hFFFF_FFFF;
                            st <= S_PAYLOAD;
                        end else begin
                            seq_cnt <= seq_cnt + 1'b1;
                        end
                    end
                end

                S_PAYLOAD: begin
                    if (in_valid) begin
                        push <= 1'b1;
                        crc_calc <= crc32_update_byte(crc_calc, in_byte);

                        if (payload_cnt == Payload_size-1) begin
                            payload_cnt <= 0;
                            crc_cnt <= 0;
                            st <= S_CRC;
                        end else begin
                            payload_cnt <= payload_cnt + 1'b1;
                        end
                    end
                end

                S_CRC: begin
                    if (in_valid) begin
                        push <= 1'b1;

                        case (crc_cnt)
                            0: crc_rx[7:0]   <= in_byte;
                            1: crc_rx[15:8]  <= in_byte;
                            2: crc_rx[23:16] <= in_byte;
                            3: crc_rx[31:24] <= in_byte;
                        endcase

                        if (crc_cnt == Crc_size-1) begin
                            crc_cnt <= 0;
                            st <= S_CHECK;
                        end else begin
                            crc_cnt <= crc_cnt + 1'b1;
                        end
                    end
                end

                S_CHECK: begin
                    if ( (crc_calc ^ 32'hFFFF_FFFF) == crc_rx ) begin
                        frame_ok_pulse <= 1'b1;
                        st <= S_FLUSH;
                    end else begin
                        frame_err_pulse <= 1'b1;
                        clr <= 1'b1;
                        st <= S_FIND_AA;
                    end
                end

                S_FLUSH: begin
                    m_axis_tvalid <= !empty;
                    m_axis_tdata  <= dout;
                    m_axis_tlast  <= (!empty && (count == 8'd1));

                    if (axis_hs) begin
                        pop <= 1'b1;
                        if (count == 8'd1) begin
                            m_axis_tvalid <= 1'b0;
                            st <= S_FIND_AA;
                        end
                    end
                end

                default: st <= S_FIND_AA;
            endcase
        end
    end

endmodule
