// Test bench - 4 bit

`timescale 1ns/1ps

module ex3code_to_binary_tb;
reg  [3:0] a;
wire [3:0] b;
integer i;

	// Instantiate DUT
	ex3code_to_binary ex3tb (.a(a), .b(b));

	initial begin

   	$monitor("Time=%0t | a=%b | b=%b", $time, a, b);
    	$dumpfile("ex3code_to_binary_dump.vcd");
    	$dumpvars(0, ex3code_to_binary_tb);

    		// Apply test patterns

		for(i = 0; i < 2**4; i++) begin
		a = i;
		#5;
		end

    	$finish;
	end

endmodule
