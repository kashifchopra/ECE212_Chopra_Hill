`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2023 03:38:57 PM
// Design Name: 
// Module Name: lab04_top
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


module lab04_top(
    input logic SW15, SW14, clk, rst, adv_min, adv_hr,
    output logic [7:0] an_n, //FIXME - put exact name of d7_in or whatever
    output logic segs_n [6:0],
    output logic dp_n,
    inout tmp_scl, // use inout only - no logic
    inout tmp_sda // use inout only - no logic
    );
    
    logic sel_wire;
    logic [6:0] d7_in,d6_in, d5_in,d4_in,d3_in,d2_in,d1_in,d0_in; //input wires going into d7 d6 etc
    logic [6:0] s0, s1, m0, m1, h0, h1, am_pm;
     
    fsm FSM (.SW15, .SW14, .enb, .sel(sel_wire), .c_f); //FIXME - the ENB for the FSM
    dig_clock DIG_CLOCK (.clk, .rst, .adv_min, .adv_hr, .s0(s0), .s1(s1), .m0(m0), .m1(m1), .h0(h0), .h1(h1), .am_pm(am_pm));
    tempTop TEMPTOP (.clk, .rst, .c_f, .tmp_scl, .tmp_sda, .d7_in(d7_in),. d6_in(d6_in), .d5_in(d5_in),. d4_in(d4_in), .d3_in(d3_in), .d2_in(d2_in), .d1_in(d1_in), .d0_in(d0_in));
    
    logic [6:0] d7_wire, d6_wire, d5_wire, d4_wire, d3_wire, d2_wire, d1_wire, d0_wire; //final wires going into the seven seg ctl 
    
    always_comb begin
    
        if(sel_wire) begin
            d7_wire = d7_in;
            d6_wire = d6_in;
            d5_wire = d5_in;
            d4_wire = d4_in;
            d3_wire = d3_in;
            d2_wire = d2_in;
            d1_wire = d1_in;
            d0_wire = d0_in;
            
        end
        
        else begin
            d7_wire = h1;
            d6_wire = h0;
            d5_wire = m1;
            d4_wire = m0;
            d3_wire = s1;
            d2_wire = s0;
            d1_wire = 7'b1000000;
            d0_wire = am_pm;
            
        end
    end
    
    
    sevenseg_ctl SEVENSEG_CTL(.d7(d7_wire), .d6(d6_wire), .d5(d5_wire), .d4(d4_wire), .d3(d3_wire), .d2(d2_wire), .d1(d1_wire), .d0(d0_wire), .clk, .rst, .segs_n, .an_n, .dp_n);
    
    
    //From lab 2 top: 
    // sevenseg_ctl CTRL (.clk(clk), .rst(rst), .d0(am_pm), .d1(7'b1000000), .d2(s0), .d3(s1), .d4(m0), .d5(m1), .d6(h0), .d7(h1), .segs_n, .dp_n, .an_n);
    
    //From Lab3 top: 
// sevenseg_ctl SEVENSEG_CTL(.d7(d7_in), .d6(d6_in), .d5(d5_in), .d4(d4_in), .d3(d3_in), .d2(d2_in), .d1(d1_in), .d0(d0_in), .clk, .rst, .segs_n, .an_n, .dp_n);

 
 
 
endmodule
