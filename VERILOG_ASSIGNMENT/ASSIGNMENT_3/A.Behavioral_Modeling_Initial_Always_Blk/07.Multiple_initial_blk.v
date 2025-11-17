// What happens if you use multiple initial blocks in the same module? Demonstrate.

module multiple_initial_blk;
    reg clk; 
    reg [2:0]val, a, b;

    initial begin
        clk = 0;
	repeat(5) begin
		a = $random; #2;
		a = $random;
	end          
    end

    initial begin
        clk = 0;
	repeat(5) begin
		b = $random; #2;
		b = $random;
	end          
    end


    initial begin
	forever #5 clk = ~clk;  
    end 

    initial begin 
        val = a + b;     // executed only once at 0 simulation time 
    end

	initial begin
		$monitor("Time = %0t | clk = %d | a = %d | b = %d | val = %d", $time, clk, a, b, val);
	#24 
		$display("executed only once at 0 simulation time so output retains same");
	$finish;
	end

endmodule
