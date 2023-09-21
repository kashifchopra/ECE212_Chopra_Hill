`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2023 09:53:16 PM
// Design Name: 
// Module Name: dig_clock_top
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


module dig_clock_top(
        input logic clk, rst, clr, adv_hr, adv_min, 
        output logic [7:0] an_n, 
        output logic [6:0] segs_n, 
        output logic dp_n
    );
    
        logic [6:0] h1, h0, m1 , m0, s1 ,s0, am_pm;
        
        
        dig_clock CLOCK (.clk, .rst, .h1, .h0, .m1 , .m0, .s1, .s0, .am_pm, .adv_hr, .adv_min);
        sevenseg_ctl CTRL (.clk(clk), .rst(rst), .d0(am_pm), .d1(7'b1000000), .d2(s0), .d3(s1), .d4(m0), .d5(m1), .d6(h0), .d7(h1), .segs_n, .dp_n, .an_n);
        
        
        
endmodule
