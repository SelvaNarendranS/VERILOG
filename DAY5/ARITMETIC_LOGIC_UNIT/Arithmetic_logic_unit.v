// Behavioral model

// n bit Arithmetic and logic unit

module alu #(parameter N = 4) ( 
input [N-1:0]a, b,
input [3:0]select,
output reg [N-1:0]result);


	always @(*) begin
		case(select)
			0 : result = a + b;
			1 : result = a - b;
			2 : result = a & b;
			3 : result = a | b;
			4 : result = ~a;
			5 : result = ~b;
			6 : result = ~(a & b);
			7 : result = ~(a | b);
			8 : result = a ^ b;
			9 : result = ~(a ^ b);
			10 : result = (a >> 2);
			11 : result = (a << 2);
			12 : result = (b << 2);
			13 : result = (b << 2);
			14 : result = (a < b);
			15 : result = (a > b);
			default : result = 1'bz;
		endcase
	end

endmodule

