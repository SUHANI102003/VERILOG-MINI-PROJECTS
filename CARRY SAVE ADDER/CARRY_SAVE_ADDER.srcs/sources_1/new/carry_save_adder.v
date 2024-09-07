`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.09.2024 11:06:11
// Design Name: 
// Module Name: carry_save_adder
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


module carry_save_adder
(
input [3:0] A,B,C,
output [4:0] sum, 
output carry
    );
    
genvar k;
generate
    wire [3:0] sum_temp, carry_temp;
    for (k=0; k<4; k=k+1)
    begin : FA
        Full_adder FA (.a(A[k]), 
                        .b(B[k]), 
                        .cin(C[k]),
                        .sum(sum_temp[k]),
                        .cout(carry_temp[k])) ;
    end
endgenerate

assign sum[0] = sum_temp[0];
wire [2:0] c;

Full_adder FA0 (.a(carry_temp[0]),
                .b(sum_temp[1]),
                .cin(1'b0),
                .sum(sum[1]),
                .cout(c[0]));
                
            Full_adder FA1 
               (.a(carry_temp[1]),
                .b(sum_temp[2]),
                .cin(c[0]),
                .sum(sum[2]),
                .cout(c[1]));

            Full_adder FA2 
               (.a(carry_temp[2]),
                .b(sum_temp[3]),
                .cin(c[1]),
                .sum(sum[3]),
                .cout(c[2]));
                
            Full_adder FA3 
               (.a(carry_temp[3]),
                .b(1'b0),
                .cin(c[2]),
                .sum(sum[4]),
                .cout(carry));
                
                
endmodule
