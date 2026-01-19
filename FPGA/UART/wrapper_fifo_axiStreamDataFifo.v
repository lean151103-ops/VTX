`timescale 1ns / 1ps

    // Rule: 
    //      fifo side: while empty = 0 not allow to read fifo: rd_en <= 0
    //                  rd_en only High 1 cycle to pop data
    //                  Fifo standard: dout is valid after 1 cycle from rd_en == 1
    //      axi_stream side: Only send data when    s_axis_tvalid && s_axis_tready
    //                          while s_axis_tvalid = 1 must keeping s_axis_tdata stabling
    
module wrapper_fifo_axiStreamDataFifo(
    // Fifo side
    input wire empty,
    input wire [7:0] dout,
    output reg rd_en,
    
    //Axi_stream_data_fifo side
    output reg [7:0] m_axis_tdata,
    input wire m_axis_tready,
    output reg m_axis_tvalid,
    output reg m_axis_tlast,
    // clock & reset
    input  wire        clk,
    input  wire        rst_n
    );
    localparam IDLE = 2'd0;
    localparam POP = 2'd1;
    localparam VALID = 2'd2;
    
    reg [1:0] state;
    
    always @(posedge clk) begin
        if(!rst_n) begin
            state           <= IDLE;
            rd_en           <= 1'b0;
            m_axis_tvalid   <= 1'b0;
            m_axis_tdata    <= 8'd0;
        end else begin
            rd_en <= 1'd0; // default: no pop
            case(state)
                IDLE: begin
                    m_axis_tvalid <= 0;
                    if(!empty && m_axis_tready) begin
                        rd_en <= 1;
                        state <= POP;
                    end
                end
                
                POP: begin
                    m_axis_tdata <= dout;
                    m_axis_tvalid <= 1'b1;
                    m_axis_tlast  <= 1'b1;
                    state <= VALID;
                end 
                
                VALID: begin
                    if(m_axis_tvalid && m_axis_tready) begin
                        rd_en <= 1'b0;
                        m_axis_tvalid <= 1'b0;
                        m_axis_tlast  <= 1'b0;
                        state <= IDLE;
                    end
                end
                default: state <= IDLE;
            endcase
        end
    end
    
endmodule
