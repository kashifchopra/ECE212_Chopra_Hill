`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2023 04:20:14 PM
// Design Name: 
// Module Name: hr_cnt
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


module hr_cnt(

        input logic clk, rst, enb,
        output logic [3:0] h1, h0,
        output logic cy //am_pm count
        );
         
         
//        always_comb begin
//           if (adv_hr) begin 
//            h0 = h0 + 1; 
//           end
        
//        end
         
         
        always_ff@(posedge clk)
        
        if(rst) begin
            h1=1;
            h0=2;
            cy=0;
        end 
        
        
        else if(enb) begin
        
            if(h1 == 1 && h0 == 2) begin
            h1=0;
            h0=1;
            end
            
            
            else begin
            
                if(h0 == 9)begin
                 h1<=1;
                 h0<=0;
                 end
                 
                 else begin
                 
                   h0<= h0+1;
                  
                   if(h1==1 && h0 ==1) begin
                     cy <= !cy; 
                   end 
                 
                  end 
   
             end
        
        end 
 
endmodule
