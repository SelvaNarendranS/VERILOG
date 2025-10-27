// 4 bit Asynchronous up - counter or ripple counter

`include "../../../../../../DAY6/T_FLIP_FLOP/T_flip_flop.v"   // T Flip flop accessing

module asy_upcnt(
input clk, rst,
output [3:0]q);

wire [3:0]q_bar;

	// Instantiation of T flip flop
	tff tf0(.clk(clk), .rst(rst), .t(1'b1), .q_bar(q_bar[0]), .q(q[0]));       
	tff tf1(.clk(q_bar[0]), .rst(rst), .t(1'b1), .q_bar(q_bar[1]), .q(q[1]));      // Posedge q_bar = clk of next Flip flop
	tff tf2(.clk(q_bar[1]), .rst(rst), .t(1'b1), .q_bar(q_bar[2]), .q(q[2]));
	tff tf3(.clk(q_bar[2]), .rst(rst), .t(1'b1), .q_bar(q_bar[3]), .q(q[3]));

endmodule
