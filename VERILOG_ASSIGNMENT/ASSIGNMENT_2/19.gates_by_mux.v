// 19. Implementing various gates using multiplexer. Implement AND, OR, NAND, NOR, XOR, XNOR using multiplexer

module gates_by_mux;
	reg a, b;
	wire out_and, out_or, out_nand, out_nor, out_xor, out_xnor;

	assign out_and   = a ? b : 0;
	assign out_or    = a ? 1 : b;
	assign out_nand  = a ? ~b : 1;
	assign out_nor   = a ? 0 : ~b;
	assign out_xor   = a ? ~b : b;
	assign out_xnor  = a ? b : ~b;  

	initial begin
		$monitor("Time = %0t | a = %b | b = %b  \n out_and = %b \n out_or = %b \n out_nand = %b \n out_nor = %b \n out_xor = %b \n out_xnor = %b", $time, a, b, out_and, out_or, out_nand, out_nor, out_xor, out_xnor);

	// Test case
	a = 0; b = 0; #2;
	a = 0; b = 1; #2;
	a = 1; b = 0; #2;
	a = 1; b = 1; #2;

	$finish;
	end
endmodule
