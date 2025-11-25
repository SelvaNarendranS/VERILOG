// 9. What is the value of y in the below snippet?
/*
reg [2:0] a, b;
reg y;
	initial begin
		a= 3'd5;
		b= 3'b111
		y = a&&b;
	end	*/

// ANS:

module value_y;
reg [2:0] a, b;
reg y;
	initial begin
		a= 3'd5;
		b= 3'b111;
		y = a && b;
		$display("y(a && b) = %b", y); // 1
	end

endmodule
