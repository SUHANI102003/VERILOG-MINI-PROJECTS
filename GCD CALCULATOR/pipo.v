`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2025 17:55:21
// Design Name: 
// Module Name: pipo
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


module pipo(data_out, data_in, load, clk);
    input[15:0] data_in;
    input load, clk;
    output reg [15:0] data_out;
    
    always @ (posedge clk)
        if (load) data_out <= data_in;

    
endmodule
