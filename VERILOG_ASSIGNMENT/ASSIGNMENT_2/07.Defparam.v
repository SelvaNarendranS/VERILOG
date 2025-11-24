// 7. What is the bug in the following snippet?
/*
module test;
	parameter WIDTH=8;

endmodule

module top;
	test OUT ( ) ;
	initial
		defparam OUT.WIDTH=10;
endmodule   */

// ANS:

module test;
	parameter WIDTH=8;

endmodule

module top;
	defparam OUT.WIDTH = 10;  // it must be used outside the procedural block
	test OUT ( ) ;
	// initial	defparam OUT.WIDTH=10; ---- Invalid use of defparam inside an initial block.
	initial $display("Width = %0d", OUT.WIDTH);
endmodule
