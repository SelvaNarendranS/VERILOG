// dataflow model

module even_parity_checker (
input [4:0]a,
output b);

	// using reduction operator
	assign b = ^a;

endmodule