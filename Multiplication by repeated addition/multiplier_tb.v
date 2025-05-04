`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.09.2024 22:36:52
// Design Name: 
// Module Name: multiplier_tb
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


module multiplier_tb();
reg [15:0] data_in;
reg clk, start;
wire done;

MUL_datapath DP (ldA, ldB, ldP, clrP, decB, clk,data_in,eqZ);
MUL_control_path CP (start, clk, eqZ, ldA, ldP, ldB, clrP, decB, done);

initial begin 
 clk=1'b0;
 #3 start=1'b1;
 #500 $finish;
 end

always #5 clk=~clk;

initial begin 
#17 data_in=17;
#10 data_in=5;
end

initial begin
$monitor ($time," %d %b",DP.Y,done);
end
endmodule 

