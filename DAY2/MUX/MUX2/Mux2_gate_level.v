// Gate level implementation

module mux2(
input [1:0]a,
input select_line,
output b);

wire and1, and2, not1;

	not(not1, select_line);
	and(and1, not1, a[1]);
	and(and2, select_line, a[0]);
	
	// final output
	or(b, and1, and2);

endmodule