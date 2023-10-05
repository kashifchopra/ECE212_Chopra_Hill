`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2023 01:38:22 PM
// Design Name: 
// Module Name: round
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


module round( input logic [16:0] tx10_conv,
output logic [12:0] tx10_convrnd
);
    
    always_comb begin
    
       if(tx10_conv[3] == 1) tx10_convrnd[12:0] = tx10_conv[16:4] + 1; //need to see bit 3 its the first fraction bit
       else tx10_convrnd[12:0] = tx10_conv[16:4];
       
    end
endmodule
