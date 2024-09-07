`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.09.2024 17:14:08
// Design Name: 
// Module Name: array_multiplier_tb
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


module array_multiplier_tb();
reg [3:0] m,q;
wire [7:0] product;

array_multiplier DUT (.m(m), .q(q), .product(product));

initial
#300 $finish;

initial
begin
          m = 4'b1110; q = 4'b1010;
    #150  m = 4'b1011; q = 4'b1101;
    
end
endmodule
