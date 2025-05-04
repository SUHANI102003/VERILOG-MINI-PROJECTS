`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2025 18:12:14
// Design Name: 
// Module Name: tb
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


module tb();
 reg [15:0] data_in;
    reg clk, start;
    wire done;
    
    reg [15:0] A, B;
    
    GCD_datapath DP (lt, gt, eq, ldA, ldB, sel1, sel2, sel_in, data_in, clk);
    GCD_controlpath CON (ldA, ldB, sel1, sel2, sel_in, done, clk, lt, gt, eq, start);
    
    initial begin
        clk= 1'b0;
        #3 start = 1'b1;
        #1000 $finish;
    end
    
    always #5 clk = ~clk;
    
    initial begin
        #12 data_in = 143;
        #10 data_in = 78;
    end
    
    initial begin
        $monitor ($time, "%d %b", DP.Bout, done);
    end
    
endmodule
