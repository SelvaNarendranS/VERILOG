// Gate level implementation

module mux4(
input [3:0]a,
input [1:0]select_line,
output b);

wire and1, and2, and3, and4, snot1, snot0;

	not(not1, select_line[1]);
	not(not0, select_line[0]);
	and(and4, snot1, snot0, a[3]);
	and(and3, snot1, select_line[0], a[2]);
	and(and2, select_line[1], snot0, a[1]);
	and(and1, select_line[1], select_line[0], a[0]);
	
	// final output
	or(b, and1, and2, and3, and4);

endmodule