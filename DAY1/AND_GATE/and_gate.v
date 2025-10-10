// Gate level implementation

module and_gate(
input a,b,
output c
);

	// assign c = a & b
	and (c, a, b);
endmodule

