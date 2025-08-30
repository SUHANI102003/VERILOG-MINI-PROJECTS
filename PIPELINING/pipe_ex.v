`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.04.2025 18:55:40
// Design Name: 
// Module Name: pipe_ex
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


module pipe_ex
# (parameter N =10)
(
input clk,
input [N-1:0] A,B,C,D,
output [N-1:0] F
  );
reg [N-1:0] L12_x1, L12_x2, L12_D, L23_x3, L23_D, L34_F;

assign F = L34_F;
/*
//   ** STAGE 1 **
always@(posedge clk)
    begin
    //   ** STAGE 1 **
        L12_x1 <= #4 A+B; 
        L12_x2 <= #4 C-D; 
        L12_D <= D;
        
    //   ** STAGE 2 ** 
        L23_x3 <=  #4 L12_x1 + L12_x2;
        L23_D <= L12_D;
        
    //   ** STAGE 3 ** 
        L34_F <= #6 L23_x3 * L23_D;
    end
    */


// here we used 1 always block in all stages
// we can also use separate always block like :

always@(posedge clk)
    begin
    //   ** STAGE 1 **
        L12_x1 <= #4 A+B; 
        L12_x2 <= #4 C-D; 
        L12_D <= D;
    end
    
always@(posedge clk)
    begin
    //   ** STAGE 2 **
     L23_x3 <=  #4 L12_x1 + L12_x2;
        L23_D <= L12_D;
        end
        
 always@(posedge clk)
    begin
    //   ** STAGE 3 **  
    L34_F <= #6 L23_x3 * L23_D;
    end
    
    // this code becomes more readable      
endmodule
