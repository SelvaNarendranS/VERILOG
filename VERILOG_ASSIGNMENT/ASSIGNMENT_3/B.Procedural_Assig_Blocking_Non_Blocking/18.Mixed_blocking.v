// Mix = and <= in one block and explain simulation output.

module mix_blocking;
    	reg clk;
	reg [3:0]a, b, c;

	// clock generation
	initial clk = 0;
	always #5 clk = ~clk;

    	always @(posedge clk) begin
        	a = b;       //  non blocking   
        	b <= a;      // blocking
		c = a + 1;   // non blocking; 
	end

	initial begin
		$monitor("Time = %0t | clk = %d | a = %d | b = %d | c = %d", $time, clk, a, b, c);
	
		a = 0;
		b = 0;
		c = 0; #1;

		a = 4'd8; 
		b = 4'd4; #2;
		a = 4'd3; 
		b = 4'd7; #2;

	#11 $finish;
	end
endmodule
