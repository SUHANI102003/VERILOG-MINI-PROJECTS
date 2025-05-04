`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2025 17:58:16
// Design Name: 
// Module Name: COMP
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


module COMP(lt, gt, eq, data1, data2);
    input [15:0] data1, data2;
    output lt, gt, eq;
    
    assign lt = data1 < data2;
    assign gt = data1 > data2;
    assign eq = data1 == data2;

    
endmodule
