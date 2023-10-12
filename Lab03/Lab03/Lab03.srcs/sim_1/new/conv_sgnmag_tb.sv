`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2023 03:43:36 PM
// Design Name: 
// Module Name: conv_sgnmag_tb
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

module conv_sgnmag_tb;

logic signed [17:0]tx10; 
logic sign; 
logic [16:0] tx10_conv;

conv_sgnmag CONV_SGNMAG_TB(.tx10, .sign, .tx10_conv);


//generate clock
parameter CLK_PD = 10;

    initial begin
    
    tx10 = -1;
    #10;
    tx10 = -2;
    #10;
    
    tx10 = {14'd10,4'd0};
    #10;
    
     tx10 =  18'b11_0000_0000_0000_0000;  //-ve test; this is -1
    #10;
   
    
    $stop;
    
    end


endmodule
