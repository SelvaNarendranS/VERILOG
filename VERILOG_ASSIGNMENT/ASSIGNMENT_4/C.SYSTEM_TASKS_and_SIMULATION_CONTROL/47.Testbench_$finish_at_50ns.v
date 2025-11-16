// Create a testbench that ends simulation after 50 time units using $finish.

module clock_gen;
    reg clk;

	initial clk = 0;
	always #4 clk = ~clk;

    initial begin
	    $monitor("time = %0t | clock = %b", $time, clk); 

	#50;
	$finish;
                
    end
endmodule

