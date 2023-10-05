`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2023 02:15:45 PM
// Design Name: 
// Module Name: tconvert_tb
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


module tconvert_tb;

logic signed [12:0]tc; 
logic c_f; 
logic signed [17:0] tx10;

tconvert TCONV_TB(.tc, .c_f, .tx10);


//generate clock
parameter CLK_PD = 10;

    initial begin
    c_f = 0; //celsius 
    tc = 13'd0;
    
    #10;
    
    tc = 13'd20;           //CHECKME - test for negatives too
    #10;
     tc = 13'd40;
    #10;
     tc = 13'd60;
    #10;
     tc = 13'd80;
    #10;
     tc = 13'd100;
    #10;
     tc = 13'd120;
    #10;
    
    
    //for fahrenheit
    
     c_f = 1; //fah 
    tc = 13'd0;
    
    #10;
    
    tc = 13'd20;           //CHECKME - test for negatives too
    #10;
     tc = 13'd40;
    #10;
     tc = 13'd60;
    #10;
     tc = 13'd80;
    #10;
     tc = 13'd100;
    #10;
     tc = 13'd120;
    #10;
     tc = 13'd1600;
    #10;
    tc = {9'd100,4'b0000};
    #10;
    tc = 13'b1_0000_0000_0000;  //-ve test
    #10;
    
    
    $stop;
    
    end


endmodule
