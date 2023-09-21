`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2023 01:55:23 PM
// Design Name: 
// Module Name: period_enb_tb
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


module period_enb_tb;

logic clk, rst, clr;
logic enb_out;


period_enb DUV(.clk(clk), .rst(rst), .clr(clr), .enb_out(enb_out));
   
  //    generate clock
 parameter CLK_PD = 10;

   always begin
      clk = 1'b0; #(CLK_PD/2);
      clk = 1'b1; #(CLK_PD/2);
   end

initial begin
clr = 1;
@(posedge clk) #1;
clr = 0;
@(posedge clk) #1;
//rst = 1; 
@(posedge clk) #1;
rst = 0;
//@(posedge clk) #1;
//@(posedge clk) #1;
//@(posedge clk) #1;
//@(posedge clk) #1;
//@(posedge clk) #1;
//@(posedge clk) #1;
//@(posedge clk) #1;
//@(posedge clk) #1;
//@(posedge clk) #1;
//@(posedge clk) #1;
//@(posedge clk) #1;
#(CLK_PD*100000);
//@(posedge clk) #1;
//@(posedge clk) #1;
//@(posedge clk) #1;
//@(posedge clk) #1;
//@(posedge clk) #1;
//@(posedge clk) #1;
//@(posedge clk) #1;
//@(posedge clk) #1;
//@(posedge clk) #1;
//@(posedge clk) #1;
//@(posedge clk) #1;
//@(posedge clk) #1;
//@(posedge clk) #1;
//@(posedge clk) #1;
//@(posedge clk) #1;
//@(posedge clk) #1;
//@(posedge clk) #1;


$stop;
end 

endmodule
