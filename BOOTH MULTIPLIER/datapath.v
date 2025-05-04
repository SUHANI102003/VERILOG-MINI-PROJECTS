`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2025 22:30:56
// Design Name: 
// Module Name: datapath
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


module datapath(ldA,clrA,sftA,ldQ,clrQ,sftQ,ldM,
clrff,addsub,qm1,clk,decr,eqz,data_in,ldcnt );

input clk,ldA,clrA,sftA,ldQ,clrQ,sftQ,ldM,clrff,addsub,ldcnt,decr;
input [15:0] data_in;
output qm1,eqz;
wire [4:0] count;
wire [15:0] A,M,Q,Z;

assign eqz = ~|count; //nor

shiftreg AR (clk,A[15],clrA,sftA,ldA,Z,A);
shiftreg QR (clk,A[0],clrQ,sftQ,ldQ,data_in,Q);
dff QM1 (clk,clrff,Q[0],qm1);
pipo MR (clk,ldM,data_in,M);
alu AS (addsub,A,M,Z);
counter CN (clk,decr,ldcnt,count);
endmodule
