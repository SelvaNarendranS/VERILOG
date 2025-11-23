/* 4. Find the value of the variable t at 1ns & 20 ns respectively from the below snippet.

	time = t;
	initial begin
		#10 t= $time;
		#20;
	end
*/

// ANS:

`timescale 1ns/1ps
module time_check;
	integer t;

	initial begin
        	$monitor("Time = %0t, t = %0d", $time, t);
        							// Start with t undefined (X)
		#10 t = $time;
		#20;				// Block finish at 10 + 20 = 30 ns
		$finish;
	end
endmodule