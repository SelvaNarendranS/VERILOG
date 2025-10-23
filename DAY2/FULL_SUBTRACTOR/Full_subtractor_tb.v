// Full subtractor testbench

`timescale 1ns/1ps

module full_subtractor_tb;
wire difference, borrow;
reg a, b, c;

	//instantiation
	full_subtractor uub(
	.difference(difference),
        .borrow(borrow),
	.a(a), 
	.b(b),
	.c(c));

	initial begin 
	
	$monitor("Time = %0t | a = %b | b = %b | c = %b | difference = %b | borrow = %b", $time, a, b, c, difference, borrow);
	$dumpfile("full_subtractor_dump.vcd");
	$dumpvars;
	
	// combinations
	a = 0; b = 0; c = 0; #5
	a = 0; b = 0; c = 1; #5
	a = 0; b = 1; c = 0; #5
	a = 0; b = 1; c = 1; #5
	a = 1; b = 0; c = 0; #5
	a = 1; b = 0; c = 1; #5
	a = 1; b = 1; c = 0; #5
	a = 1; b = 1; c = 1; #5

	$finish; 
	end

endmodule
