// Dataflow level modelling

// module half subractor

module half_subractor(input a, b, output difference, borrow);

	assign difference = a ^ b;
	assign borrow = ~a & b;

endmodule

// combining 2 half subractor + 1 or gate to make Full adder 

module hierarchy_full_subractor(input a, b, c, output difference, borrow);

wire difference1, borrow1, borrow2; // internal wires b/w 2 HF-subractor's

	// Instantiate two half subractors
	
	half_subractor hf1( .a(a), .b(b), .difference(difference1), .borrow(borrow1));

	half_subractor hf2( .a(difference1), .b(c), .difference(difference), .borrow(borrow2));

	// final borrow out

	assign borrow = borrow1 | borrow2;

endmodule 
