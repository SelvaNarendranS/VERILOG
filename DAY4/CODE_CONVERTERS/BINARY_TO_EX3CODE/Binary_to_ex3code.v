// Behavioral model - 4 bit

module binary_to_ex3code(
input [3:0] a,
output reg [3:0]b);

	always @(*) begin
	
	b = a + 4'b0011;

	end
endmodule
