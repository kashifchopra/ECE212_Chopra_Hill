`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2023 04:39:21 PM
// Design Name: 
// Module Name: hr_cnt_tb
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


module hr_cnt_tb;

logic clk, rst, enb, adv_hr; 
logic [3:0] h1, h0;
logic cy;

//instantiate DUV
hr_cnt HR_CNT_TB(.clk, .rst, .enb, .adv_hr, .h1, .h0, .cy);

//generate clock
parameter CLK_PD = 10;

always begin 
    clk=1'b0;  #(CLK_PD/2);
    clk = 1'b1; #(CLK_PD/2);
end

initial begin 

 rst =1;
 adv_hr = 0;
 
 @(posedge clk) #1; // wait till first clock edge + 1
  rst = 0;
  @(posedge clk) #1;
  
  enb = 1;
  @(posedge clk) #1;
  @(posedge clk) #1;
 #(CLK_PD*30); // let it run for 10 clock cycles
 
 
 
 @(posedge clk) #1;
 
 adv_hr = 1; 
 #(CLK_PD*10);
 adv_hr = 0;
  #(CLK_PD*10);
 enb = 0;
 #(CLK_PD*10);
 
 $stop;
 
 end  
     
endmodule
