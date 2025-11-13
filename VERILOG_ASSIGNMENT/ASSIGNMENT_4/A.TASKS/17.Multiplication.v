// Create a task that performs multiplication and outputs the result using $display.

module multiplication_8bit;
	reg [7:0]a, b;
	reg [15:0]result;

	initial begin
		a = 8'd50; b = 8'd90;
		multiply(a, b, result);  // Task call
		#10 $finish;
	end

// Task definition
task multiply;
	input [7:0]x, y;
	output [15:0]result;
		
	begin
		result = x * y;
		$display("time = %0t | a = %d | b = %d | sum = %d",$time, x, y, result);
	end
endtask

endmodule	


