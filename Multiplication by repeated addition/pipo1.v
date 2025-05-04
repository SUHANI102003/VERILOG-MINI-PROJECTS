`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2025 17:19:13
// Design Name: 
// Module Name: pipo1
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



module pipo1(dout,din,ld,clk);
input [15:0] din;
input ld,clk;
output reg [15:0] dout;
always @(posedge clk) begin
    if (ld) 
	  dout<=din; 
end
endmodule
