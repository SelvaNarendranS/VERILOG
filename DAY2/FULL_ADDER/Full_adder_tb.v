// Full adder testbench

`timescale 1ns/1ps

module full_adder_tb;
wire sum, carry;
reg a, b, c;

	//instantiation
	full_adder uub(
	.sum(sum),
        .carry(carry),
	.a(a), 
	.b(b),
	.c(c));

	initial begin 
	
	$monitor("Time = %0t | a = %b | b = %b | c = %b | sum = %b | carry = %b", $time, a, b, c, sum, carry);
	$dumpfile("full_adder_dump.vcd");
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


