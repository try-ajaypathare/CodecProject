// 4 registers x 4-bit regfile
module regfile (
    input clk,
    input we,
    input [1:0] ra1,
    input [1:0] ra2,
    input [1:0] wa,
    input [3:0] wd,
    output [3:0] rd1,
    output [3:0] rd2
);
    reg [3:0] regs [0:3];
    integer i;
    initial begin
        for (i=0;i<4;i=i+1) regs[i]=4'b0000;
    end

    // read ports (combinational)
    assign rd1 = regs[ra1];
    assign rd2 = regs[ra2];

    // write (on posedge)
    always @(posedge clk) begin
        if (we) begin
            regs[wa] <= wd;
        end
    end
endmodule
