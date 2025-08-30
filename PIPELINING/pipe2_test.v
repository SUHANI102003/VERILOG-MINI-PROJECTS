`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.05.2025 09:55:30
// Design Name: 
// Module Name: pipe2_test
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


module pipe2_test();
reg [3:0] rs1, rs2, rd, func;
reg clk1, clk2;
reg [8:0] addr;
wire [15:0] Zout;
integer k;

pipe_ex2 MYPIPE (rs1, rs2, rd, func, clk1, clk2, addr, Zout);

// generating 2 phase clock     
initial begin
    clk1 = 0; clk2 = 0;
    repeat(20)
    begin
        #5 clk1 = 1; #5 clk1 =0;
        #5 clk2 = 1; #5 clk2 =0;
    end
end

initial 
    for (k=0; k<16; k=k+1)
        MYPIPE.regbank[k] = k; // initialize registers
      
initial begin
    #5    rs1 = 3; rs2 = 5; rd = 10; func = 0; addr = 125;
    #20   rs1 = 3; rs2 = 8; rd = 12; func = 2; addr = 126;
    #20   rs1 = 10; rs2 = 5; rd = 14; func = 1; addr = 128;
    #20   rs1 = 7; rs2 = 3; rd = 13; func = 11; addr = 127;
    #20   rs1 = 10; rs2 = 5; rd = 15; func = 1; addr = 129;
    #20   rs1 = 12; rs2 = 13; rd = 16; func = 0; addr = 130;
    
    #60 for (k=125; k<131; k=k+1)
        $display ("Mem[%3d] = %3d", k, MYPIPE.mem[k]);
end

initial begin 
    $monitor("Time: %3d, Z = %3d", $time, Zout);
    #300 $finish;
end
endmodule
