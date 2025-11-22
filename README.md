4-bit single-cycle CPU (Verilog)
Files:
- alu.v
- regfile.v
- data_mem.v
- instr_mem.v
- cpu.v
- cpu_tb.v
- program.mem

Simulate (using iverilog + vvp + gtkwave):
1) Install iverilog & gtkwave (Linux: apt install iverilog gtkwave)
2) From project dir:
   iverilog -o cpu_tb.vvp cpu_tb.v cpu.v instr_mem.v data_mem.v regfile.v alu.v
   vvp cpu_tb.vvp
   gtkwave cpu.vcd    # open waveform

Notes:
- program.mem must be present in same directory.
- program.mem is 16 hex lines (see file).
- You can inspect dmem contents by adding $display in testbench or expanding $dumpvars depth.

To push to GitHub:
  git init
  git add .
  git commit -m "4-bit CPU simple demo"
  gh repo create my-4bit-cpu --public --source=. --remote=origin
  git push -u origin main
(Requires GitHub CLI 'gh' or create repo manually)
