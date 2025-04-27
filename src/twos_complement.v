`timescale 1ns / 1ps

module twos_complement1

    input [7:0] a,
    output [7:0] y
);

assign y = ~a + 1;

endmodule

