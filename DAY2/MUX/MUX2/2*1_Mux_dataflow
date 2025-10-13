// Dataflow level Modelling

module mux2(
input [1:0]a,
input select_line, 
output b);

	assign b = (~select_line & a[0]) | (select_line & a[1]); // Boolean expression 
	// assign b = select_line ? a[1] : a[0]; // By conditional operator 

endmodule


