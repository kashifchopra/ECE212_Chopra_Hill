`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2023 05:44:05 PM
// Design Name: 
// Module Name: controller_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module controller_tb;

import mips_decls_p::*;

logic clk,reset, zero;
opcode_t opcode; 
funct_t funct;

     logic       pcen, memwrite, irwrite, regwrite;
     logic       alusrca, iord, memtoreg, regdst;
     logic       pcwrite; //popped
     logic [1:0] alusrcb, pcsrc;
     logic [2:0] alucontrol;
 
                                                                                                                                                                                                                                                                                                    //popped
controller DUV(.clk(clk), .reset(reset), .opcode(opcode), .funct(funct), .zero(zero) ,.pcen(pcen), .memwrite(memwrite), .irwrite(irwrite), .regwrite(regwrite), .alusrca(alusrca), .iord(iord), .memtoreg(memtoreg), .regdst(regdst),.alusrcb(alusrcb), .pcsrc(pcsrc), .alucontrol(alucontrol), .pcwrite);

//generate clock
parameter CLK_PD = 10;

always begin
    clk = 0; #5;
    clk = 1; #5;

end


   initial begin
    reset = 1;
    opcode = OP_RTYPE;
    funct = F_ADD;
    zero = 0;
   #40;
   //test add
   opcode = OP_RTYPE;
   funct = F_ADD; //6'b100000;
   zero = 0;
   reset = 0;
   
   #40;
   //test sub 
   opcode = OP_RTYPE; //6'b000000;
   funct =  F_SUB; //6'b100010;
   zero = 0;
   reset = 0;
   
   #40;
   //test and 
   opcode =  OP_RTYPE; //6'b000000;
   funct =   F_AND;//6'b100100; //24 in hex
   zero = 0;
   
   #40;
   //test or 
   opcode =  OP_RTYPE; //6'b000000;
   funct = F_OR; //6'b100011;
   zero = 0;
   
   #40;
   //test slt 
   opcode =  OP_RTYPE; //6'b000000;
   funct = F_SLT;  //6'b101010;
   zero = 0;
   
   #50;
   //test lw 
   opcode = OP_LW; //6'b100011; //23 in hex
   //funct = F_ZERO; //6'b000000; //CHECK THIS IN CASE AN ERROR ARISES
   zero = 0;
   
   #40;
   //test sw 
   opcode = OP_SW; //6'b101011; //2B in hex
  // funct = 6'b000000; //CHECK THIS IN CASE AN ERROR ARISES
   zero = 0;
   
   #30;
   //test beq 
   opcode = OP_BEQ; //6'b000100; //4 in hex
  // funct = 6'b000000; //CHECK THIS IN CASE AN ERROR ARISES
   zero = 1;
    #30;
   zero = 0; 
   
   #30;
    
   //test addi 
   opcode = OP_ADDI; //6'b001000; //8 in hex
  // funct = 6'b000000; //CHECK THIS IN CASE AN ERROR ARISES
   zero = 0;
    
    #40;
    
   //test j 
   opcode = OP_J; //6'b000010; //8 in hex
   // funct = //6'b000000; //CHECK THIS IN CASE AN ERROR ARISES
   zero = 0;
   
       #40;
   
    $stop;
    
    end

    
endmodule
