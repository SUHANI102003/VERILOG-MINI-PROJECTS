`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.03.2025 10:19:47
// Design Name: 
// Module Name: controlpath
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


module controlpath(
input clk,q0,qm1,start,eqz,
output reg ldA,clrA,sftA,ldQ,clrQ,sftQ,clrff,decr,ldM,addsub,ldcnt,done
    );
reg [2:0] state;
parameter s0=3'b000, s1=3'b001, s2=3'b010, s3=3'b011, s4=3'b100,
            s5=3'b101, s6=3'b110;
            
always@(posedge clk) begin
    case(state)
    s0 : if(start) state<=s1;
    s1 : state<=s2;
    s2 : #2 if({q0,qm1}==2'b01) state<=s3;
            else if ({q0,qm1}==2'b10) state<=s4;
            else state<=s5;
    s3 : state<=s5;
    s4 : state<=s5;
    s5 : #2 if(({q0,qm1}==2'b01) && !eqz) state<=s3;
            else if (({q0,qm1}==2'b10) && !eqz) state<=s4;
            else if (eqz) state<=s6;
    s6 : state<=s6;
    default : state<=s0;
    endcase
end

always@(state) begin
case(state)
    s0 : begin
            clrA=0; ldA=0; sftA=0; ldQ=0; clrQ=0; sftQ=0;
            clrff=0; done=0; ldM=0;
        end
    s1 : begin
            clrA=1; clrff=1; ldcnt=1; ldM=1;
        end
    s2 : begin
            ldQ=1; clrA=0; clrff=0; ldcnt=0; ldM=0;
        end
    s3 : begin
            ldA=1; addsub=1; ldQ=0; sftA=0; sftQ=0; decr=0;
         end
    s4 :  begin
            ldA=1; addsub=0; ldQ=0; sftA=0; sftQ=0; decr=0;
         end
    s5 : begin
            ldA=0; ldQ=0; sftA=1; sftQ=1; decr=1;
         end
    s6 : done=1;
    default : begin 
                clrA=0; sftA=0; ldQ=0; sftQ=0;
                end
endcase
end
endmodule
