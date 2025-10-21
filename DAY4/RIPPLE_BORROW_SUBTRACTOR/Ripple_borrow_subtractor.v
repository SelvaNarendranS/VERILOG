// Behavioral model 

// Full subtractor

module full_subtractor (
input a, b, bin,
output reg difference, bout);

	always @(a or b or bin) 
	begin
	  difference = a ^ b ^ bin;
	  bout = (~a & b) | bin & (~(a ^ b));
	end

endmodule

// 4 bit Ripple bout subtractor by 4 Full subtractors

module ripple_borrow_subtractor(
input [3:0]a, b, 
input bin, 
output [3:0]difference, 
output bout);

wire c1, c2, c3;

	// intantiate of 4 full subtractor

	full_subtractor rc1( .a(a[0]), .b(b[0]), .bin(bin), .difference(difference[0]), .bout(c1));
	full_subtractor rc2( .a(a[1]), .b(b[1]), .bin(c1), .difference(difference[1]), .bout(c2));
	full_subtractor rc3( .a(a[2]), .b(b[2]), .bin(c2), .difference(difference[2]), .bout(c3));
	full_subtractor rc4( .a(a[3]), .b(b[3]), .bin(c3), .difference(difference[3]), .bout(bout));
		

endmodule

	 

	 
