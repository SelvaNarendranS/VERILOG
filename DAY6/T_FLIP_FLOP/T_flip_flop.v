// Behavioral model

// T Flip flop

module tff( 
input clk, rst, t,
output reg q,
output q_bar);

	always @(posedge clk or posedge rst)
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