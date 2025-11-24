// 12. Evaluate the value of x in the below snippet.
/*
reg [3:0]a;
reg [1:0]x;
	initial begin
		a = 4'd10;
		X= (a>>1);
	end		*/

// ANS:

module right_shift;
reg [3:0]a;
reg [1:0]x;
	initial begin
		a = 4'd10;
		x= (a>>1);
		$display("x(a >> 1) = %b", x);
	end
endmodule