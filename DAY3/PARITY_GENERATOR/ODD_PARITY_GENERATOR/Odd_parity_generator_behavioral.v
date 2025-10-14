// Behavioral model

module odd_parity_generator (
input [3:0]a,
output reg b,
output reg [4:0]generated);

	always @(*) begin

	b = ~^a; // using reduction operator
	generated = {b,a};
		
	end

endmodule
