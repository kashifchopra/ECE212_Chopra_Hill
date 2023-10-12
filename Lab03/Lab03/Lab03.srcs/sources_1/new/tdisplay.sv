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
    
    logic [17:0] tx10_wire; 
    logic [16:0] tx10_conv_wire;
    logic [12:0] tx10_convrnd_wire;
    
    tconvert TCONVERT (.tc, .c_f, .tx10(tx10_wire));
    conv_sgnmag CONV_SGNMAG (.tx10(tx10_wire), .tx10_conv(tx10_conv_wire), .sign);  
    round ROUND (.tx10_conv(tx10_conv_wire),.tx10_convrnd(tx10_convrnd_wire));
    dbl_dabble_ext DBL_DABBLE_EXT (.b(tx10_convrnd_wire), .thou, .hund, .tens, .ones);
    
endmodule
