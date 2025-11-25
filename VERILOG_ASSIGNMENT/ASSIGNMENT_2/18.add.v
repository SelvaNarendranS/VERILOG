// 18. What is the value of b in the below expression and justify the reason.
/*
reg [3:0]a= 4'b0100;
reg [3:0]b;
	initial begin
		b = a+1'bx;
	end		*/

// ANS:
module add;
reg [3:0]a= 4'b0100;
reg [3:0]b;
	initial begin
		b = a+1'bx;  // b = xxxx
		$display("b = %b", b);
	end
endmodule