// Behavioral model 

// Full subractor

module full_subractor (
input a, b, bin,
output reg difference, bout);

	always @(a or b or bin) 
	begin
	  difference = a ^ b ^ bin;
	  bout = (~a & b) | bin & (~(a ^ b));
	end

endmodule

// 4 bit Ripple bout subractor by 4 Full subractors

module ripple_borrow_subractor(
input [3:0]a, b, 
input bin, 
output [3:0]difference, 
output bout);

wire c1, c2, c3;

	// intantiate of 4 full subractor

	full_subractor rc1( .a(a[0]), .b(b[0]), .bin(bin), .difference(difference[0]), .bout(c1));
	full_subractor rc2( .a(a[1]), .b(b[1]), .bin(c1), .difference(difference[1]), .bout(c2));
	full_subractor rc3( .a(a[2]), .b(b[2]), .bin(c2), .difference(difference[2]), .bout(c3));
	full_subractor rc4( .a(a[3]), .b(b[3]), .bin(c3), .difference(difference[3]), .bout(bout));
		

endmodule

	 

	 
