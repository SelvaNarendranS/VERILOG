// 13. Find the value of b in the below snippet.
/*
reg [3:0]a;
reg [6:0]b;
	initial begin
		a=4'd10;
		b={a,1};
	end	*/

// ANS:

module concatenate;
reg [3:0]a;
reg [6:0]b;
	initial begin
		a=4'd10;
		b={a,1'b1};
		$display("b({a,1}) = %b", b);  // 0010101
	end
endmodule
