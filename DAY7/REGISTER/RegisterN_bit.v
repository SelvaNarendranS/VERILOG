// Behavioral model 

// N bit register with enable & parallel load

// D flip flop
`include "Modules_for_include/D_flip_flop.v"

// Top module
module registerN #(parameter N = 4)(
input clk, rst, enable, 
input [N-1:0]a,
output [N-1:0]f);

wire [N-1:0]d_in;

	// enable = 1 means register in active state
	assign d_in = enable ? a : f;  

	// instantiation of D flip flop
	genvar i;
	generate
	for (i = 0; i < N; i = i+1) begin : reg_bits
		dff d_inst(.clk(clk), .rst(rst), .d(d_in[i]), .q(f[i]));
	end
	endgenerate

endmodule
