// Use multiple always blocks in a module and simulate how they execute in parallel.

module dual_always_timing;
    reg clk1, clk2;
    reg x, y;

    initial begin
        clk1 = 0;
        clk2 = 0;
        x = 0;
        y = 0;
    end

    // Clock 1 
    always #10 clk1 = ~clk1;

    // Clock 2 
    always #7 clk2 = ~clk2;

    always @(posedge clk1)
        x <= ~x;

    always @(posedge clk2)
        y <= ~y;

	always @(*) begin
		$monitor("Time = %0t | clk1 = %d | clk2 = %d| x = %d | y = %d", $time, clk1, clk2, x, y);
	#24 $finish;
	end


endmodule
