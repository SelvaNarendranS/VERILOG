// 5. Write an RTL snippet to initialize all the locations of an array of size:10x8 to 0 at 0ns. Depth= 10, Width = 8bits

module array;
	reg [7:0]arr[9:0];

	initial begin
		// initialize
		for(integer i = 0; i < 8; i++) begin
			arr[i] = 8'd0;
			$display("Time = %0t | arr[%0d] = %d", $time, i, arr[i]);
		end
	end
endmodule
