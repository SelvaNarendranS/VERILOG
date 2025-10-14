// Behavioral model 

// Full adder

module full_adder (
input a, b, cin,
output reg sum, cout);

	always @(a or b or cin) 
	begin
	  sum = a ^ b ^ cin;
	  cout = (a & b) | cin & (a ^ b);
	end

endmodule

// 4 bit Ripple cout adder by 4 Full adders

module ripple_carry_adder(
input [3:0]a, b, 
input cin, 
output [4:0]sum, 
output cout);

wire c1, c2, c3;

	// intantiate of 4 full adder

	full_adder rc1( .a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(c1));
	full_adder rc2( .a(a[1]), .b(b[1]), .cin(c1), .sum(sum[1]), .cout(c2));
	full_adder rc3( .a(a[2]), .b(b[2]), .cin(c2), .sum(sum[2]), .cout(c3));
	full_adder rc4( .a(a[3]), .b(b[3]), .cin(c3), .sum(sum[3]), .cout(cout));
	
	assign sum[4] = cout;	

endmodule

	 

	 
