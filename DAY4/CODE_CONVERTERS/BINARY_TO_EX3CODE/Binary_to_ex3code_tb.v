// Test bench - 4 bit

`timescale 1ns/1ps

module binary_to_ex3code_tb;
reg  [3:0] a;
wire [3:0] b;
integer i;

	// Instantiate DUT
	binary_to_ex3code btex3 (.a(a), .b(b));

	initial begin

   	$monitor("Time=%0t | a=%b | b=%b", $time, a, b);
    	$dumpfile("binary_to_ex3code_dump.vcd");
    	$dumpvars(0, binary_to_ex3code_tb);

    		// Apply test patterns

   	     /* a = 4'b0000; #5 
		a = 4'b0001; #5
   	 	a = 4'b0010; #5 
		a = 4'b0011; #5
   	 	a = 4'b1100; #5 
		a = 4'b0101; #5
   	 	a = 4'b1010; #5 
		a = 4'b1111; #5  */

		for(i = 0; i < 2**4; i++) begin
		a = i;
		#5;
		end

    	$finish;
	end

endmodule
