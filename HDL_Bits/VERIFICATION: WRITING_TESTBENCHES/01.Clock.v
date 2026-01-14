module top_module ( );
	reg clk;
    
    // Instantiation
    dut uup(.clk(clk));
    
    initial clk = 0;
    always #5 clk = ~clk;
	    
endmodule
