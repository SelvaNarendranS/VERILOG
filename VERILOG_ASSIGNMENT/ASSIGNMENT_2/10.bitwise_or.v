// 10. What is the value of x in the below snippet?
/*
reg [2:0] a, b;
reg [2:0]x;
	initial begin
		a=3'd5;
		b=3’b111;
		x= a | b;
	end 	*/

// ANS:

module bitwise_or;
reg [2:0] a, b;
reg [2:0]x;
	initial begin
		a=3'd5;
		b=3'b111;
		x= a | b;
		$display("x(a | b) = %b", x); // 111
	end

endmodule
