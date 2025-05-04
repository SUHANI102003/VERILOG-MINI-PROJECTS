`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2025 17:21:33
// Design Name: 
// Module Name: pipo2
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



module pipo2(dout,din,ld,clr,clk);
input [15:0] din;
input ld,clr,clk;
output reg [15:0] dout;
always @(posedge clk) begin
if(clr) dout<=16'b0000_0000_0000_0000;
else if(ld) dout<=din;  
end
    
endmodule
