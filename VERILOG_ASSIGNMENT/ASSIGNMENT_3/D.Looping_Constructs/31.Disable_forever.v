// Write a module using forever loop and disable it after a time limit.

module Disable_forever;
	reg clk; 

	// initial block
	initial begin : CLOCK_BLOCK
		clk = 1'b0;
		forever #5 clk = ~clk;
	end	

	initial begin
		#50 disable CLOCK_BLOCK;
		$display("Time = %0t | clk = %b", $time, clk);
	end
endmodule
