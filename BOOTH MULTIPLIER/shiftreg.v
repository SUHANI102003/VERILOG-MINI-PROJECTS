`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2025 22:39:40
// Design Name: 
// Module Name: shiftreg
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


module shiftreg(
input clk, s_in, clr,sft,ld,
input [15:0] data_in,
output reg [15:0] data_out 
    );
    
    always@(posedge clk) begin
    if(clr) data_out <= 0;
    else if (ld) data_out <= data_in;
    else if (sft) 
        data_out <= {s_in,data_out[15:1]};
    
    end
endmodule
