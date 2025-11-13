// Write a task that checks whether two 8-bit inputs are equal and sets a flag.

module equal_8bit;
	reg [7:0]a, b;
	reg flag;

	initial begin
		a = 8'd34; b = 8'd47;
		check_equal(a, b, flag);  // Task call

                a = 8'd14; b = 8'd14;
                check_equal(a, b, flag);  // Task call

		#10 $finish;
	end

// Task definition
task check_equal;
	input [7:0]a, b;
	output flag;
		
	begin
		flag = ~(a ^ b);
		$display("time = %0t | a = %d | b = %d | Flag = %d",$time, a, b, flag);
	end
endtask

endmodule	


