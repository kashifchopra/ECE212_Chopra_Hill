`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/28/2023 04:51:27 PM
// Design Name: 
// Module Name: conv_sgnmag
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


module conv_sgnmag(
input logic signed [17:0] tx10,
output  logic [16:0] tx10_conv,
output logic sign
    );
    
assign sign = tx10[17]; //sets sign = sign bit 

always_comb begin
    
    if(sign) tx10_conv = ~tx10_conv; //if sign bit is 1, negate the value of the others
    else tx10_conv =  tx10_conv;
    
end
    
endmodule
