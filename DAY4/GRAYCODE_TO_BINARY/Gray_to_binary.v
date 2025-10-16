// Behavioral - 4 bit

module gray_to_binary(
input [3:0] a,
output reg [3:0]b);

	always @(*) begin
	
	b[3] = a[3]; 
	b[2] = b[3] ^ a[2];
	b[1] = b[2] ^ a[1];
	b[0] = b[1] ^ a[0];

	end

endmodule
