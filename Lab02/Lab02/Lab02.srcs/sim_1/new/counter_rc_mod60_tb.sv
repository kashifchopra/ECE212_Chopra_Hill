`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2023 02:52:15 PM
// Design Name: 
// Module Name: counter_rc_mod60_tb
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


`timescale 1ns / 1ps









module counter_rc_mod60_tb;

logic clk, rst, enb;
logic [5:0] q;
logic cy;

counter_rc_mod60 DUV(.clk(clk), .rst(rst), .enb(enb), .q(q), .cy);
   
  //    generate clock
 parameter CLK_PD = 10;

   always begin
      clk = 1'b0; #(CLK_PD/2);
      clk = 1'b1; #(CLK_PD/2);
   end

initial begin
rst = 1;
@(posedge clk) #1;
rst = 0; 
@(posedge clk) #1;
enb = 1;
#(CLK_PD*200);
enb = 0; 
#(CLK_PD*60);

$stop;
end 

endmodule 
