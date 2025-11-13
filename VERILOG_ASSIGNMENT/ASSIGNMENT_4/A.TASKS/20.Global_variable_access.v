// Write a task to drive a global variable from within the task.

module Division_8bit;
	reg [7:0]a, b;
	reg [7:0]result;

	initial begin
		
		Divide(a, b, result);  // Task call
		#10 $finish;
	end

// Task definition
task Divide;
	input [7:0]a, b;
	output [7:0]result;
		
	begin
		a = 8'd90; b = 8'd45;
		result = a / b;
		$display("time = %0t | a = %d | b = %d | Result = %d",$time, a, b, result);
	end
endtask

endmodule	


