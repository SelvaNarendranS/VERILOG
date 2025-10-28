// N bit Asynchronous up - counter or ripple counter D flip flop 

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

module asy_upcnt#(parameter N = 4)(
input clk, rst,
output [N-1:0]q);

wire [N-1:0]q_bar;

	// Instantiation of D flip flop
	dff df0(.clk(clk), .rst(rst), .d(q_bar[0]), .q_bar(q_bar[0]), .q(q[0]));

	genvar i;
	generate 
		for(i = 1; i < N; i = i+1) begin : tf	
	dff t_inst(.clk(q_bar[i-1]), .rst(rst), .d(q_bar[i]), .q_bar(q_bar[i]), .q(q[i]));      // negedge q_bar = clk of next Flip flop
		end
	endgenerate

endmodule
