// Create a race condition intentionally using blocking statements—analyze results.

module race_condition_analyze;
    	reg clk, a, b;

	// clock generation
	initial clk = 0;
	always #5 clk = ~clk;

    	always @(posedge clk) begin
        	a = b;     
        	b = a;     // Race condition occurs
	end

	initial begin
		$monitor("Time = %0t | clk = %d | a = %d | b = %d", $time, clk, a, b);

		a = 0; #2;
		a = 1; #2;

	#13 $finish;
	end
endmodule
