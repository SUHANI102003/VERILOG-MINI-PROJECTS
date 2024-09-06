`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.09.2024 20:26:03
// Design Name: 
// Module Name: carry_skip_adder_tb
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


module carry_skip_adder_tb();
reg [3:0] a,b;
reg cin;
wire [3:0] sum;
wire cout_final;

carry_skip_adder DUT (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout_final(cout_final));
    
initial
#200 $finish;

initial
begin
          a = 4'b0000; b= 4'b1010; cin = 1'b0;
    #50   a = 4'b0100; b= 4'b0011; cin = 1'b1;
    #50   a = 4'b1100; b= 4'b1100; cin = 1'b1;
    #50   a = 4'b0101; b= 4'b1010; cin = 1'b0;
    #50   a = 4'b0110; b= 4'b0100; cin = 1'b1;
end
endmodule
