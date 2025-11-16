// Write a testbench that uses $random to generate test data.

module sub_8bit;
	reg [7:0]a, b;
	wire signed [8:0]diff;
	
	assign diff = a - b;

	initial begin		
		$monitor("time = %0t | a = %d | b = %d | difference = %d",$time, a, b, diff);

		repeat(10) begin
			a = $random;
			b = $random; #5;
		end
		#12 $finish;
	end

endmodule	

