// Dataflow level Modelling

module mux4(
input [3:0]a,
input [1:0]select_line, 
output b);

	// conditional statement for 3 statements

	assign b = select_line[1] ? (select_line[0] ? a[0] : a[1]) : (select_line[0] ? a[2] : a[3]);

endmodule


/*  other methods

wire s0,s1,s2,s3;
	 // assigning selection line combinations

	assign s0 = ~select_line[1] & ~select_line[0];
	assign s1 = ~select_line[1] &  select_line[0];
	assign s2 = select_line[1] & ~select_line[0];
	assign s3 = select_line[1] & select_line[0];

	assign b = (s0 & a[3]) | (s1 & a[2]) | (s2 & a[1]) | (s3 & a[0]); // Boolean expression

	// OR by conditional operator (nested)
 
	 assign b = select_line == 2'b00 ? a[3] :
		      select_line == 2'b01 ? a[2] :      
		      select_line == 2'b10 ? a[1] : a[0];
							*/
