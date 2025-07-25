module tb;
  reg [7:0] data_in;
  wire isPalindrome;
  
  palindrome dut (data_in, isPalindrome);
  
  initial begin
    data_in = 8'b1000_0001;
    #10;
    data_in = 8'b1001_1110;
    #10;
  end
  
  initial
    $monitor ($time, "data_in = %b, ispPalindrome = %b", data_in, isPalindrome);
  
endmodule
