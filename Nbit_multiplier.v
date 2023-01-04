`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2023 19:33:32
// Design Name: 
// Module Name: Nbit_multiplier
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


module Nbit_multiplier(
out, a_in, b_in, clk, rst ,finish, start
    );
    parameter N=8;
    output [(N*2)-1:0] out;output finish;
    input[N-1:0] a_in;
    input [N-1:0] b_in;
    input clk,rst,start;
    
    reg [(N*2)-1:0] a_reg;
    reg [(N*2)-1:0] b_reg;
    reg [(N*2)-1:0] out_reg;
    reg [8:0] bits;
    reg finish_reg=0;
    
    assign finish= finish_reg;
    assign out= out_reg;
    
   always@(negedge rst)
     begin 
          out_reg=0;
          a_reg=0;
          b_reg=0;
     end
     
   always@(posedge clk)  
      begin
            case(start)
              1'b0: begin 
                           a_reg=a_in;
                           b_reg=b_in;
                           out_reg=out;
                           bits=N;
                           finish_reg=0;
                           $display("values loaded into the registers");
                    end
              1'b1: begin
                            if(b_reg[0]==1)
                               begin
                                  out_reg= out_reg + a_reg;
                               end
                            bits=bits-1;
                            a_reg=a_reg<<1;   
                            b_reg=b_reg>>1;
                    end   
   endcase
   if(bits==0)
      begin
        $display("Multiplication completed");
        finish_reg=1'b1;
      end                    
      end
endmodule
