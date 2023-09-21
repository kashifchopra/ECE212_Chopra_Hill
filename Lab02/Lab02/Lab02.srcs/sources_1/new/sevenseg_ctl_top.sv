`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2023 01:56:31 PM
// Design Name: 
// Module Name: sevenseg_ctl_top
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


module sevenseg_ctl_top(

input clk, rst,
output [6:0] segs_n,
output [7:0] an_n,
output dp_n
    ); 

logic [6:0] d7, d6, d5, d4, d3, d2, d1, d0;  

assign d7 = 7'h0;
assign d6 = 7'h1;
assign d5 = 7'h2;
assign d4 = 7'b0010000;
assign d3 = 7'hA;
assign d2 = 7'hB;
assign d1 = 7'hC;
assign d0 = 7'hF;

sevenseg_ctl CTRL (.clk(clk), .rst(rst), .d0, .d1, .d2, .d3, .d4, .d5, .d6, .d7, .segs_n, .dp_n, .an_n);
    

    
endmodule
