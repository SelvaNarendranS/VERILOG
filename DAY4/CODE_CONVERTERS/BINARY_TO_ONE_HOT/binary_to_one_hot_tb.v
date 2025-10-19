// binary_to_one_hot Testbench

`timescale 1ns/1ps

module binary_to_one_hot_tb;
wire [7:0]b;
reg [2:0]a;
integer i;

	// instantation 
	binary_to_one_hot btoh(.a(a), .b(b));

	initial begin
	
	$monitor("Time = %0t | a = %b |  b = %b (%h) ", $time, a, b, b);
	$dumpfile("binary_to_one_hot_dump.vcd");
	$dumpvars;

		// conditions
		for(i = 0; i < 2**4; i++) begin
		a = i;
		#5;
		end

	$finish;
	end

endmodule
