// Dataflow level modelling

// module half adder

module half_adder(input a, b, output sum, carry);

	assign sum = a ^ b;
	assign carry = a & b;

endmodule

// combining 2 half adder + 1 or gate to make Full adder 

module hierarchy_full_adder(input a, b, c, output sum, carry);

wire sum1, carry1, carry2; // internal wires b/w 2 HF-adders

	// Instantiate two half adders
	
	half_adder hf1( .a(a), .b(b), .sum(sum1), .carry(carry1));

	half_adder hf2( .a(sum1), .b(c), .sum(sum), .carry(carry2));

	// final carry out

	assign carry = carry1 | carry2;

endmodule 
