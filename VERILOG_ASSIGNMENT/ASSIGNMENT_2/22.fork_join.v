// 22. What will be the value of x after executing the code? Justify your answer.
/*
reg [3:0] x;
	initial begin
		x = 4'b0011;
		fork
			#5 x = x + 1;
			#10 x = x + 2;
		join
	end  */

// ANS:

module fork_join;
reg [3:0] x;
	initial begin
		$monitor("Time = %0t | x = %b", $time, x);
		x = 4'b0011;
		fork
			#5 x = x + 1;
			#10 x = x + 2;
		join
	end
endmodule