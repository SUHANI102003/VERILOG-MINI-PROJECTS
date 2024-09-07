`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.09.2024 10:42:43
// Design Name: 
// Module Name: carry_select_adder_tb
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


module carry_select_adder_tb();
reg [3:0] a,b;
reg cin_main;
wire [3:0] sum_a,sum_b,sum;
wire carry_final;

carry_select_adder DUT (
        .a(a),
        .b(b),
        .cin_main(cin_main),
        .sum_a(sum_a),
        .sum_b(sum_b),
        .carry_final(carry_final),
        .sum(sum));
        
 initial #200 $finish;
 
 initial
 begin
        a = 4'b1010; b = 4'b0011; cin_main = 1'b0;
  #40   a = 4'b1000; b = 4'b0101; cin_main = 1'b0;
  #40   a = 4'b0010; b = 4'b1111; cin_main = 1'b1;
  #40   a = 4'b1001; b = 4'b0111; cin_main = 1'b0;
  #40   a = 4'b1100; b = 4'b0101; cin_main = 1'b1;
 end
endmodule
