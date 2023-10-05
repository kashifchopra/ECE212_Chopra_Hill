`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2023 02:00:22 PM
// Design Name: 
// Module Name: convert_top
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


module tdisplay( input logic [12:0] tc,
input logic c_f,
output logic sign,
output logic [3:0] thou, hund, tens, ones
    );
    
    tconvert TCONVERT (.tc, .c_f, .tx10);
    conv_sgnmag CONV_SGNMAG (.tx10, .tx10_conv, .sign);  
    round ROUND (.tx10_conv,.tx10_convrnd);
    dbl_dabble_ext (.b(tx10_convrnd), .thou(thousands), .hund(hundreds), .tens(tens), .ones(ones));
    
endmodule
