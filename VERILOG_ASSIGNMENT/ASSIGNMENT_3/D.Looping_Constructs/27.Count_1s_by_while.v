// Use a while loop to count the number of 1s in a 4-bit vector.

module find_1s_by_while;
	reg [3:0]count, in;
	integer i; 

	initial begin
		$monitor("Time = %0t | input = %b | count = %d", $time, in, count);

		// values
		in = 4'd14; #2; 
		i = 0;
		count = 0; #2;
		while(i < 4) begin
			if(in[i] == 1'b1) begin
				count = count + 1;
			end
		i = i + 1;		
		end

		#23 $finish;
	end
endmodule
