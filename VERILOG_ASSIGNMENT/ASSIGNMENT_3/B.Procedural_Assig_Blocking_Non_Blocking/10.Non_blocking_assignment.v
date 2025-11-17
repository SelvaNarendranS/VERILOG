// Modify the above to use non-blocking assignments and compare the outputs.

module non_blocking_assignment;
	reg [2:0]a, b;
	reg [2:0]out2b;
	reg [2:0]sout2b;

	// always block blocking
	always @(*) begin
		$display("\n-------------Always block----------Non blocking combinational");
		out2b <= a + b; 
		$display("Time = %0t | a = %d | b = %d | out = %d", $time, a, b, out2b);
		sout2b <= a -b;
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
