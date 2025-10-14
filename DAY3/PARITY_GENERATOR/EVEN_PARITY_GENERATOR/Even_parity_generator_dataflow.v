// dataflow model

module even_parity_generator (
input [3:0]a,
output b,
output [4:0]generated);

	// using reduction operator
	assign b = ^a;
	assign generated = {b,a};

endmodule
