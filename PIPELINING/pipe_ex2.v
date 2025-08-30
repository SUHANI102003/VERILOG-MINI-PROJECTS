`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.04.2025 22:18:50
// Design Name: 
// Module Name: pipe_ex2
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


module pipe_ex2(
input [3:0] rs1, rs2, rd, func,
input clk1, clk2,
input [8:0] addr,
output [15:0] Zout
    );
reg [15:0] L12_A, L12_B, L23_Z, L34_Z;
reg [3:0] L12_rd, L12_func, L23_rd;
reg [7:0] L12_addr, L23_addr, L34_addr;

// declare register bank
reg [15:0] regbank [0:15];
// declare memory
reg [15:0] mem [0:255];

assign Zout = L34_Z;

// STAGE 1
always @ (posedge clk1) 
begin
    L12_A <= #2 regbank[rs1];
    L12_B <= #2 regbank[rs2];
    L12_rd <= #2 rd;
    L12_func <= #2 func;
    L12_addr <= #2 addr;
end

// STAGE 2
always@(negedge clk2)
begin
    case(L12_func)
        0 : L23_Z <= #2 L12_A + L12_B;
        1 : L23_Z <= #2 L12_A - L12_B;
        2 : L23_Z <= #2 L12_A * L12_B;
        3 : L23_Z <= #2 L12_A;
        4 : L23_Z <= #2 L12_B;
        5 : L23_Z <= #2 L12_A & L12_B;
        6 : L23_Z <= #2 L12_A | L12_B;
        7 : L23_Z <= #2 L12_A ^ L12_B;
        8 : L23_Z <= #2 ~L12_A;
        9 : L23_Z <= #2 ~L12_B;
        10 : L23_Z <= #2 L12_A >>1;
        11 : L23_Z <= #2 L12_A <<1;
        default : L23_Z <= #2 16'hxxxx;
    endcase
    L23_rd <= #2 L12_rd;
    L23_addr <= #2 L12_addr;
end

// STAGE 3
always@(posedge clk1)
begin
    regbank[L23_rd] <= #2 L23_Z;
    L34_addr <= #2 L23_addr;
    L34_Z <= #2 L23_Z;
end

// STAGE 4
always@(negedge clk2)
begin
    mem[L34_addr] <= #2 L34_Z;
end
endmodule
