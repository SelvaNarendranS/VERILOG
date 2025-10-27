// N bit Serial in serial out shift register using D instantiation

`include "../../REGISTER/Modules_for_include/D_flip_flop.v"

// top module
module siso #(parameter N = 4)(
input clk, rst, enable,
input a,
output f);

wire [N-1:0]d_in, shift_reg;

	assign d_in = enable ? a : f;

	// Instantiation 
	dff d_inst(.clk(clk), .rst(rst), .d(d_in[0]), .q(shift_reg[0]));

	genvar i;
	generate
		for(i = 1; i < N; i = i+1) begin : siso
			dff d_inst(.clk(clk), .rst(rst), .d(shift_reg[i-1]), .q(shift_reg[i]));
		end
	endgenerate

	assign f = shift_reg[N-1];

endmodule
