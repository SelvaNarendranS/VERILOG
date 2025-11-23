// What is the value of the b in the below snippet?
/*
integer b;
	initial begin
		b= -‘d12/3;
end
*/

// ANS:
module value_b;
	integer b;

	initial begin
		//b = -'d12/3;         // signed -(12)/3 = -4 is correct evaluation, -(12/3) is not correct evaluation
		// Use 32'sd for a 32-bit signed decimal constant
		b = -'sd12/3;          // To print signed expected value
		
		$display("b in value_b = %0d", b);
	end
endmodule

/* 
Order of evaluation: in verilog 
Unary -    has the highest precedence than divide
Multiply/Divide/Modulus (* / %)