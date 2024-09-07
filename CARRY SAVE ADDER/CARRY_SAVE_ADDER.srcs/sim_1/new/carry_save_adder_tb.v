`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.09.2024 11:35:25
// Design Name: 
// Module Name: carry_save_adder_tb
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


module carry_save_adder_tb();
reg [3:0] A,B,C;
wire[4:0] sum;
wire carry;

carry_save_adder DUT (
    .A(A), .B(B), .C(C), .sum(sum), .carry(carry));
    
initial #200 $finish;

initial
begin
      A = 4'd11; B = 4'd14; C = 4'd12;
 #50  A = 4'd12; B = 4'd3; C = 4'd15;
 #50  A = 4'd14; B = 4'd15; C = 4'd10;
end    
endmodule
