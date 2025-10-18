// binary_to_7segment Testbench

`timescale 1ns/1ps

module binary_to_7segment_tb;
wire [7:0]b;
reg [3:0]a;
integer i;

	// instantation 
	binary_to_7segment ct7s(.a(a), .b(b));

	initial begin
	
	$monitor("Time = %0t | a = %b |  b = %b (%h) ", $time, a, b, b);
	$dumpfile("binary_to_7segment_dump.vcd");
	$dumpvars;

		// conditions
		for(i = 0; i < 2**4; i++) begin
		a = i;
		#5;
		end

	$finish;
	end

endmodule
