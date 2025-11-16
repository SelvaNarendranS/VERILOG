// Demonstrate $monitor to track signal changes in a clock and data signal.

module clock_gen;
    reg clk;
    reg data;

    // Clock generation
	initial clk = 0;
	always #5 clk = ~clk;

    initial begin
        $monitor("time = %0t | clock = %b | data = %d", $time, clk, data);

	repeat(10) begin
		data = $random; #5;
	end
	#11 $finish;        
    end
endmodule
