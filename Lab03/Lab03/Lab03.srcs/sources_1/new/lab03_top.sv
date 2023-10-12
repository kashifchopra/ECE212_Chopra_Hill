`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/28/2023 03:27:21 PM
// Design Name: 
// Module Name: lab03_top
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


module lab03_top(
     input logic clk, rst, c_f, //CHECKME Added the c_f here
     output logic [7:0] an_n,
     output logic [6:0] segs_n,
     output logic dp_n,
     inout tmp_scl, // use inout only - no logic
     inout tmp_sda // use inout only - no logic
 );
 logic tmp_rdy, tmp_err; // unused temp controller outputs
 // 13-bit two's complement result with 4-bit fractional part
 logic [12:0] temp;


 // instantiate the VHDL temperature sensor controller
 TempSensorCtl U_TSCTL (
     .TMP_SCL(tmp_scl), .TMP_SDA(tmp_sda), .TEMP_O(temp),
     .RDY_O(tmp_rdy), .ERR_O(tmp_err), .CLK_I(clk),
     .SRST_I(rst)
 );
  
 // add additional signals & instantiations here
 
 logic sign_wire;
 
 logic thou_wire;
 logic hund_wire;
 logic tens_wire;
 logic ones_wire;

 
 tdisplay TDISPLAY (.tc(temp), .c_f, .sign(sign_wire), .thou(thou_wire), .hund(hund_wire), .tens(tens_wire), .ones(ones_wire)); //put thou1, hund1,tens1 logic ato find a way for the always comb block to work. Can remove them later 
 
 sevenseg_ctl SEVENSEG_CTL(.d7(d7_in), .d6(d6_in), .d5(d5_in), .d4(d4_in), .d3(d3_in), .d2(d2_in), .d1(d1_in), .d0(d0_in), .clk, .rst, .segs_n, .an_n, .dp_n);
 
 logic d7_in,d6_in, d5_in,d4_in,d3_in,d2_in,d1_in,d0_in; //input wires going into d7 d6 etc
  
 always_comb begin
    if(thou_wire != 0) begin
        d7_in = 7'b1000000; //CHECKME is this the right input for hardcode blank? 
        d6_in = sign_wire;
        d5_in = thou_wire;
        d4_in = hund_wire;
        d3_in = tens_wire;
        d2_in = 7'b0100000; //CHECKME is this the right input for hard code decimal point? 
        d1_in = ones_wire;
        
            if(c_f ==1) begin
                 d0_in = 7'd12; //CHECKME i think this was what displayed C?
            end else begin
                 d0_in = 7'd13; //i think this was to display F in the seven seg display
            end
        
    end else if(hund_wire != 0) begin    // FIXME : fill in the situations below 
       
        d7_in = 7'b1000000; //CHECKME is this the right input for hardcode blank? 
        d6_in = 7'b1000000;
        d5_in = sign_wire;
        d4_in = hund_wire;
        d3_in = tens_wire;
        d2_in = 7'b0100000; //CHECKME is this the right input for hard code decimal point? 
        d1_in = ones_wire;
        
            if(c_f ==1) begin
                 d0_in = 7'd12; //CHECKME i think this was what displayed C?
            end else begin
                 d0_in = 7'd13; //i think this was to display F in the seven seg display
            end
       
    end else if(tens_wire !=0) begin
        
        d7_in = 7'b1000000; //CHECKME is this the right input for hardcode blank? 
        d6_in = 7'b1000000;
        d5_in = 7'b1000000;
        d4_in = sign_wire;
        d3_in = tens_wire;
        d2_in = 7'b0100000; //CHECKME is this the right input for hard code decimal point? 
        d1_in = ones_wire;
        
            if(c_f ==1) begin
                 d0_in = 7'd12; //CHECKME i think this was what displayed C?
            end else begin
                 d0_in = 7'd13; //i think this was to display F in the seven seg display
            end
        
    end else begin
        d7_in = 7'b1000000; //CHECKME is this the right input for hardcode blank? 
        d6_in = 7'b1000000;
        d5_in = 7'b1000000;
        d4_in = 7'b1000000; //if its 0 we dont need -ve sign so ittl be blanked 
        d3_in = 7'd0; //CHECKME - this might display as blanked in the sevenseg. for this digit 0 also needs to be displayed 
        d2_in = 7'b0100000; //CHECKME is this the right input for hard code decimal point? 
        d1_in = ones_wire;
        
            if(c_f ==1) begin
                 d0_in = 7'd12; //CHECKME i think this was what displayed C?
            end else begin
                 d0_in = 7'd13; //i think this was to display F in the seven seg display
            end
    end
 
 end
 
 
 
 
 
endmodule
