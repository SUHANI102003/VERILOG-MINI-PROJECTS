`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.09.2024 16:17:04
// Design Name: 
// Module Name: mul_unit_cell
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


module mul_unit_cell(
input m_j,   // multiplicand
input q_j,   // multiplier
input carry_in,sum_in,
output sum_out,carry_out,m_out,q_out
    );
    
wire fa_inp_b;

and a0 (fa_inp_b, m_j, q_j);

Full_adder FA (
        .a(sum_in),
        .b(fa_inp_b),
        .cin(carry_in),
        .sum(sum_out),
        .cout(carry_out));
 
 assign m_out = m_j;
 assign q_out = q_j;      
endmodule
