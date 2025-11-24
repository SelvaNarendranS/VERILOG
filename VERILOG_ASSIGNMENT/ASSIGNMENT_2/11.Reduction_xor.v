// 11. What is the value of x in the below snippet?
/*
reg [2:0]a;
reg [2:0]x;
	initial begin
		a = 3'd4;
		x = ^a;
end	*/

// ANS:

module reduction_xor;
reg [2:0]a;
reg [2:0]x;
	initial begin
		a = 3'd4;
		x = ^a;
		$display("x(^a) = %b", x);
	end
endmodule