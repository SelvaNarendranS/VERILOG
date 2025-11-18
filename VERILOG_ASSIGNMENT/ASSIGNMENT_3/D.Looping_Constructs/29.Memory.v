// Initialize a 16-byte memory with repeat loop.

module b16_memory;
	reg [7:0]memo[15:0];
	reg [7:0]in, out;
	integer i, j;
	initial begin

		// values 
		i = 0;
		repeat(16) begin
			memo[i] = $random;
			i = i + 1;
		end

		// display
		j = 0;
		repeat(16) begin
			out = memo[j];
		$monitor("Time = %0t | input = %b | memory[j] = %d", $time, in, out);
			j = j + 1;
		end

		#23 $finish;
	end
endmodule
