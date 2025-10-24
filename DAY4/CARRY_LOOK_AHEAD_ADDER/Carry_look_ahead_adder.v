// Behavioral model

// 4 bit carry look ahead adder

module cla(
input [3:0] a, b,
input cin,
output reg [4:0] sum,
output reg cout);
integer i;

reg [3:0]p, g;
reg [4:0]c;

	always @(*)
	begin
	
		p = a ^ b;  // carry propagate
		g = a & b;  // carry generate

		// initialize carry 
		c[0] = cin;

		// calculate carry look ahead adder
		for(i = 0;i < 4; i++)
		begin
			c[i+1] = g[i] | (p[i] & c[i] );	
		end

		// sum calculation 
	        sum[3:0] = c[3:0] ^ p;

	cout = c[4];
	sum[4] = c[4];
	end
endmodule		
