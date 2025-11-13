// Write a task that takes an array of numbers and returns the average.

module array_average;
	reg [7:0]a, b, c, d;
	reg [7:0]out;

	initial begin
		a = 8'd42; b = 8'd10; c = 8'd24; d = 8'd59;

		average(a, b, c, d, out);
		$display("Time = %0t | a, b, c, d = %d(%d +%d +%d +%d) | average = %d", $time, (a+b+c+d), a, b, c, d, out);

		#10 $finish;
	end

	// Task definition
	task average;
		input [7:0]a, b, c, d;
        	output [7:0]out;
		reg [10:0]sum;
		begin
			sum = (a + b + c + d);
			out = (sum / 4);
		end
	endtask
endmodule
