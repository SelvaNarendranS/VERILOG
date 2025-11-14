// Use $display to print values of two registers and their sum.

module add_8bit;
	reg [7:0]a, b;
	reg [8:0]sum;

	initial begin
		a = 8'd50; b = 8'd90;
		sum = a + b;
		$display("time = %0t | a = %d | b = %d | sum = %d",$time, a, b, sum);
		#10 $finish;
	end

endmodule	

