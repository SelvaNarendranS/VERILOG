// Implement the above logic using a for loop instead of while.

module find_1s_by_for;
	reg [3:0]count, in;
	integer i; 

	initial begin
		$monitor("Time = %0t | input = %b | count = %d", $time, in, count);

		// values
		in = 4'd5; #2; 
		count = 0; #2;
		for(i = 0; i < 4; i ++) begin
			if(in[i] == 1'b1) begin
				count = count + 1;
			end		
		end

		#23 $finish;
	end
endmodule
