// Write a simulation that pauses at time 20 using $stop.

module clock_gen;
    reg clk;
    reg data;

    // Clock generation
	initial clk = 0;
	always #5 clk = ~clk;

    initial begin
        $monitor("time = %0t | clock = %b | data = %d", $time, clk, data);

		data = 1'b1;
	 	#20 $stop;

		data = 1'b0;
	#11 $finish;        
    end
endmodule

