// Create a pipelined register using non-blocking assignments. 

module pipeline_reg;
    	reg clk;
    	reg [7:0] din;
    	reg [7:0] level1;
    	reg [7:0] level2;

	// clock generation
	initial clk = 0;
	always #5 clk = ~clk;

    	always @(posedge clk) begin
        	level1 <= din;     // latch 1
        	level2 <= level1;  // latch 2
	end

	initial begin
		$monitor("clk = %d | din = %d | level1 = %d | level2 = %d", clk, din, level1, level2);

		level1 = 0;
		level2 = 0;

		din = 2; #2;
		din = 6; #2;
		din = 21; #5;
		din = 15; #7;
		din = 5; #10;
	#10 $finish;
	end
endmodule
