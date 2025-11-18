// Count down from 10 to 0 using a while loop and show each value with $display.

module shift_until_msb;
	integer count;

	initial begin 
		count = 10;

		while(count >= 0) begin
			$display("result = %0d", count);
			count = count - 1;
		end	

	end
endmodule
