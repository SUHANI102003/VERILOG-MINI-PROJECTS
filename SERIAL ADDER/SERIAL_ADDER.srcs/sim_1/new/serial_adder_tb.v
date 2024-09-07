`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.09.2024 16:49:17
// Design Name: 
// Module Name: serial_adder_tb
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


module serial_adder_tb();
reg clk, reset_n;
reg a,b;
wire sum;

serial_adder DUT 
                 (.clk(clk),
                  .sum(sum),
                  .a(a),
                  .b(b),
                  .reset_n(reset_n));
                  
// Generating clk signal     
localparam T = 10;           
always        
begin                        
    clk = 1'b1;              
    #(T/2);                  
    clk = 1'b0;              
    #(T/2);                  
end                          
                             
// Generate stimili   
initial
begin
                                                 
        reset_n = 1'b0;          
        #2;   
        reset_n = 1'b1;   
        
            a = 1'b0; b = 1'b0;
    #(2*T)  a = 1'b0; b = 1'b1;
    #(2*T)  a = 1'b1; b = 1'b0;
    #(2*T)  a = 1'b1; b = 1'b1;
    #(2*T)  a = 1'b1; b = 1'b1;
    #(2*T)  a = 1'b1; b = 1'b0;
    #(2*T)  a = 1'b0; b = 1'b1;
    #(2*T)  a = 1'b0; b = 1'b0;
end

initial
#200 $finish;
endmodule
