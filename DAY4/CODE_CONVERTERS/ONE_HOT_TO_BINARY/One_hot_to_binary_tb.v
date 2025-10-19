// one_hot_to_binary Testbench

`timescale 1ns/1ps

module one_hot_to_binary_tb;
wire [2:0]b;
reg [7:0]a;
integer i;

	// instantation 
	one_hot_to_binary ohtb(.a(a), .b(b));

	initial begin
	
	$monitor("Time = %0t | a = %b |  b = %b ", $time, a, b);
	$dumpfile("one_hot_to_binary_dump.vcd");
	$dumpvars;

		// conditions
		for(i = 0; i < 2**4; i++) begin
		a = 8'b00000001 << i;
		#5;
		end

	$finish;
	end

endmodule
