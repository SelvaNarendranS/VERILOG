// Design a clock generator using initial and forever loop.

module toggle_1bit;
	reg clk; 

	// initial block
	initial begin
		clk = 1'b0;
		forever #5 clk = ~clk;
	end	

	initial begin
		$monitor("clk = %b", clk);

		#23 $finish;
	end
endmodule
