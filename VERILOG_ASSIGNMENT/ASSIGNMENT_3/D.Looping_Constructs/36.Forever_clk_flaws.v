// Explain why forever loops are not synthesizable and how to work around them.

module forever_not_synthesizable;
	reg clk; 

	// initial block
	initial begin : CLOCK_BLOCK
		clk = 1'b0;
		forever #5 clk = ~clk;
	end	

	initial begin
		#50 disable CLOCK_BLOCK;
		$display("Time = %0t | clk = %b", $time, clk);
	end
endmodule


/*
forever loops cannot be synthesized

--->> Hardware requires finite, predictable logic.
--->> forever loops imply infinite execution, so it cannot map for Flip flops.	
--->> So hardware cannot able to make infinite clk

so Use clocked always block instead

always @(posedge clk) begin     ------->> Synthesizable Clock
    signal <= ~signal;   // Generate toggles in real hardware
end   
*/
	