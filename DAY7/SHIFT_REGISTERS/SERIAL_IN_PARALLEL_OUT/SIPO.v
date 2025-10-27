// N bit Serial in parallel out shift register using D instantiation

`include "../../REGISTER/Modules_for_include/D_flip_flop.v"

// top module
module sipo #(parameter N = 4)(
input clk, rst, enable,
input a,
output [N-1:0]f);

wire [N-1:0]d_in;

	assign d_in = enable ? a : f;

	// Instantiation 
	dff d_inst(.clk(clk), .rst(rst), .d(d_in[0]), .q(f[0]));

	genvar i;
	generate
		for(i = 1; i < N; i = i+1) begin : siso
			dff d_inst(.clk(clk), .rst(rst), .d(f[i-1]), .q(f[i]));
		end
	endgenerate

endmodule
