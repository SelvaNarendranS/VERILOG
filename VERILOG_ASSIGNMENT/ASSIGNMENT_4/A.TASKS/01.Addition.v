// Addition of two 8-bit numbers

module add_8bit;
	reg [7:0]a, b;
	reg [8:0]sum;

	initial begin
		a = 8'd50; b = 8'd90;
		addition(a, b, sum);  // Task call
		#10 $finish;
	end

// Task definition
task addition;
	input [7:0]x, y;
	output [8:0]add;
		
	begin
		add = x + y;
		$display("time = %0t | a = %d | b = %d | sum = %d",$time, x, y, add);
	end
endtask

endmodule	

