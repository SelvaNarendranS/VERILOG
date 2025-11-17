// Explain how = and <= affect simulation order with examples.

module Blocking_vs_non_blocking;
	reg [2:0]a, b;
	reg [2:0]out1a, out2b;
	reg [2:0]sout1a, sout2b;
	
	// always block 1a non blocking
	always @(*) begin
		$display("\n -------------Always block 1a----------non blocking clk");
		out1a <= a + b; 
		$display("Time = %0t | a = %d | b = %d | out = %d", $time, a, b, out1a);
		sout1a <= a - b;
		$display("Time = %0t | a = %d | b = %d | out = %d", $time, a, b, sout1a);
	end

	// always block 4 blocking
	always @(*) begin
		$display("\n -------------Always block 1b----------blocking combinational");
		out2b = a + b; 
		$display("Time = %0t | a = %d | b = %d | out = %d", $time, a, b, out2b);
		sout2b = a -b;
		$display("Time = %0t | a = %d | b = %d | out = %d", $time, a, b, sout2b);
	end


	initial begin
		repeat(2) begin
			a = $random;
			b = $random; #4;
		end
		#21 $finish;
	end
endmodule
