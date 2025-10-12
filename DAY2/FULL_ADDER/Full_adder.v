// Gate level implementation
 
module full_adder( input a, b, c, output sum, carry);

// Internal wires
wire nd1,nd2;
		
	xor(sum, a, b, c); // sum = a ^ b ^ c; 
	
	// carry split ups with internal wire
	
	and(nd1, a, b);   
	xor(nd2, a, b);
	and(nd3, c, nd2);
	or(carry, nd1, nd3);	

endmodule 

/*
// Dataflow model

module full_adder( input a, b, c, output sum, carry);

	assign sum = a ^ b ^ c;
	assign carry = (c & (a ^ b) | (a & b));

endmodule
*/
