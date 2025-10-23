// Behavioral model

// SR Flip flop

module srff( 
input clk, rst, s, r,
output reg q,
output q_bar);

	always @(posedge clk or posedge rst)
	begin
	   if(rst) // rst = active high reset
		q <= 1'b0;
	   else 
	   begin
	     case({s, r}) 
		2'b00 : q <= q;      // no change
		2'b01 : q <= 1'b0;   // Reset
		2'b10 : q <= 1'b1;   // set
		2'b11 : q <= 1'bx;   // not defined
		endcase
	    end		
		
	end
	assign q_bar = ~q;

endmodule 