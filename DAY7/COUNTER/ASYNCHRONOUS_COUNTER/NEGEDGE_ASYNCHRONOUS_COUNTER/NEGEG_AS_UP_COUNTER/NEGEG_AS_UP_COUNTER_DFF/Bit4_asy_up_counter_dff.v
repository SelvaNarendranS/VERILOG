// 4 bit Asynchronous up - counter or ripple counter

// D Flip flop

module dff( 
input clk, d, rst,
output reg q,
output q_bar);

	always @(negedge clk or negedge rst)
	begin
	   if(rst) // rst = active high reset
		q <= 1'b0;
	   else
		q <= d;
	end
	assign q_bar = ~q;

endmodule

module asy_upcnt(
input clk, rst,
output [3:0]q);

wire [3:0]q_bar;

	// Instantiation of D flip flop
	dff df0(.clk(clk), .rst(rst), .d(q_bar[0]), .q_bar(q_bar[0]), .q(q[0]));       
	dff df1(.clk(q_bar[0]), .rst(rst), .d(q_bar[1]), .q_bar(q_bar[1]), .q(q[1]));      // Negedge q_bar = clk of next Flip flop
	dff df2(.clk(q_bar[1]), .rst(rst), .d(q_bar[2]), .q_bar(q_bar[2]), .q(q[2]));
	dff df3(.clk(q_bar[2]), .rst(rst), .d(q_bar[3]), .q_bar(q_bar[3]), .q(q[3]));

endmodule
