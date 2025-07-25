module fibonacci (
    input clk,             // Clock signal
    input reset,           // Reset signal
    input start,           // Start signal
    input [3:0] n,         // Fibonacci index (input)
    output reg [31:0] fib, // Fibonacci result (output)
    output reg done        // Done signal
);
    reg [31:0] fib1, fib2; // Registers for Fibonacci computation
    reg [3:0] count;       // Counter for iterations

    always @(posedge clk or posedge reset) begin
        if (reset) 
        begin
            fib <= 32'd0;
            fib1 <= 32'd0; // F(0) = 0
            fib2 <= 32'd1; // F(1) = 1
            count <= 4'd0;
            done <= 1'b0;
        end
        else if (!start)
            begin
              done <= 0;
            end
         else if (start && !done) begin
            if (n == 0) begin
                fib <= 32'd0; // Base case F(0)
                done <= 1'b1;
            end else if (n == 1) begin
                fib <= 32'd1; // Base case F(1)
                done <= 1'b1;
            end else if (count < n - 1) begin
                fib <= fib1 + fib2; // Compute next Fibonacci number
                fib1 <= fib2;       // Update F(n-2)
                fib2 <= fib1 + fib2; // Update F(n-1)
                count <= count + 1; // Increment count
            end else begin
                done <= 1'b1;       // Signal completion
            end
        end
    end
endmodule
