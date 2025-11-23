// 3. What value is passed across the port b in the below snippet?
/*
module test(output [32:0]b);
	real a=14.5;
	assign b = a;
endmodule */

// Ans:
module test(output [32:0]b);
	real a=14.5;    		//Assigning a real to a vector truncates the fractional part.
	assign b = a; 			// 14.5 → 14
	initial begin
		$display("b in binary = %33b", b);   // but simulator rounded off to 15 = 0000000...0001111  (33 bits total)
	end					     // expected 14 = 0000000...0001110  (33 bits total)
endmodule