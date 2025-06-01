module register_file (
    input clk,
    input we3,
    input [4:0] a1, a2, a3,
    input [31:0] wd3,
    output [31:0] rd1, rd2
);
    reg [31:0] regs [31:0];

    assign rd1 = regs[a1];
    assign rd2 = regs[a2];

    always @(posedge clk) begin
        if (we3)
            regs[a3] <= wd3;
    end
endmodule

module alu (
    input [31:0] a, b,
    input [1:0] opcode,
    output reg [31:0] result
);
    always @(*) begin
        case (opcode)
            2'b00: result = a + b;
            2'b01: result = a - b;
            2'b10: result = a << b;
            2'b11: result = a >> b;
        endcase
    end
endmodule

module lab4 (
    input clk,
    input we3,
    input [4:0] a1, a2, a3,
    input [31:0] wd3,
    input [1:0] opcode,
    output [31:0] result
);
    wire [31:0] rd1, rd2;

    register_file rf (
        .clk(clk),
        .we3(we3),
        .a1(a1),
        .a2(a2),
        .a3(a3),
        .wd3(wd3),
        .rd1(rd1),
        .rd2(rd2)
    );

    alu myalu (
        .a(rd1),
        .b(rd2),
        .opcode(opcode),
        .result(result)
    );
endmodule
