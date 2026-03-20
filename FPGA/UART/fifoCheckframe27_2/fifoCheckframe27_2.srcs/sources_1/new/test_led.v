`timescale 1ns / 1ps

module test_led(
    input wire clk,
    input wire error_frame,   // ??u vào báo l?i
    output wire led           // ??u ra ?i?u khi?n LED
    );

    reg led_0;  // Dùng 1 bit thay vì 2 bit

    always @(posedge clk) begin
        if (error_frame) 
            led_0 <= ~led_0;  // ??o tr?ng thái LED khi có l?i
    end

    assign led = led_0;  // C?p nh?t tr?ng thái LED

endmodule