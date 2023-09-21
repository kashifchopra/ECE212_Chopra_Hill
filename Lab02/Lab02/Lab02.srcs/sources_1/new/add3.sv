`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2023 03:13:50 PM
// Design Name: 
// Module Name: add3
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


module add3(
	input logic [3:0]a,
	output logic [3:0]y
	);

	always_comb begin 
		if (a<5)y=a;
		else y=a+3;
end 
endmodule 

