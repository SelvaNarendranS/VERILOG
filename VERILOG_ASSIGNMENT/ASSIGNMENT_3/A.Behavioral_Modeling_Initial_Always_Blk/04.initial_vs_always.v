// Explain the functional difference between initial and always with simulation output.

module initial_vs_always;
    reg clk, val;

    initial begin
        clk = 0;
        val = 1;           // executed once
    end

    always #5 clk = ~clk;   // continue till finish

    always @(posedge clk) begin 
        val <= ~val;
    end

	initial begin
		$monitor("Time = %0t | clk = %d | val = %d", $time, clk, val);
	#24 $finish;
	end

endmodule
