`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.09.2024 16:33:43
// Design Name: 
// Module Name: serial_adder
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
// 4 bit serial adder mealy machine 

module serial_adder
(
input clk,reset_n,
input  a,b,
output sum
);

localparam s0 = 0;  //carry = 0
localparam s1 = 1;  // carry = 1
reg [1:0] state_reg,state_next;

always@(posedge clk, negedge reset_n)
begin
    if(~reset_n)
        state_reg <= 1'b0;
    else 
        state_reg <= state_next;
end

always@(*)
begin
    state_next = state_reg;
    case(state_reg)
        s0 : begin
             if ({a,b} == 2'b00)
                 state_next = s0;
             else if ({a,b} == 2'b01)
                 state_next = s0;
             else if ({a,b} == 2'b10)
                 state_next = s0;
             else 
                state_next = s1;
             end
        
        s1 : begin
                if ({a,b} == 2'b00)
                 state_next = s0;
             else if ({a,b} == 2'b01)
                 state_next = s1;
             else if ({a,b} == 2'b10)
                 state_next = s1;
             else 
                state_next = s1;
            end
    endcase
end

assign sum = (state_reg == s0 & ({a,b}==2'b10 | {a,b}==2'b01)) | 
             (state_reg == s1 & ({a,b}==2'b11 | {a,b}==2'b00));
endmodule
