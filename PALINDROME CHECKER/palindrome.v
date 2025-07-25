module palindrome (
  input [7:0] data_in,
  output wire isPalindrome
);

  // ex. 1001  when reverse = 1001 ==> isPalindrome = 1
  wire [7:0] data_reversed;
  
  assign data_reversed = {data_in[0], data_in[1], data_in[2], data_in[3], data_in[4], data_in[5], data_in[6], data_in[7]};

  assign isPalindrome = (data_in == data_reversed);

endmodule
