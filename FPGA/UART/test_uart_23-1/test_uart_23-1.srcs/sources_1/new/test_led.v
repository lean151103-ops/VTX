`timescale 1ns / 1ps

module test_led(
    input wire [7:0] data_rx,
    input wire [7:0] data_tx,
    output wire led_0_rx,
    output wire led_1_rx,
    output wire led_2_tx,
    output wire led_3_tx
    );
    assign {led_0_rx, led_1_rx, led_2_tx, led_3_tx} =
            {data_rx[0], data_rx[1], data_tx[0], data_tx[1]};
endmodule
