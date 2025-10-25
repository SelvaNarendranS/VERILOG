// Behavioral model 

// 4 bit register with parallel load

// Top module D flip flop
`include "Modules_for_include/D_flip_flop.v"

module register4(
input clk, rst, 
input [3:0]a,
output [3:0]f);

	// instantiation of D flip flop
	genvar i;
	generate
	for (i = 0; i < 4; i = i+1) begin : reg_bits
		dff d_inst(.clk(clk), .rst(rst), .d(a[i]), .q(f[i]));
	end
	endgenerate

endmodule
