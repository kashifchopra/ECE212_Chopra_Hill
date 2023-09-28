`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2023 03:16:31 PM
// Design Name: 
// Module Name: dig_clock
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


module dig_clock(

input logic clk, rst, adv_min, adv_hr, 
output logic [6:0] s0, s1, m0, m1, h0, h1, am_pm

);

logic clr, s0Enb_adv, s0Enb, s1Enb, m0Enb, s1Enb_adv, m1Enb, m1Enb_adv; //s0Enb_adv is the enb input that goes INTO s0 

period_enb #(.PERIOD_MS(1000))ENB (.clk, .rst, .clr, .enb_out(enb));

assign s0Enb_adv = (!(adv_min || adv_hr)) && enb;

assign s1Enb_adv = s1Enb || (adv_min && enb);

assign m1Enb_adv = m1Enb || (adv_hr && enb);



//assign s0Enb = (!(adv_hr || adv_min) && enb);

//always_comb begin  //CHECKME





counter_rc_mod #(.MOD(10)) S_ONES (.clk, .rst, .enb(s0Enb_adv), .q(s0[3:0]), .cy(s0Enb)); //s0Enb_adv added
//connect preceding .cy output to next module's .enb input 
counter_rc_mod #(.MOD(6)) S_TENS (.clk, .rst, .enb(s0Enb), .q(s1[3:0]), .cy(s1Enb));

assign s0[6:4] = 3'b000;
assign s1[6:4] = 3'b000;



counter_rc_mod #(.MOD(10)) M_ONES (.clk, .rst, .enb(s1Enb_adv), .q(m0[3:0]), .cy(m0Enb));
counter_rc_mod #(.MOD(6)) M_TENS (.clk, .rst, .enb(m0Enb), .q(m1[3:0]), .cy(m1Enb));
//M_TENS must include an additional adv_min input, allowing the value of q to be rained by one each time the button is pressed

assign m0[6:4] = 3'b010;
assign m1[6:4] = 3'b000;




hr_cnt HR_CNT(.clk, .rst, .enb(m1Enb_adv), .h1(h1[3:0]), .h0(h0[3:0]), .cy(am_pm[0]));
assign h0[6:4] = 3'b010;

always_comb begin
//assign h1[6:4] = 3'b000; //Try blanking here
      if(h1[3:0] == 4'd0) begin
        h1[6:4] = 3'b100;
      end else begin 
         h1[6:4] = 3'b000;
      end
  end


assign am_pm[6:1]=6'b000101;

//counter_rc_mod #(.MOD(10)) H_ONES (.clk, .rst, .enb, .q(h0[3:0]), .cy);
////M_TENS must include an additional adv_min input, allowing the value of q to be rained by one each time the button is pressed
//counter_rc_mod #(.MOD(1)) H_TENS (.clk, .rst, .enb, .q(h1[3:0]), .cy);

//assign h0[6:4] = 3'b0000;
//assign h1[6:4] = 3'b0000;

//FSM for am_pm?
//state am AND STATE pm, states flip every time 
//assign s0Enb = (!(adv_hr || adv_min) && enb);
 
endmodule
