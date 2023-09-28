`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/28/2023 04:20:00 PM
// Design Name: 
// Module Name: mpy_18
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


module mpy_18 #(parameter W=13) (input logic [W-1:0] a,  //parameter changed to 13 bits
			       output logic [W+4-1:0] y);
   assign y = (a << 4) + (a << 1);

endmodule: mpy_18
