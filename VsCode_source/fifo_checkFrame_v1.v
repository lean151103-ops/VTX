// IP-core FIFO to storage frame and check frame (Header + CRC). Can decoded fixed structure frame
module fifo_checkFrame (
    input wire clk,
    input wire rst_n,
    
    input wire i_wr_en,
    input wire [7:0] i_wr_data,
    output wire o_full,      

    input wire i_rd_en,
    output wire [7:0] o_data,
    output wire o_empty,
    output reg [1:0] error_frame
);

    localparam [7:0] H1 = 8'hAA;
    localparam [7:0] H2 = 8'h55;
    localparam integer FRAME_SIZE = 108;
    localparam integer CRC_POS    = 104;
    localparam AW = 9; // RAM 512 bytes

    localparam [1:0]
        S_IDLE    = 2'd0,
        S_WAIT_H2 = 2'd1,
        S_RECEIVE = 2'd2,
        S_CHECK   = 2'd3;

    reg [1:0] st;
    reg [7:0] byte_cnt;
    reg [31:0] crc_calc;
    reg [31:0] crc_rx;

    reg [7:0] mem [0:511];
    reg [AW:0] wptr;            
    reg [AW:0] wptr_confirmed;  
    reg [AW:0] rptr;            

    assign o_full  = (wptr[AW-1:0] == rptr[AW-1:0]) && (wptr[AW] != rptr[AW]);
    assign o_empty = (wptr_confirmed == rptr);
    assign o_data  = mem[rptr[AW-1:0]];

    // ================= CRC32 LUT =================
    function [31:0] crc32_table;
        input [7:0] idx;
        begin
            case (idx)
                8'h00: crc32_table = 32'h00000000;
                8'h01: crc32_table = 32'h77073096;
                8'h02: crc32_table = 32'hEE0E612C;
                8'h03: crc32_table = 32'h990951BA;
                8'h04: crc32_table = 32'h076DC419;
                8'h05: crc32_table = 32'h706AF48F;
                8'h06: crc32_table = 32'hE963A535;
                8'h07: crc32_table = 32'h9E6495A3;
                8'h08: crc32_table = 32'h0EDB8832;
                8'h09: crc32_table = 32'h79DCB8A4;
                8'h0A: crc32_table = 32'hE0D5E91E;
                8'h0B: crc32_table = 32'h97D2D988;
                8'h0C: crc32_table = 32'h09B64C2B;
                8'h0D: crc32_table = 32'h7EB17CBD;
                8'h0E: crc32_table = 32'hE7B82D07;
                8'h0F: crc32_table = 32'h90BF1D91;
                8'h10: crc32_table = 32'h1DB71064;
                8'h11: crc32_table = 32'h6AB020F2;
                8'h12: crc32_table = 32'hF3B97148;
                8'h13: crc32_table = 32'h84BE41DE;
                8'h14: crc32_table = 32'h1ADAD47D;
                8'h15: crc32_table = 32'h6DDDE4EB;
                8'h16: crc32_table = 32'hF4D4B551;
                8'h17: crc32_table = 32'h83D385C7;
                8'h18: crc32_table = 32'h136C9856;
                8'h19: crc32_table = 32'h646BA8C0;
                8'h1A: crc32_table = 32'hFD62F97A;
                8'h1B: crc32_table = 32'h8A65C9EC;
                8'h1C: crc32_table = 32'h14015C4F;
                8'h1D: crc32_table = 32'h63066CD9;
                8'h1E: crc32_table = 32'hFA0F3D63;
                8'h1F: crc32_table = 32'h8D080DF5;
                8'h20: crc32_table = 32'h3B6E20C8;
                8'h21: crc32_table = 32'h4C69105E;
                8'h22: crc32_table = 32'hD56041E4;
                8'h23: crc32_table = 32'hA2677172;
                8'h24: crc32_table = 32'h3C03E4D1;
                8'h25: crc32_table = 32'h4B04D447;
                8'h26: crc32_table = 32'hD20D85FD;
                8'h27: crc32_table = 32'hA50AB56B;
                8'h28: crc32_table = 32'h35B5A8FA;
                8'h29: crc32_table = 32'h42B2986C;
                8'h2A: crc32_table = 32'hDBBBC9D6;
                8'h2B: crc32_table = 32'hACBCF940;
                8'h2C: crc32_table = 32'h32D86CE3;
                8'h2D: crc32_table = 32'h45DF5C75;
                8'h2E: crc32_table = 32'hDCD60DCF;
                8'h2F: crc32_table = 32'hABD13D59;
                8'h30: crc32_table = 32'h26D930AC;
                8'h31: crc32_table = 32'h51DE003A;
                8'h32: crc32_table = 32'hC8D75180;
                8'h33: crc32_table = 32'hBFD06116;
                8'h34: crc32_table = 32'h21B4F4B5;
                8'h35: crc32_table = 32'h56B3C423;
                8'h36: crc32_table = 32'hCFBA9599;
                8'h37: crc32_table = 32'hB8BDA50F;
                8'h38: crc32_table = 32'h2802B89E;
                8'h39: crc32_table = 32'h5F058808;
                8'h3A: crc32_table = 32'hC60CD9B2;
                8'h3B: crc32_table = 32'hB10BE924;
                8'h3C: crc32_table = 32'h2F6F7C87;
                8'h3D: crc32_table = 32'h58684C11;
                8'h3E: crc32_table = 32'hC1611DAB;
                8'h3F: crc32_table = 32'hB6662D3D;
                8'h40: crc32_table = 32'h76DC4190;
                8'h41: crc32_table = 32'h01DB7106;
                8'h42: crc32_table = 32'h98D220BC;
                8'h43: crc32_table = 32'hEFD5102A;
                8'h44: crc32_table = 32'h71B18589;
                8'h45: crc32_table = 32'h06B6B51F;
                8'h46: crc32_table = 32'h9FBFE4A5;
                8'h47: crc32_table = 32'hE8B8D433;
                8'h48: crc32_table = 32'h7807C9A2;
                8'h49: crc32_table = 32'h0F00F934;
                8'h4A: crc32_table = 32'h9609A88E;
                8'h4B: crc32_table = 32'hE10E9818;
                8'h4C: crc32_table = 32'h7F6A0DBB;
                8'h4D: crc32_table = 32'h086D3D2D;
                8'h4E: crc32_table = 32'h91646C97;
                8'h4F: crc32_table = 32'hE6635C01;
                8'h50: crc32_table = 32'h6B6B51F4;
                8'h51: crc32_table = 32'h1C6C6162;
                8'h52: crc32_table = 32'h856530D8;
                8'h53: crc32_table = 32'hF262004E;
                8'h54: crc32_table = 32'h6C0695ED;
                8'h55: crc32_table = 32'h1B01A57B;
                8'h56: crc32_table = 32'h8208F4C1;
                8'h57: crc32_table = 32'hF50FC457;
                8'h58: crc32_table = 32'h65B0D9C6;
                8'h59: crc32_table = 32'h12B7E950;
                8'h5A: crc32_table = 32'h8BBEB8EA;
                8'h5B: crc32_table = 32'hFCB9887C;
                8'h5C: crc32_table = 32'h62DD1DDF;
                8'h5D: crc32_table = 32'h15DA2D49;
                8'h5E: crc32_table = 32'h8CD37CF3;
                8'h5F: crc32_table = 32'hFBD44C65;
                8'h60: crc32_table = 32'h4DB26158;
                8'h61: crc32_table = 32'h3AB551CE;
                8'h62: crc32_table = 32'hA3BC0074;
                8'h63: crc32_table = 32'hD4BB30E2;
                8'h64: crc32_table = 32'h4ADFA541;
                8'h65: crc32_table = 32'h3DD895D7;
                8'h66: crc32_table = 32'hA4D1C46D;
                8'h67: crc32_table = 32'hD3D6F4FB;
                8'h68: crc32_table = 32'h4369E96A;
                8'h69: crc32_table = 32'h346ED9FC;
                8'h6A: crc32_table = 32'hAD678846;
                8'h6B: crc32_table = 32'hDA60B8D0;
                8'h6C: crc32_table = 32'h44042D73;
                8'h6D: crc32_table = 32'h33031DE5;
                8'h6E: crc32_table = 32'hAA0A4C5F;
                8'h6F: crc32_table = 32'hDD0D7CC9;
                8'h70: crc32_table = 32'h5005713C;
                8'h71: crc32_table = 32'h270241AA;
                8'h72: crc32_table = 32'hBE0B1010;
                8'h73: crc32_table = 32'hC90C2086;
                8'h74: crc32_table = 32'h5768B525;
                8'h75: crc32_table = 32'h206F85B3;
                8'h76: crc32_table = 32'hB966D409;
                8'h77: crc32_table = 32'hCE61E49F;
                8'h78: crc32_table = 32'h5EDEF90E;
                8'h79: crc32_table = 32'h29D9C998;
                8'h7A: crc32_table = 32'hB0D09822;
                8'h7B: crc32_table = 32'hC7D7A8B4;
                8'h7C: crc32_table = 32'h59B33D17;
                8'h7D: crc32_table = 32'h2EB40D81;
                8'h7E: crc32_table = 32'hB7BD5C3B;
                8'h7F: crc32_table = 32'hC0BA6CAD;
                8'h80: crc32_table = 32'hEDB88320;
                8'h81: crc32_table = 32'h9ABFB3B6;
                8'h82: crc32_table = 32'h03B6E20C;
                8'h83: crc32_table = 32'h74B1D29A;
                8'h84: crc32_table = 32'hEAD54739;
                8'h85: crc32_table = 32'h9DD277AF;
                8'h86: crc32_table = 32'h04DB2615;
                8'h87: crc32_table = 32'h73DC1683;
                8'h88: crc32_table = 32'hE3630B12;
                8'h89: crc32_table = 32'h94643B84;
                8'h8A: crc32_table = 32'h0D6D6A3E;
                8'h8B: crc32_table = 32'h7A6A5AA8;
                8'h8C: crc32_table = 32'hE40ECF0B;
                8'h8D: crc32_table = 32'h9309FF9D;
                8'h8E: crc32_table = 32'h0A00AE27;
                8'h8F: crc32_table = 32'h7D079EB1;
                8'h90: crc32_table = 32'hF00F9344;
                8'h91: crc32_table = 32'h8708A3D2;
                8'h92: crc32_table = 32'h1E01F268;
                8'h93: crc32_table = 32'h6906C2FE;
                8'h94: crc32_table = 32'hF762575D;
                8'h95: crc32_table = 32'h806567CB;
                8'h96: crc32_table = 32'h196C3671;
                8'h97: crc32_table = 32'h6E6B06E7;
                8'h98: crc32_table = 32'hFED41B76;
                8'h99: crc32_table = 32'h89D32BE0;
                8'h9A: crc32_table = 32'h10DA7A5A;
                8'h9B: crc32_table = 32'h67DD4ACC;
                8'h9C: crc32_table = 32'hF9B9DF6F;
                8'h9D: crc32_table = 32'h8EBEEFF9;
                8'h9E: crc32_table = 32'h17B7BE43;
                8'h9F: crc32_table = 32'h60B08ED5;
                8'hA0: crc32_table = 32'hD6D6A3E8;
                8'hA1: crc32_table = 32'hA1D1937E;
                8'hA2: crc32_table = 32'h38D8C2C4;
                8'hA3: crc32_table = 32'h4FDFF252;
                8'hA4: crc32_table = 32'hD1BB67F1;
                8'hA5: crc32_table = 32'hA6BC5767;
                8'hA6: crc32_table = 32'h3FB506DD;
                8'hA7: crc32_table = 32'h48B2364B;
                8'hA8: crc32_table = 32'hD80D2BDA;
                8'hA9: crc32_table = 32'hAF0A1B4C;
                8'hAA: crc32_table = 32'h36034AF6;
                8'hAB: crc32_table = 32'h41047A60;
                8'hAC: crc32_table = 32'hDF60EFC3;
                8'hAD: crc32_table = 32'hA867DF55;
                8'hAE: crc32_table = 32'h316E8EEF;
                8'hAF: crc32_table = 32'h4669BE79;
                8'hB0: crc32_table = 32'hCB61B38C;
                8'hB1: crc32_table = 32'hBC66831A;
                8'hB2: crc32_table = 32'h256FD2A0;
                8'hB3: crc32_table = 32'h5268E236;
                8'hB4: crc32_table = 32'hCC0C7795;
                8'hB5: crc32_table = 32'hBB0B4703;
                8'hB6: crc32_table = 32'h220216B9;
                8'hB7: crc32_table = 32'h5505262F;
                8'hB8: crc32_table = 32'hC5BA3BBE;
                8'hB9: crc32_table = 32'hB2BD0B28;
                8'hBA: crc32_table = 32'h2BB45A92;
                8'hBB: crc32_table = 32'h5CB36A04;
                8'hBC: crc32_table = 32'hC2D7FFA7;
                8'hBD: crc32_table = 32'hB5D0CF31;
                8'hBE: crc32_table = 32'h2CD99E8B;
                8'hBF: crc32_table = 32'h5BDEAE1D;
                8'hC0: crc32_table = 32'h9B64C2B0;
                8'hC1: crc32_table = 32'hEC63F226;
                8'hC2: crc32_table = 32'h756AA39C;
                8'hC3: crc32_table = 32'h026D930A;
                8'hC4: crc32_table = 32'h9C0906A9;
                8'hC5: crc32_table = 32'hEB0E363F;
                8'hC6: crc32_table = 32'h72076785;
                8'hC7: crc32_table = 32'h05005713;
                8'hC8: crc32_table = 32'h95BF4A82;
                8'hC9: crc32_table = 32'hE2B87A14;
                8'hCA: crc32_table = 32'h7BB12BAE;
                8'hCB: crc32_table = 32'h0CB61B38;
                8'hCC: crc32_table = 32'h92D28E9B;
                8'hCD: crc32_table = 32'hE5D5BE0D;
                8'hCE: crc32_table = 32'h7CDCEFB7;
                8'hCF: crc32_table = 32'h0BDBDF21;
                8'hD0: crc32_table = 32'h86D3D2D4;
                8'hD1: crc32_table = 32'hF1D4E242;
                8'hD2: crc32_table = 32'h68DDB3F8;
                8'hD3: crc32_table = 32'h1FDA836E;
                8'hD4: crc32_table = 32'h81BE16CD;
                8'hD5: crc32_table = 32'hF6B9265B;
                8'hD6: crc32_table = 32'h6FB077E1;
                8'hD7: crc32_table = 32'h18B74777;
                8'hD8: crc32_table = 32'h88085AE6;
                8'hD9: crc32_table = 32'hFF0F6A70;
                8'hDA: crc32_table = 32'h66063BCA;
                8'hDB: crc32_table = 32'h11010B5C;
                8'hDC: crc32_table = 32'h8F659EFF;
                8'hDD: crc32_table = 32'hF862AE69;
                8'hDE: crc32_table = 32'h616BFFD3;
                8'hDF: crc32_table = 32'h166CCF45;
                8'hE0: crc32_table = 32'hA00AE278;
                8'hE1: crc32_table = 32'hD70DD2EE;
                8'hE2: crc32_table = 32'h4E048354;
                8'hE3: crc32_table = 32'h3903B3C2;
                8'hE4: crc32_table = 32'hA7672661;
                8'hE5: crc32_table = 32'hD06016F7;
                8'hE6: crc32_table = 32'h4969474D;
                8'hE7: crc32_table = 32'h3E6E77DB;
                8'hE8: crc32_table = 32'hAED16A4A;
                8'hE9: crc32_table = 32'hD9D65ADC;
                8'hEA: crc32_table = 32'h40DF0B66;
                8'hEB: crc32_table = 32'h37D83BF0;
                8'hEC: crc32_table = 32'hA9BCAE53;
                8'hED: crc32_table = 32'hDEBB9EC5;
                8'hEE: crc32_table = 32'h47B2CF7F;
                8'hEF: crc32_table = 32'h30B5FFE9;
                8'hF0: crc32_table = 32'hBDBDF21C;
                8'hF1: crc32_table = 32'hCABAC28A;
                8'hF2: crc32_table = 32'h53B39330;
                8'hF3: crc32_table = 32'h24B4A3A6;
                8'hF4: crc32_table = 32'hBAD03605;
                8'hF5: crc32_table = 32'hCDD70693;
                8'hF6: crc32_table = 32'h54DE5729;
                8'hF7: crc32_table = 32'h23D967BF;
                8'hF8: crc32_table = 32'hB3667A2E;
                8'hF9: crc32_table = 32'hC4614AB8;
                8'hFA: crc32_table = 32'h5D681B02;
                8'hFB: crc32_table = 32'h2A6F2B94;
                8'hFC: crc32_table = 32'hB40BBE37;
                8'hFD: crc32_table = 32'hC30C8EA1;
                8'hFE: crc32_table = 32'h5A05DF1B;
                8'hFF: crc32_table = 32'h2D02EF8D;
                default: crc32_table = 32'h00000000;
            endcase
        end
    endfunction
    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            st <= S_IDLE;
            wptr <= 0;
            wptr_confirmed <= 0;
            byte_cnt <= 0;
            error_frame <= 0;
        end else begin
            case (st)
                S_IDLE: begin
                    if (i_wr_en && i_wr_data == H1 && !o_full) begin
                        mem[wptr[AW-1:0]] <= H1;
                        wptr     <= wptr + 1'b1;
                        crc_calc <= (32'hFFFFFFFF >> 8) ^ crc32_table(8'hFF ^ H1);  
                        byte_cnt <= 8'd1;
                        st       <= S_WAIT_H2;
                    end
                end

                S_WAIT_H2: begin
                    if (i_wr_en) begin
                        if (i_wr_data == H2 && !o_full) begin
                            mem[wptr[AW-1:0]] <= H2;
                            wptr     <= wptr + 1'b1;
                            crc_calc <= (crc_calc >> 8) ^ crc32_table(crc_calc[7:0] ^ H2);
                            byte_cnt <= 8'd2;
                            st       <= S_RECEIVE;
                        end else begin
                            wptr <= wptr_confirmed; 
                            st   <= S_IDLE;
                        end
                    end
                end

                S_RECEIVE: begin
                    if (i_wr_en) begin
                        if (!o_full) begin
                            mem[wptr[AW-1:0]] <= i_wr_data;
                            wptr <= wptr + 1'b1;

                            if (byte_cnt < CRC_POS)
                                crc_calc <= (crc_calc >> 8) ^ crc32_table(crc_calc[7:0] ^ i_wr_data);
                            else begin
                                case (byte_cnt)
                                    8'd104: crc_rx[7:0]   <= i_wr_data;
                                    8'd105: crc_rx[15:8]  <= i_wr_data;
                                    8'd106: crc_rx[23:16] <= i_wr_data;
                                    8'd107: crc_rx[31:24] <= i_wr_data;
                                endcase
                            end

                            if (byte_cnt == FRAME_SIZE - 1) st <= S_CHECK;
                            else byte_cnt <= byte_cnt + 1'b1;
                        end else begin
                            wptr <= wptr_confirmed;
                            st <= S_IDLE;
                        end
                    end
                end

                S_CHECK: begin
                    if ((crc_calc ^ 32'hFFFFFFFF) == crc_rx) begin
                        wptr_confirmed <= wptr; 
                        error_frame <= 2'b00;
                    end else begin
                        wptr <= wptr_confirmed; 
                        error_frame <= 2'b01;
                    end
                    st <= S_IDLE; 
                end
            endcase
        end
    end

    // ================= LOGIC ??C =================
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) rptr <= 0;
        else if (i_rd_en && !o_empty) rptr <= rptr + 1'b1;
    end

endmodule