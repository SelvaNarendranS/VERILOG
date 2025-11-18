// Explain the three-step process of non-blocking execution: Read, Evaluate, Schedule.

module non_blocking_3steps;
	reg [2:0]a, b;
	reg [2:0]out;       // Evaluate -->> Evaluate the expression and Result stored in NBA queue(waiting for update to check time)

	// always block blocking
	always @(*) begin
		$display("\n-------------Always block----------Non blocking combinational");
		out <= a + b;         // Read --->> All RHS value read first(b, c) --> the previous old values  
		$display("Time = %0t | a = %d | b = %d | out = %d", $time, a, b, out);  // schedule -->> At the end of the time schedule All queue are updated to (out) at same time.
	end

	initial begin
		repeat(2) begin
			a = $random;
			b = $random; #4;
		end
		#21 $finish;
	end
endmodule


