//--------------------------------------------------------------
// controller.sv - single-cycle MIPS controller
// David_Harris@hmc.edu and Sarah_Harris@hmc.edu 23 October 2005
// Updated to SystemVerilog dmh 12 November 2010
// Refactored into separate files & updated using additional SystemVerilog
// features by John Nestor May 2018
// Key modifications to this file:
//    1. Use enum for opcodes declared in external package
//    2. Rewrite code to show control signals explicitly rather than
//       packed into a binary string (make intent clearer)
//    3. Use enum forr control signals declared in external package
//    4. Use *blocking* assignments for comb. logic
//--------------------------------------------------------------


module controller(
    input mips_decls_p::opcode_t opcode,
    input mips_decls_p::funct_t funct,
    input logic        zero,
    output logic       memtoreg, memwrite,
    output logic       pcsrc, alusrc,
    output logic       regdst, regwrite,
    output logic       jump,
    output logic [2:0] alucontrol,
    output logic       branch, //pooped 
    output logic [5:0] opcode1, funct1
    );

    logic [1:0] aluop;
    logic       branch;

    maindec U_MD(.opcode, .memtoreg, .memwrite, .branch,
                 .alusrc, .regdst, .regwrite, .jump, .aluop, .opcode1);

    aludec  U_AD(.funct, .aluop, .alucontrol, .funct1);

    assign pcsrc = branch & zero;

endmodule
