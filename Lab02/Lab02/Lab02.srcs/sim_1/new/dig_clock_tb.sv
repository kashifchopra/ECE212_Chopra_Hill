`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2023 11:06:34 PM
// Design Name: 
// Module Name: dig_clock_tb
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


module dig_clock_tb;

logic clk, rst, adv_min, adv_hr; 
logic [6:0] s0, s1, m0, m1, h0, h1, am_pm;


//instantiate DUV
dig_clock DIG_CLK_TB(.clk, .rst, .adv_min, .adv_hr, .s1, .s0, .m1, .m0, .h1, .h0, .am_pm);

//generate clock
parameter CLK_PD = 10;

always begin 
    clk=1'b0;  #(CLK_PD/2);
    clk = 1'b1; #(CLK_PD/2);
end

initial begin 

 rst =1;
 adv_hr = 0;
 adv_min = 0;
 
 @(posedge clk) #1; // wait till first clock edge + 1
  rst = 0;
  @(posedge clk) #1;
  

  @(posedge clk) #1;
  @(posedge clk) #1;
 #(CLK_PD*30); // let it run for 10 clock cycles
 
 
 
 @(posedge clk) #1;
 
 adv_hr = 1; 
 #(CLK_PD*10);
 adv_hr = 0;
  #(CLK_PD*10);

 #(CLK_PD*10);
 
 $stop;
 
 end  


    
endmodule
