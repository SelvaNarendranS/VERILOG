// Dataflow level Modelling

module demux4(
input a,
input [1:0]select_line, 
output [3:0]b);

	// conditional statement for 3 statements

	assign b = select_line[1] ? (select_line[0] ? {a, 3'b000} : {1'b0, a, 2'b00}) :  (select_line[0] ? {2'b00, a, 1'b0} : {3'b000, a}) ; // By conditional operator

/*
wire s0,s1,s2,s3;
	 // assigning selection line combinations

	assign s0 = ~select_line[1] & ~select_line[0];
	assign s1 = ~select_line[1] &  select_line[0];
	assign s2 = select_line[1] & ~select_line[0];
	assign s3 = select_line[1] & select_line[0];

	assign b[3] = (s0 & a); // Boolean expression
	assign b[2] = (s1 & a); // Boolean expression
	assign b[1] = (s0 & a); // Boolean expression
	assign b[0] = (s1 & a); // Boolean expression
							*/ 

endmodule
