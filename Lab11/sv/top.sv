//--------------------------------------------------------------------
// top.v - top-level MIPS single cycle with instruction and data memories
// David_Harris@hmc.edu 9 November 2005
// Updated to SystemVerilog and modfied for clarity
// John Nestor, May 2018
// Key changes to this module:
//   1. Modfied dmem to use byte addressing rather than word addressing
//      for consistency
//--------------------------------------------------------------------

module top(input logic         clk, reset, 
           output logic [31:0] writedata, dataadr, pc, //pc pooped
           output logic        memwrite
           //output logic [5:0] opcode_d //pooped from mips
         //.memwrite_d,.memtoreg_d, .alusrc_d, .regdst_d, .regwrite_d, .jump_d, .pcsrc_d, pooped
           );

   logic [31:0]                pc, instr, readdata;
  
  // instantiate processor and memories                                                       
  mips mips(.clk, .reset, .pc, .instr, .memwrite, .aluout(dataadr), .writedata, .readdata
 //  .memwrite_d,.memtoreg_d, .alusrc_d, .regdst_d, .regwrite_d, .jump_d, .pcsrc_d, pooped
  
  ); // pooped .opcode_d
   
  imem imem(.adr(pc), .rd(instr));
   
  dmem dmem(.clk, .we(memwrite), .adr(dataadr), .wd(writedata), .rd(readdata));

endmodule
