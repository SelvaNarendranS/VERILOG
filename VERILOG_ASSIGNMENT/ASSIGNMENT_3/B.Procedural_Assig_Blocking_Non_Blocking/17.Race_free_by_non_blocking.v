// Modify a race-prone code using = into a race-free one using <=.

module race_free;
    	reg clk, a, b;

	// clock generation
	initial clk = 0;
	always #5 clk = ~clk;

    	always @(posedge clk) begin
        	a <= b;     
        	b <= a;     // Race condition solved by <= non blocking
	end

	initial begin
		$monitor("Time = %0t | clk = %d | a = %d | b = %d", $time, clk, a, b);
	
		a = 0;
		b = 0; #1;

		a = 0; #2;
		a = 1; #2;

	#11 $finish;
	end
endmodule
