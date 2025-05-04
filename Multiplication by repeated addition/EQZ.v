`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 18:14:41
// Design Name: 
// Module Name: PIPO_4bit_reg_with_load
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


module EQZ (
input [15:0] data,
output eqZ
);

assign eqZ = (data==0);  // or ~|data
endmodule