// Behavioral - 4 bit

module binary_to_gray(
input [3:0] a,
output reg [3:0]b);

	always @(*) begin
	
	b[3] = a[3];
	b[2] = a[3] ^ a[2];
	b[1] = a[3] ^ a[2] ^ a[1];
	b[0] = a[3] ^ a[2] ^ a[1] ^ a[0];

	end

endmodule
