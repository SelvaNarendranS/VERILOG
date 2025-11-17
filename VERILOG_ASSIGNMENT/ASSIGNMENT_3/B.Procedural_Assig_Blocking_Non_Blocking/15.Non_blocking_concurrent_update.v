// Demonstrate how non-blocking assignments allow concurrent updates. 

module nba_demo;
    	reg [7:0] a, b;

    	always @(*) begin
        	a <= 5;
        	b <= a + 1;   // uses old a
    	end

	always @(*)
		$display("Time = %0t | a = %d | b = %d", $time, a, b);

	initial begin

		a = 0;
		b = 0; #2;

		a = 21; 
		b = 15; #2;
		a = 1; 
		b = 5; #2;

	#10 $finish;
	end

endmodule
