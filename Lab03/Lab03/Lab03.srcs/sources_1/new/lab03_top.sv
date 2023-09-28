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
     input logic clk, rst,
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
 
 
 
 
endmodule
