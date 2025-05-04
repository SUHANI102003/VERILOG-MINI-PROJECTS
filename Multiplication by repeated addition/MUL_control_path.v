`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.09.2024 22:11:20
// Design Name: 
// Module Name: MUL_control_path
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


module MUL_control_path(start, clk,eqZ,ldA, ldP, ldB, clrP, decB,done);
input start, clk,eqZ;
output reg ldA, ldP, ldB, clrP, decB,done;
    
    
parameter s0 = 3'b000, s1 = 3'b001, s2=3'b010, s3=3'b011, s4=3'b100;
reg [2:0] state_reg;

// reg logic
always@(posedge clk)
begin
    case(state_reg)
        s0 : if(start) state_reg <= s1;               
        s1 : state_reg <= s2;
        s2 : state_reg <= s3;
        s3 :#2 if(eqZ) state_reg <= s4; 
        s4 : state_reg <= s4;
         default : state_reg <= s0;
    endcase
end

// output logic algo
always@(state_reg)
begin
    case(state_reg)
        s0 : begin
               #1 ldA = 0; ldP = 0; ldB = 0; decB = 0; clrP = 0;
             end
        s1 : begin
                #1 ldA = 1;
            end
        s2 : begin
                 #1 ldB = 1; ldA = 0; clrP = 1;
             end
        s3 : begin
                #1 ldB = 0; decB =1; clrP =0; ldP = 1;
             end
        s4 : begin
                #1 ldB = 0; decB =0; clrP =1; ldP = 0; done =1;
             end
        default :  begin 
                      #1 ldA = 0; ldP = 0; ldB = 0; decB = 0; clrP = 0;
                    end
    endcase
end
endmodule
