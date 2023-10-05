`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/28/2023 03:32:34 PM
// Design Name: 
// Module Name: tconvert
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


module tconvert(

input logic signed [12:0] tc,
input logic c_f,
output logic signed [17:0] tx10
);

logic signed [17:0] tc16, tc8, tc2; //tc16 is tc * 16, tc8 is tc*8 and so on.  

assign tc16 = tc<<4; //same as multipl by 16 (then will do tc16+tc2 = tc*18)
assign tc8 = tc<<3;
assign tc2 = tc<<1; 

always_comb begin
    if(c_f) tx10 = (tc16 + tc2) + {14'd320, 4'b0000}; // MUX functionality: If c_f is 1 then do the conversion to Fah by *18 +320 concatenate
    else tx10 = tc8 + tc2;
end 

endmodule
