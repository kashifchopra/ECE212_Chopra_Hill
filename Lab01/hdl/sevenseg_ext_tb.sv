`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/31/2023 02:02:29 PM
// Design Name: 
// Module Name: sevenseg_ext_tb
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


module sevenseg_ext_tb;

logic [6:0] d;
logic [6:0] segs_n;
logic dp_n ;

seven_seg_n DUV( .d(d[7:0]), .segs_n(segs_n[7:0]), .dp_n(dp_n));

initial begin

d=7'b1000000;
#10;
d[4] =1;
#10;


d=7'd0;
#10;
d=7'd1;
#10;
d=7'd2;
#10;
d=7'd3;
#10;
d=7'd4;
#10;
d=7'd5;
#10;
d=7'd6;
#10;
d=7'd7;
#10;
d=7'd8;
#10;
d=7'd9;
#10;
d=7'd10;
#10;
d=7'd11;
#10;
d=7'd12;
#10;
d=7'd15;
#10;


d[5] =1;
d[6] =1; //TEST
#10;

d[5] =1;//TEST
d[6] =0; //TEST
#10;
$stop;
 end
 
 
endmodule
