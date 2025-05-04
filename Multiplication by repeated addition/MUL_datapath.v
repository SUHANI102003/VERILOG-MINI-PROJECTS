`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.09.2024 21:40:28
// Design Name: 
// Module Name: MUL_datapath
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


module MUL_datapath(
input ldA, ldB, ldP, clrP, decB, clk,
input [15:0] data_in,
output eqZ
    );
wire [15:0] X ,Y ,Z, BUS, Bout;
assign data_in = BUS; // driving bus with data in

pipo1 regA (
                     .din(BUS),
                     .clk(clk),
                     .dout(X),
                     .ld(ldA)); // without clear
                     
pipo2 regP (
                              .din(BUS),
                              .clk(clk),
                              .ld(ldP),
                              .clr(clrP),
                              .dout(Y)  ); // with clear
                              
 ADD add (.in1(X), .in2(Y), .out(Z) );
 
 EQZ comp (.data(Bout), .eqZ(eqZ));
 
 counter count (.clk(clk),
                .data(BUS),
                .ld(ldB),
                .bout(Bout),
                .dec(decB));
endmodule
