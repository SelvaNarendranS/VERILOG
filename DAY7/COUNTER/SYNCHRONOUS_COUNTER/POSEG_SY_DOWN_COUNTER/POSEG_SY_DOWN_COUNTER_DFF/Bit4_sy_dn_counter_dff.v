// 4 bit synchronous down - counter

`include "../../../../../DAY6/D_FLIP_FLOP/D_flip_flop.v"  // // D Flip flop accessing

module sy_dncnt(
input clk, rst, enable, 
output [3:0]q);

wire [3:0]d;

	// D input generate
	assign d[0] = q[0] ^ enable;
	assign d[1] = q[1] ^ (~q[0] & enable);
	assign d[2] = q[2] ^ (~q[0] & ~q[1] & enable);
	assign d[3] = q[3] ^ (~q[0] & ~q[1] & ~q[2] & enable);	   

	// Instantiation of D flip flop 
 	
		genvar i;
		generate
	       		for(i = 0; i < 4; i = i+1) begin : df
			dff d_inst(.clk(clk), .rst(rst), .d(d[i]), .q(q[i]));
			end
		endgenerate

endmodule
				       
