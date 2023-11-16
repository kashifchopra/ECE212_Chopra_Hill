//--------------------------------------------------------------------
// top.v - top-level MIPS single cycle with instruction and data memories
// David_Harris@hmc.edu 9 November 2005
// Updated to SystemVerilog and modfied for clarity
// John Nestor, May 2018
// Key changes to this module:
//   1. Modfied dmem to use byte addressing rather than word addressing
//      for consistency
//--------------------------------------------------------------------

module top(
    input logic         clk, reset,
    output logic [31:0] writedata, dataadr, pc, instr1, readdata1, srca1, srcb1, result1,
    output logic        memwrite, 
    output logic        branch, zero, pcsrc1, regwrite1, 
    output logic [5:0]  opcode1, funct1  // pooped out hnngggh
    );

    logic [31:0]        pc, instr, readdata;
   
  
    // instantiate processor and memories
    mips mips(.clk, .reset, .pc, .instr, .memwrite, .aluout(dataadr), .writedata, .readdata, .branch, .instr1, .zero, .pcsrc1, .readdata1, .srca1, .srcb1, .opcode1, .funct1, .result1, .regwrite1);

    imem imem(.adr(pc), .rd(instr));

    dmem dmem(.clk, .we(memwrite), .adr(dataadr), .wd(writedata), .rd(readdata));
 
      
      
endmodule
