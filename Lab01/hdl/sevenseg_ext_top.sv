`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/31/2023 03:30:39 PM
// Design Name: 
// Module Name: sevenseg_ext_top
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


module sevenseg_ext_top(

input logic [6:0] data,
output [6:0] segs_n,
output [7:0] an_n,
output dp_n
    );
    
    assign an_n = 8'b11111110; 
    seven_seg_n SEV(.d(data), .segs_n(segs_n), .dp_n(dp_n));
endmodule
