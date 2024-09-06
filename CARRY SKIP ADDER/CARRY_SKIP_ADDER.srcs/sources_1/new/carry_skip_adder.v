`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.09.2024 20:04:59
// Design Name: 
// Module Name: carry_skip_adder
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


module carry_skip_adder(
input [3:0] a,b,
input cin,
output [3:0] sum,
output cout_final
    );
wire propagation,cout;    
adder_4bit uut0 (
    .A(a),
    .B(b),
    .cin(cin),
    .sum(sum),
    .propagation(),
    .cout(cout),
    .prop_out(propagation));

MUX_21 uut1 (
    .i0(cout),
    .i1(cin),
    .sel(propagation),
    .f(cout_final));
endmodule
