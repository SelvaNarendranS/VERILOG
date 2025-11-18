// Write a forever loop to generate a square wave on a signal.

module square_wave_gen;
	reg clk; 

	// initial block
	initial begin
		clk = 1'b0;
		forever #5 clk = ~clk;
	end	

	initial begin
		$monitor("Time = %0t | clk = %b", $time, clk);

		#23 $finish;
	end
endmodule
