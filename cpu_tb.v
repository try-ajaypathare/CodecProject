`timescale 1ns/1ps
module cpu_tb;
    reg clk;
    reg rst;
    wire [3:0] pc_out;
    wire [3:0] r0, r1, r2, r3;

    // instantiate cpu
    cpu U(.clk(clk), .rst(rst), .pc_out(pc_out),
          .reg0_out(r0), .reg1_out(r1), .reg2_out(r2), .reg3_out(r3));

    initial begin
        $dumpfile("cpu.vcd");
        $dumpvars(0, cpu_tb);
        clk = 0;
        rst = 1;
        #5 rst = 0;
        // run for enough cycles to execute program (~20 cycles)
        #200 $finish;
    end

    always #5 clk = ~clk; // 100MHz-ish (period 10ns)

    // optional: display some signals each cycle
    integer cycle;
    initial cycle = 0;
    always @(posedge clk) begin
        cycle = cycle + 1;
        // print PC each cycle
        $display("time=%0t cycle=%0d PC=%0h", $time, cycle, pc_out);
    end
endmodule
