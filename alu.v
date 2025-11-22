// 4-bit ALU
module alu (
    input  [3:0] a,
    input  [3:0] b,
    input  [2:0] alu_op, // op code
    output reg [3:0] y,
    output reg carry
);
    always @(*) begin
        carry = 0;
        case (alu_op)
            3'b000: {carry, y} = a + b;    // ADD
            3'b001: {carry, y} = a - b;    // SUB (wrap)
            3'b010: y = a & b;             // AND
            3'b011: y = a | b;             // OR
            default: y = 4'b0000;
        endcase
    end
endmodule
