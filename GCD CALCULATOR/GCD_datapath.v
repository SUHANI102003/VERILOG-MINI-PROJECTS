`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2025 17:53:05
// Design Name: 
// Module Name: GCD_datapath
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


module GCD_datapath(lt, gt, eq, ldA, ldB, sel1, sel2, sel_in, data_in, clk);
     input ldA, ldB, sel1, sel2, sel_in, clk;
     input [15:0] data_in;
     output gt, lt, eq;
     wire [15:0] Aout, Bout, X, Y,Bus, SubOut;
     
     pipo A (Aout, Bus, ldA, clk );
     pipo B (Bout, Bus, ldB, clk);
     MUX Mux_in1 (X, Aout, Bout, sel1);
     MUX Mux_in2 (Y, Aout, Bout, sel2);
     MUX Mux_load (Bus, SubOut, data_in, sel_in);
     SUB SB (SubOut, X, Y);
     COMP C (lt, gt, eq, Aout, Bout);
endmodule
