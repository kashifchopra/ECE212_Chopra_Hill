`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2023 01:50:02 PM
// Design Name: 
// Module Name: round_tb
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


module round_tb;
 
logic [16:0] tx10_conv;
logic [12:0] tx10_convrnd;

round ROUND_TB(.tx10_conv, .tx10_convrnd);


//generate clock
parameter CLK_PD = 10;

    initial begin
    
    tx10_conv = {13'd10,4'b1000};
    #10;
    
    tx10_conv = {13'd10,4'd6};
    #10;
   
    
    $stop;
    end
    
    endmodule