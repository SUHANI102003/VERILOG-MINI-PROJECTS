`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.09.2024 21:35:36
// Design Name: 
// Module Name: shift_add_multiplier
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

//-------INFO---------
// Multiplication performed using Shift/Add method
//The product result is converted to BCD representation
// conversion done using DOUBLE DABBLE METHOD of converting
// binary to bcd
//------------------------------------

module shift_add_multiplier
#(parameter N = 4)(
input clk,reset_n,start,
input [N-1:0] a_in, b_in,      // inputs a and b
output finish,                // multiplication finished
output [(2*N)-1:0] out,      // product
output [(((2*N)/3)*4+1)-1:0] bcd
    );
    
// temporary registers
reg finish_reg = 0;
reg [(2*N)-1:0] a_in_reg, b_in_reg, out_reg;  // out_reg = accumulator
reg [(((2*N)/3)*4+1)-1:0] bcd_reg;
reg [N:0] n;
integer i;
// reset and clock
always @(negedge reset_n)
begin
        out_reg = 0;
        a_in_reg =0;
        b_in_reg =0;  
end

// assignments
assign out = out_reg;
assign finish = finish_reg;
assign bcd = bcd_reg;

// load input values
always@(*)
begin
    if(!reset_n)
        begin
            case(start)
                1'b0: begin
                            a_in_reg = a_in;
                            b_in_reg = b_in;
                            n = N;
                            finish_reg = 0;
                            out_reg = 0;
                            bcd_reg =0;
                            $display("Values loaded into the input register");
                        end
                
                1'b1: begin
                         if(b_in_reg[0]==1)
                            begin
                                out_reg = a_in_reg + out_reg;
                            end
                            n = n-1;
                            a_in_reg = a_in_reg << 1;
                            b_in_reg = b_in_reg >>1;
                      end
            endcase
        end

end
endmodule
