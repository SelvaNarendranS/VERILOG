// Gate level implementation

module full_subractor( input a, b, c, output difference, borrow);

// Internal wires
wire nd1,nd2,nota;
		
	xor(difference, a, b, c); // difference = a ^ b ^ c; 
	
	// carry split ups with internal wire
	
	not(nota,a);
	and(nd1, nota, b);   
	xnor(nd2, a, b);
	and(nd3, c, nd2);
	or(borrow, nd1, nd3);	

endmodule 

/*
// Dataflow model

module full_subractor( input a, b, c, output difference, borrow);

	assign difference = a ^ b ^ c;
	assign borrow = (c &( ~(a ^ b)) | (~a & b));

endmodule
*/
