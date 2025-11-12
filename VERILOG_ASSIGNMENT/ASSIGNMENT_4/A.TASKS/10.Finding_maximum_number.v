// Create a task that accepts 4 inputs and returns the maximum among them.

module maximum;
	reg [7:0]a0, a1, a2, a3;
	reg [7:0]max;

	initial begin
		a0 = 8'd50; a1 = 8'd90; a2 = 8'd210; a3 = 8'd10;
		Finding_maximum(a0, a1, a2, a3, max);  // Task call
		#10 $finish;
	end

// Task definition
task Finding_maximum;
	input [7:0]a0, a1, a2, a3;
	output [7:0]max;
	reg [7:0]max1, max2;	
	begin
		max1 = (a0 > a1) ? a0 : a1;
		max2 = (a2 > a3) ? a2 : a3;
		max = (max1 > max2) ? max1 : max2;

		$display("time = %0t | a[0] = %d | a[1] = %d | a[2] = %d | a[3] = %d | Max number = %d",$time, a0, a1, a2, a3, max);
	end
endtask

endmodule	


