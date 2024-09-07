`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.09.2024 21:09:51
// Design Name: 
// Module Name: carry_select_adder
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


module carry_select_adder(
    input [3:0] a,b,
    input cin_main,
    output [3:0] sum_a,sum_b,sum,
    output carry_final
    );
    
wire cout_a,cout_b;    
adder_4bit A0 (
    .A(a),
    .B(b),
    .cin(1'b0),
    .sum(sum_a),
    .propagation(),
    .prop_out(),
    .cout(cout_a));
    
adder_4bit A1 (
    .A(a),
    .B(b),
    .cin(1'b1),
    .sum(sum_b),
    .propagation(),
    .prop_out(),
    .cout(cout_b));

MUX_21 M0 (
    .i0(cout_a),
    .i1(cout_b),
    .sel(cin_main),
    .f(carry_final));
    
MUX_21 M1 (
    .i0(sum_a[0]),
    .i1(sum_b[0]),
    .sel(cin_main),
    .f(sum[0]));
    
MUX_21 M2 (
    .i0(sum_a[1]),
    .i1(sum_b[1]),
    .sel(cin_main),
    .f(sum[1]));
    
MUX_21 M3 (
    .i0(sum_a[2]),
    .i1(sum_b[2]),
    .sel(cin_main),
    .f(sum[2]));
    
MUX_21 M4 (
    .i0(sum_a[3]),
    .i1(sum_b[3]),
    .sel(cin_main),
    .f(sum[3]));
endmodule
