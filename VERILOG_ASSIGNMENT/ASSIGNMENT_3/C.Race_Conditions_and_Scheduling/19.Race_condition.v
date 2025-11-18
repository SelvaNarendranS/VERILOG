// Demonstrate a race condition using two always blocks assigning to the same variable.

module race_condition;
    	reg clk, a;

	// clock generation
	initial clk = 0;
	always #5 clk = ~clk;

    	always @(posedge clk) begin
        	a = 0;     
       	end

    	always @(posedge clk) begin     
        	a = 1;     // Race condition occurs due to unable to set a fixed value to variable
	end

	initial begin
		$monitor("Time = %0t | clk = %d | a = %d", $time, clk, a);

	#10 $finish;
	end
endmodule
