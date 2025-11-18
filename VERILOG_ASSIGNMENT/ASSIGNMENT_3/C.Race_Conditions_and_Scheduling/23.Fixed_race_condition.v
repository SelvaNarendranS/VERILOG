// Use $display to show wrong outputs due to race and fix it using proper constructs.

module race_condition_vs_resolved;
    	reg clk, a, b, c, d;

	// clock generation
	initial clk = 0;
	always #5 clk = ~clk;

    	always @(posedge clk) begin
        	a = b;     
        	b = a;     // Race condition
	end

    	always @(posedge clk) begin
        	c <= d;     
        	d <= c;     // Race condition resolved
	end

	initial begin
	
		c = 0;
		d = 0; #1;

		a = 0; #2;
		$display("'Race condition'Time = %0t | clk = %d | a = %d | b = %d", $time, clk, a, b);
		$display("'Race condition'Time = %0t | clk = %d | a = %d | b = %d", $time, clk, a, b);
		a = 1; #2;
		$display("'Race condition'Time = %0t | clk = %d | a = %d | b = %d", $time, clk, a, b);
		$display("'Race condition'Time = %0t | clk = %d | a = %d | b = %d", $time, clk, a, b);

		$display("\n Resolved race condition");
		c = 0; #2;
		$display("'Race fixed'Time = %0t | clk = %d | c = %d | d = %d", $time, clk, c, d);
		$display("'Race fixed'Time = %0t | clk = %d | c = %d | d = %d", $time, clk, c, d);
		c = 1; #2;
		$display("'Race fixex'Time = %0t | clk = %d | c = %d | d = %d", $time, clk, c, d);
		$display("'Race fixed'Time = %0t | clk = %d | c = %d | d = %d", $time, clk, c, d);

	#23 $finish;
	end
endmodule
