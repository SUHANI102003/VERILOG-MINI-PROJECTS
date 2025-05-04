`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.09.2024 22:05:41
// Design Name: 
// Module Name: counter
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


module counter(
input [15:0] data,
input clk, ld, dec,
output reg [15:0] bout
    );
    
always@(posedge clk)
begin
    if(ld)
        bout <= data;
    else if(dec)
        bout <= bout - 1;
end
endmodule
