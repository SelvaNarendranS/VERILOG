// N bit Asynchronous up - counter or ripple counter

`include "../../../../../../DAY6/T_FLIP_FLOP/T_flip_flop.v"   // T Flip flop accessing

module asy_upcnt#(parameter N = 6)(
input clk, rst,
output [N-1:0]q);

wire [N-1:0]q_bar;

	// Instantiation of T flip flop
	tff tf0(.clk(clk), .rst(rst), .t(1'b1), .q_bar(q_bar[0]), .q(q[0]));

	genvar i;
	generate 
		for(i = 1; i < N; i = i+1) begin : tf	
	tff t_inst(.clk(q_bar[i-1]), .rst(rst), .t(1'b1), .q_bar(q_bar[i]), .q(q[i]));      // Posedge q_bar = clk of next Flip flop
		end
	endgenerate

endmodule
