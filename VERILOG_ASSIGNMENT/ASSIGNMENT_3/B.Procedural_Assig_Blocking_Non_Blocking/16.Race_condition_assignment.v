// Write a code where incorrect usage of blocking assignment causes simulation mismatch.

module race_condition;
    	reg clk, a, b;

	// clock generation
	initial clk = 0;
	always #5 clk = ~clk;

    	always @(posedge clk) begin
        	a = b;     
        	b = a;     // Race condition occurs due to unable to set a fixed value to variable
	end

	initial begin
		$monitor("Time = %0t | clk = %d | a = %d | b = %d", $time, clk, a, b);

		a = 0; #2;
		a = 1; #2;

	#10 $finish;
	end
endmodule
