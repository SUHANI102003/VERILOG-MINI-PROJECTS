`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.09.2024 16:29:44
// Design Name: 
// Module Name: array_multiplier
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
// 4 * 4 multiplier for unsigned binary numbers

module array_multiplier(
input [3:0] m , q,
output [7:0] product
    );

// 1st row
wire [14:0] c;  
wire [9:1] sum_out; 
wire [15:0] q_out;
wire [11:0] m_out;
//************************************ 
mul_unit_cell uut0 (
                     .m_j(m[0]),
                     .q_j(q[0]),
                     .carry_in(1'b0),
                     .sum_in(1'b0),
                     .sum_out(product[0]),
                     .carry_out(c[0]),
                     .m_out(m_out[0]),
                     .q_out(q_out[0])   );
                     
mul_unit_cell uut1 (
                     .m_j(m[1]),
                     .q_j(q_out[0]),
                     .carry_in(c[0]),
                     .sum_in(1'b0),
                     .sum_out(sum_out[1]),
                     .carry_out(c[1]),
                     .m_out(m_out[1]),
                     .q_out(q_out[1])   );
                     
mul_unit_cell uut2 (
                     .m_j(m[2]),
                     .q_j(q_out[1]),
                     .carry_in(c[1]),
                     .sum_in(1'b0),
                     .sum_out(sum_out[2]),
                     .carry_out(c[2]),
                     .m_out(m_out[2]),
                     .q_out(q_out[2])   );
                     
mul_unit_cell uut3 (
                     .m_j(m[3]),
                     .q_j(q_out[2]),
                     .carry_in(c[2]),
                     .sum_in(1'b0),
                     .sum_out(sum_out[3]),
                     .carry_out(c[3]),
                     .m_out(m_out[3]),
                     .q_out(q_out[3])   );

//**********************************************
// 2nd row
mul_unit_cell uut4 (
                     .m_j(m_out[0]),
                     .q_j(q[1]),
                     .carry_in(1'b0),
                     .sum_in(sum_out[1]),
                     .sum_out(product[1]),
                     .carry_out(c[4]),
                     .m_out(m_out[4]),
                     .q_out(q_out[4])   );
                     
mul_unit_cell uut5 (
                     .m_j(m_out[1]),
                     .q_j(q_out[4]),
                     .carry_in(c[4]),
                     .sum_in(sum_out[2]),
                     .sum_out(sum_out[4]),
                     .carry_out(c[5]),
                     .m_out(m_out[5]),
                     .q_out(q_out[5])   );
                     
 mul_unit_cell uut6 (
                     .m_j(m_out[2]),
                     .q_j(q_out[5]),
                     .carry_in(c[5]),
                     .sum_in(sum_out[3]),
                     .sum_out(sum_out[5]),
                     .carry_out(c[6]),
                      .m_out(m_out[6]),
                     .q_out(q_out[6])   );
                     
mul_unit_cell uut7 (
                     .m_j(m_out[3]),
                     .q_j(q_out[6]),
                     .carry_in(c[6]),
                     .sum_in(c[3]),
                     .sum_out(sum_out[6]),
                     .carry_out(c[7]),
                     .m_out(m_out[7]),
                     .q_out(q_out[7])   );

//************************************************                     
// 3rd row
mul_unit_cell uut8 (
                     .m_j(m_out[4]),
                     .q_j(q[2]),
                     .carry_in(1'b0),
                     .sum_in(sum_out[4]),
                     .sum_out(product[2]),
                     .carry_out(c[8]),
                     .m_out(m_out[8]),
                     .q_out(q_out[8])   );
                     
 mul_unit_cell uut9 (
                     .m_j(m_out[5]),
                     .q_j(q_out[8]),
                     .carry_in(c[8]),
                     .sum_in(sum_out[5]),
                     .sum_out(sum_out[7]),
                     .carry_out(c[9]),
                     .m_out(m_out[9]),
                     .q_out(q_out[9])   );
                     
mul_unit_cell uut10 (
                     .m_j(m_out[6]),
                     .q_j(q_out[9]),
                     .carry_in(c[9]),
                     .sum_in(sum_out[6]),
                     .sum_out(sum_out[8]),
                     .carry_out(c[10]),
                     .m_out(m_out[10]),
                     .q_out(q_out[10])   );
                     
mul_unit_cell uut11 (
                     .m_j(m_out[7]),
                     .q_j(q_out[10]),
                     .carry_in(c[10]),
                     .sum_in(c[7]),
                     .sum_out(sum_out[9]),
                     .carry_out(c[11]),
                     .m_out(m_out[11]),
                     .q_out(q_out[11])   );
                     
 //********************************************************
// 4th row

mul_unit_cell uut12 (
                     .m_j(m_out[8]),
                     .q_j(q[3]),
                     .carry_in(1'b0),
                     .sum_in(sum_out[7]),
                     .sum_out(product[3]),
                     .carry_out(c[12]),
                     .m_out(),
                     .q_out(q_out[12])   );
                     
mul_unit_cell uut13 (
                     .m_j(m_out[9]),
                     .q_j(q_out[12]),
                     .carry_in(c[12]),
                     .sum_in(sum_out[8]),
                     .sum_out(product[4]),
                     .carry_out(c[13]),
                     .m_out(),
                     .q_out(q_out[13])   );
                     
 mul_unit_cell uut14 (
                     .m_j(m_out[10]),
                     .q_j(q[3]),
                     .carry_in(c[13]),
                     .sum_in(sum_out[9]),
                     .sum_out(product[5]),
                     .carry_out(c[14]),
                     .m_out(),
                     .q_out(q_out[14])   );
                     
 mul_unit_cell uut15 (
                     .m_j(m_out[11]),
                     .q_j(q[3]),
                     .carry_in(c[14]),
                     .sum_in(c[11]),
                     .sum_out(product[6]),
                     .carry_out(product[7]),
                     .m_out(),
                     .q_out(q_out[15])   );
endmodule
