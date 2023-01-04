`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2023 19:58:36
// Design Name: 
// Module Name: Nbit_multiplier_TB
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


module Nbit_multiplier_TB;
parameter n=4;
reg[n-1:0] a_in;
reg[n-1:0] b_in;
reg clk,rst,start;

wire [(n*2)-1:0] out;
wire finish;

Nbit_multiplier dut(out, a_in, b_in, clk, rst ,finish, start);
defparam dut.N=n;
initial
 begin
   forever
    #50 clk=~clk;
 end
 initial
   begin
     a_in=0;
     b_in=0;
     clk=0;
     rst=1;
     start=0;
     
     #100;
     rst=0;
     a_in='d15;
     b_in='d15;
     start=0;
     #200
     start=1;
     #(100*n);
     #100;
     $finish;
     
  end   
     
endmodule
