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

logic clk,reset, zero;
logic[6:0] opcode; 
logic[6:0] funct;

     logic       pcen, memwrite, irwrite, regwrite;
     logic       alusrca, iord, memtoreg, regdst;
     logic [1:0] alusrcb, pcsrc;
     logic [2:0] alucontrol;
 
controller DUV(.clk(clk), .reset(reset), .opcode(opcode), .funct(funct), .zero(zero) ,.pcen(pcen), .memwrite(memwrite), .irwrite(irwrite), .regwrite(regwrite), .alusrca(alusrca), .iord(iord), .memtoreg(memtoreg), .regdst(regdst),.alusrcb(alusrcb), .pcsrc(pcsrc), .alucontrol(alucontrol));

//generate clock
parameter CLK_PD = 10;

    initial begin
    
   #10
   //test add
   opcode = 6'b000000;
   funct = 6'b100000;
   zero = 0;
   
   #10
   //test sub 
   opcode = 6'b000000;
   funct = 6'b100010;
   zero = 0;
   
   #10
   //test and 
   opcode = 6'b000000;
   funct = 6'b100100; //24 in hex
   zero = 0;
   
   #10
   //test or 
   opcode = 6'b000000;
   funct = 6'b100011;
   zero = 0;
   
   #10
   //test slt 
   opcode = 6'b000000;
   funct = 6'b101010;
   zero = 0;
   
   #10
   //test lw 
   opcode = 6'b100011; //23 in hex
   funct = 6'b000000; //CHECK THIS IN CASE AN ERROR ARISES
   zero = 0;
   
   #10
   //test sw 
   opcode = 6'b101011; //2B in hex
   funct = 6'b000000; //CHECK THIS IN CASE AN ERROR ARISES
   zero = 0;
   
   #10
   //test beq 
   opcode = 6'b000100; //4 in hex
   funct = 6'b000000; //CHECK THIS IN CASE AN ERROR ARISES
   zero = 1;
   
   #10
   //test addi 
   opcode = 6'b001000; //8 in hex
   funct = 6'b000000; //CHECK THIS IN CASE AN ERROR ARISES
   zero = 0;
    
    #10
   //test j 
   opcode = 6'b000010; //8 in hex
   funct = 6'b000000; //CHECK THIS IN CASE AN ERROR ARISES
   zero = 0;
   
   
    $stop;
    
    end

    
endmodule
