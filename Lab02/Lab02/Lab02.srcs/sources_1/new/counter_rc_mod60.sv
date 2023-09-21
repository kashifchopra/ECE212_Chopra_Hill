`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2023 02:50:43 PM
// Design Name: 
// Module Name: counter_rc_mod60
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


module counter_rc_mod60(
input logic clk, rst, enb,
    output logic [5:0] q,
    output logic cy
    );

    parameter MOD = 6'd60;

    assign cy = (q == MOD-1) && enb;

    always_ff @(posedge clk) begin
        if (rst || cy) q <= 0;
        else if (enb) q <= q + 1;
    end

endmodule
