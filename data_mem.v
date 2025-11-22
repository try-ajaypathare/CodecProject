// 16 x 4-bit data memory (simple), synchronous write, combinational read
module data_mem (
    input clk,
    input we,
    input [3:0] addr,
    input [3:0] wdata,
    output [3:0] rdata
);
    reg [3:0] mem [0:15];
    integer i;
    initial begin
        for (i=0;i<16;i=i+1) mem[i]=4'b0000;
    end

    assign rdata = mem[addr];

    always @(posedge clk) begin
        if (we) mem[addr] <= wdata;
    end
endmodule
