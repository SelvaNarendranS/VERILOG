// N bit Asynchronous down - counter or ripple counter

// T Flip flop

module tff( 
input clk, rst, t,
output reg q,
output q_bar);

	always @(negedge clk or negedge rst)
	begin
	   if(rst) // rst = active high reset
		q <= 1'b0;
	   else 
	   begin
	     if(t) 
		q <= ~q; // toggle
	     else 
		q <= q;  // no change
	   end  
	end
	assign q_bar = ~q;

endmodule 


module asy_dncnt#(parameter N = 6)(
input clk, rst,
output [N-1:0]q);

wire [N-1:0]q_bar;

	// Instantiation of T flip flop
	tff tf0(.clk(clk), .rst(rst), .t(1'b1), .q_bar(q_bar[0]), .q(q[0]));

	genvar i;
	generate 
		for(i = 1; i < N; i = i+1) begin : tf	
	tff t_inst(.clk(q[i-1]), .rst(rst), .t(1'b1), .q_bar(q_bar[i]), .q(q[i]));      // Posedge q = clk of next Flip flop
		end
	endgenerate

endmodule
