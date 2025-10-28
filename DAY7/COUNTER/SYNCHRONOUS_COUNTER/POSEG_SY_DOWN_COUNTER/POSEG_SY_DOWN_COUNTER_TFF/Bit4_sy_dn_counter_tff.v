// 4 bit synchronous down - counter

`include "../../../../../DAY6/T_FLIP_FLOP/T_flip_flop.v"  // T Flip flop accessing

module sy_upcnt(
input clk, rst, enable, 
output [3:0]q);

wire [3:0]t;

	// D input generate
	assign t[0] = enable;
	assign t[1] = ~q[0] & enable;
	assign t[2] = ~q[1] & ~q[0] & enable;
	assign t[3] = ~q[2] & ~q[1] & ~q[0] & enable;	

	// Instantiation of T flip flop 
 	
		genvar i;
		generate
	       		for(i = 0; i < 4; i = i+1) begin : df
			tff d_inst(.clk(clk), .rst(rst), .t(t[i]), .q(q[i]));
			end
		endgenerate

endmodule
				       
