`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.09.2024 21:49:28
// Design Name: 
// Module Name: PIPO_without_reset
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


module PIPO_without_reset
#(parameter N = 16)(
input [N-1:0] I,
input clk,
input load,
output [N-1:0] Q
    );
    
reg [N-1:0] Q_reg, Q_next;

// sequential logic
always @(posedge clk)
begin
   Q_reg <= Q_next; 
end

// combinational logic 'or' next state logic
always @(*)
begin
    if (load)
        Q_next = I;
    else
        Q_next = Q_reg;
end

// output logic
assign Q = Q_reg;

   
endmodule
