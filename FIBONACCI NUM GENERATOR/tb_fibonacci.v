module tb_fibonacci;
    reg clk, reset, start;
    reg [3:0] n;
    wire [31:0] fib;
    wire done;

    fibonacci uut (
        .clk(clk),
        .reset(reset),
        .start(start),
        .n(n),
        .fib(fib),
        .done(done)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test cases
    initial begin
        reset = 1; start = 0; n = 4'd5; // Test for F(5)
        #10 reset = 0; start = 1;
        @(posedge done);
        $display("F(5) = %d", fib);
        #10 start = 0; n = 4'd7; // Test for F(7)
        #10 start = 1;
        @(posedge done);
        $display("F(5) = %d", fib);
        #10 $stop;
    end
endmodule
