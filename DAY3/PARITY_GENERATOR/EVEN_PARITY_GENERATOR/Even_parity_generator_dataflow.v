// dataflow model

module even_parity_generator (
input [3:0]a,
output b);

	// using reduction operator
	assign b = ^a;

endmodule