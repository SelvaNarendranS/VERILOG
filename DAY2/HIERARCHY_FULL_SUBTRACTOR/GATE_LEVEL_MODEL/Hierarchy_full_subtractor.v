// Gate level modelling

// module half subtractor

module half_subtractor(input a, b, output difference, borrow);
wire not_a;

	xor(difference, a, b);
	not(not_a,a);
	and(borrow, not_a, b);

endmodule

// combining 2 half subtractor + 1 or gate to make Full subtractor 

module hierarchy_full_subtractor(input a, b, c, output difference, borrow);

wire difference1, borrow1, borrow2, not_diff1, and1; // internal wires b/w 2 HF-subtractors

	// Instantiate two half subtractors
	
	half_subtractor hf1( .a(a), .b(b), .difference(difference1), .borrow(borrow1));

	half_subtractor hf2( .a(difference1), .b(c), .difference(difference), .borrow(borrow2));

	// final borrow out

	not(not_diff1,difference1);
	and(and1, borrow2,not_diff1);
	or(borrow, borrow1, and1);

endmodule 
