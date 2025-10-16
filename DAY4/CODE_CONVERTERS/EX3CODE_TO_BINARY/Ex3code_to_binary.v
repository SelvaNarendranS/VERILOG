// Behavioral - 4 bit

module ex3code_to_binary(
input [3:0] a,
output reg [3:0]b);

	always @(*) begin
	
	b = a - 4'b0011;

	end

endmodule
