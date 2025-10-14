// Behavioral model

module even_parity_generator (
input [3:0]a,
output reg b);

	always @(*) begin

	b = ^a; // using reduction operator

	end

endmodule