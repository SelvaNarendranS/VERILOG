// Dataflow level Modelling

// module 2*1 mux

module mux2(
input [1:0]a,
input select_line, 
output b);

	assign b = (~select_line & a[0]) | (select_line & a[1]); // Boolean expression 
	// assign b = select_line ? a[1] : a[0]; // By conditional operator 

endmodule

// combine 3 2*1 mux to get 4*1 mux
// Hierarchy 4*1 mux

module mux4(
input [3:0]a,
input [1:0]select_line,
output b;

wire mux0,mux1;

	//intantiate of two 2*1 mux

	mux2 m1(.b(mux0), .a[1](a[3]), .a[0](a[2]), .select_line(select_line[1]));

	mux2 m2(.b(mux1), .a[1](a[1]), .a[0](a[0]), .select_line(select_line[0]));

	connecting 2 muxs

	mux3 m3( .b(b), .a[1](m1), .a[0](m2));

endmodule


