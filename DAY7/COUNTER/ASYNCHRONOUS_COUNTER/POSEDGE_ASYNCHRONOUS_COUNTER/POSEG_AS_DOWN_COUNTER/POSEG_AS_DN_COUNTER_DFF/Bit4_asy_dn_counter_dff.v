// 4 bit Asynchronous down - counter or ripple counter

`include "../../../../../../DAY6/D_FLIP_FLOP/D_flip_flop.v"   // T Flip flop accessing

module asy_dncnt(
input clk, rst,
output [3:0]q);

wire [3:0]q_bar;

	// Instantiation of D flip flop
	dff df0(.clk(clk), .rst(rst), .d(q_bar[0]), .q_bar(q_bar[0]), .q(q[0]));       
	dff df1(.clk(q[0]), .rst(rst), .d(q_bar[1]), .q_bar(q_bar[1]), .q(q[1]));      // Posedge q = clk of next Flip flop
	dff df2(.clk(q[1]), .rst(rst), .d(q_bar[2]), .q_bar(q_bar[2]), .q(q[2]));
	dff df3(.clk(q[2]), .rst(rst), .d(q_bar[3]), .q_bar(q_bar[3]), .q(q[3]));

endmodule
