// Generate a clock in a testbench using reg clk and always #5 clk = ~clk.

module clock_gen_tb;
    reg clk;

    // Clock generation
	initial clk = 0;
	always #5 clk = ~clk;

    initial begin
        $monitor("time = %0t | clock = %b", $time, clk);
	#20 $finish;        
    end
endmodule

