`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2023 04:39:17 PM
// Design Name: 
// Module Name: fsm
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


module fsm(
    input logic clk, SW15, SW14, enb, rst,
    output logic sel, c_f
    );
    
    typedef enum logic [1:0]{
    DTIME = 2'b00, DF = 2'b01, DC = 2'b10
    } states_t;

    states_t state, next;
    
    always_ff @(posedge clk) 
        if (rst) state <= DTIME;
        else     state <= next; 
         
    
    
    always_comb begin
        
        sel = 0;
        c_f = 0;
        next = DTIME; 
        
        case(state)
            DTIME: begin
            
                sel = 0; 
                c_f = 0;
                
                if ((!SW15&&!SW14&&enb)|| !enb) next = DTIME;
                else if((enb&&!SW15&&SW14) || (enb&&SW15&&SW14)) next = DF;
                else if (enb) next = DC; //Checkme - ive not coded the conditions since its just the last else statement
                else next = DTIME;
                
            end
            
            DF: begin
                 sel = 1;
                 c_f = 1;
                 
                if (!enb) next = DF;
                else if(enb&&!SW15&&SW14) next = DTIME;
                else next = DC;  //Checkme - ive not coded the conditions since its just the last else statement
            
            end
            
            DC: begin
            
                sel = 1;
                c_f = 0;
            
                if (!enb) next = DC;
                else next = DTIME;
                
                
            end
      
      endcase 
    end
    
endmodule
