// Implement a module that uses initial for setup and always for functional updates.

module initial_setup;
    reg clk; 
    reg [2:0]val, a, b;

    initial begin
        clk = 0;
	repeat(5) begin
        	a = $random;
		b = $random; #2;
	end          
    end

    always #5 clk = ~clk;   

    always @(*) begin 
        val = a + b;
    end

	initial begin
		$monitor("Time = %0t | clk = %d | a = %d | b = %d | val = %d", $time, clk, a, b, val);
	#24 $finish;
	end

endmodule
