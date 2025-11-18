// Simulate a buffer that stores data every positive clock edge using repeat.

module buffer_at_clk;
	reg clk;
	reg [7:0]buffer[15:0];
	reg [7:0]in, out;
	integer i, j;

	// clk generation
	initial clk = 0;
	always #5 clk = ~clk;

	initial begin
		// values 
		i = 0;
		repeat(16) begin
			@(posedge clk);
			in = $random;
			buffer[i] = in;
			$display("Time = %0t | Buffer in[%0d] = %d", $time, i, in);
			i = i + 1;
		end

		// display

		$display("\n-----------buffer out ---------------");
		j = 0;
		repeat(16) begin
			@(posedge clk);
			out = buffer[j];
			$display("Time = %0t | Buffer_out[%0d] = %d", $time, j, out);
			j = j + 1;
		end

		#23 $finish;
	end
endmodule
