// Use multiple always blocks in a module and simulate how they execute in parallel.

module toggle_1bit;
	reg clk;
	reg [2:0]a, b;
	reg [2:0]out1a, out1b, out2a, out2b;
	reg [2:0]sout1a, sout1b, sout2a, sout2b;

	// clock generation
	initial clk = 0;
	always #5 clk = ~clk;
	
	// always block 1a non blocking
	always @(posedge clk) begin
		$display("\n 1-------------Always block 1a----------non blocking clk");
		out1a <= a + b; 
		$display("Time = %0t | a = %d | b = %d | out = %d", $time, a, b, out1a);
		sout1a <= a - b;
		$display("Time = %0t | a = %d | b = %d | out = %d", $time, a, b, sout1a);
	end

	// always block 2 blocking
	always @(posedge clk) begin
		$display("\n 2-------------Always block 1b----------blocking clk");
		out1b = a + b; 
		$display("Time = %0t | a = %d | b = %d | out = %d", $time, a, b, out1b);
		sout1b = a -b;
		$display("Time = %0t | a = %d | b = %d | out = %d", $time, a, b, sout1b);
	end	

	// always block 3 non blocking
	always @(*) begin
		$display("\n 3-------------Always block 1a----------non blocking combinational");
		out2a <= a + b; 
		$display("Time = %0t | a = %d | b = %d | out = %d", $time, a, b, out2a);
		sout2a <= a -b;
		$display("Time = %0t | a = %d | b = %d | out = %d", $time, a, b, sout2a);
	end

	// always block 4 blocking
	always @(*) begin
		$display("\n 4-------------Always block 1b----------blocking combinational");
		out2b = a + b; 
		$display("Time = %0t | a = %d | b = %d | out = %d", $time, a, b, out2b);
		sout2b = a -b;
		$display("Time = %0t | a = %d | b = %d | out = %d", $time, a, b, sout2b);
	end


	initial begin
		
			a = $random;
			b = $random; #4;

		#21 $finish;
	end
endmodule
