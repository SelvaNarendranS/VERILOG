// Gate level modelling
// module half adder

module half_adder(input a, b, output sum, carry);

	xor(sum, a, b);
	and(carry, a, b);

endmodule

// combining 2 half adder + 1 or gate to make Full adder 
module hierarchy_full_adder(input a, b, c, output sum, carry);
wire sum1, carry1, carry2; // internal wires b/w 2 HF-adders

	// Instantiate two half adders
	half_adder hf1( .a(a), .b(b), .sum(sum1), .carry(carry1));
	half_adder hf2( .a(sum1), .b(c), .sum(sum), .carry(carry2));

	// final carry out
	or(carry, carry1, carry2);

endmodule 

// Hierarchy Full adder testbench

`timescale 1ns/1ps
module hierarchy_full_adder_tb;
wire sum, carry;
reg a, b, c;

	//instantiation
	hierarchy_full_adder uub(
	.sum(sum),
        .carry(carry),
	.a(a), 
	.b(b),
	.c(c));

	initial begin 
	
	$monitor("Time = %0t | a = %b | b = %b | c = %b | sum = %b | carry = %b", $time, a, b, c, sum, carry);
	$dumpfile("Hierarchy_full_adder_dump.vcd");
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

