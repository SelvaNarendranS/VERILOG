// Dataflow level modelling

// module half subtractor

module half_subtractor(input a, b, output difference, borrow);

	assign difference = a ^ b;
	assign borrow = ~a & b;

endmodule

// combining 2 half subtractor + 1 or gate to make Full adder 

module hierarchy_full_subtractor(input a, b, c, output difference, borrow);

wire difference1, borrow1, borrow2; // internal wires b/w 2 HF-subtractor's

	// Instantiate two half subtractors
	
	half_subtractor hf1( .a(a), .b(b), .difference(difference1), .borrow(borrow1));

	half_subtractor hf2( .a(difference1), .b(c), .difference(difference), .borrow(borrow2));

	// final borrow out

	assign borrow = borrow1 | borrow2;

endmodule 
