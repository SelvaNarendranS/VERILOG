// Test bench - 4 bit

`timescale 1ns/1ps

module gray_to_binary_tb;
reg  [3:0] a;
wire [3:0] b;

	// Instantiate DUT
	gray_to_binary gtb(.a(a), .b(b));

	initial begin

   	$monitor("Time=%0t | a=%b | b=%b", $time, a, b);
    	$dumpfile("gray_to_binary_dump.vcd");
    	$dumpvars;

    		// Apply test patterns

   	 	a = 4'b0000; #5 
		a = 4'b0001; #5
   	 	a = 4'b0010; #5 
		a = 4'b0011; #5
   	 	a = 4'b1100; #5 
		a = 4'b0101; #5
   	 	a = 4'b1010; #5 
		a = 4'b1111; #5

    	$finish;
	end

endmodule
