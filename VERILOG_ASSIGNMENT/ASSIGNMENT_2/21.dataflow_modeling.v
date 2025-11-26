// 21. Consider the following Verilog code using dataflow modeling
/*
module Unknown (p,a,b,c);
	output p;
	input a,b,c;
	wire q,r;
	assign q=!((!a) && b && (!c));
	assign r= !(a && (!b) && (!c));
	and G1(p,q,r);
endmodule

If c = 0 the Boolean expression for p would be

A. NAND operation between variables a and b
B. NOR operation between variables a and b
C. XOR operation between variables a and b
D. XNOR operation between variables a and b  */

// ans

module Unknown;
	wire p;
	reg a,b,c;
	wire q,r;
	assign q=!((!a) && b && (!c));
	assign r= !(a && (!b) && (!c));
	and G1(p,q,r);            	// D.XNOR 

	initial begin
		$monitor("a = %b | b = %b | c = %b | P = %b", a, b, c, p);

		c = 0; #1;

		a = 0; b = 0; #2;
		a = 0; b = 1; #2;
		a = 1; b = 0; #2;
		a = 1; b = 1; #2;  

	$finish;
	end
endmodule