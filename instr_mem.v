// 16 x 8-bit instruction memory, initialized from file "program.mem"
module instr_mem (
    input [3:0] addr,
    output [7:0] instr
);
    reg [7:0] mem [0:15];
    initial begin
        $readmemh("program.mem", mem);
    end
    assign instr = mem[addr];
endmodule
