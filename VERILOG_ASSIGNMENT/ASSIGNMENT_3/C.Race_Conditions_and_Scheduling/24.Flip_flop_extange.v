// Simulate two flip-flops exchanging values with blocking and non-blocking assignments.

module race_condition_vs_resolved;
    	reg clk;
	reg [3:0]a_b, b_b, a_nb, b_nb;

	// clock generation
	initial clk = 0;
	always #5 clk = ~clk;

    	always @(posedge clk) begin
        	a_b = b_b;     
        	b_b = a_b;     // Race condition
	end

    	always @(posedge clk) begin
        	a_nb <= b_nb;     
        	b_nb <= a_nb;     // Race condition resolved
	end

	initial begin
		$monitor("Time = %0t | clk = %d | a = %d | b = %d | a nb = %d | b nb = %d", $time, clk, a_b, b_b, a_nb, b_nb);
	
		a_nb = 0;
		b_nb = 0; #1;

		a_b = 0; #2;
		a_b = 1; #2;


		$display("\n Resolved race condition");
		a_nb = 0; #2;
		b_nb = 1; #2;

	#23 $finish;
	end
endmodule
