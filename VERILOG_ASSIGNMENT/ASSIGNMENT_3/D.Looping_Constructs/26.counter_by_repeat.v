// Design a counter using a repeat loop and simulate 8 cycles.

module counter_by_repeat;
	reg [4:0]count; 

	// initial block
	initial begin
		count = 0;
		repeat(8) begin
			count = count + 1;
			$display("Time = %0t | count = %b", $time, count);
		end

		#23 $finish;
	end
endmodule
