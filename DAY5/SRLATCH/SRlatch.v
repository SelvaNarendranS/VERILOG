// Behavioral model 

module srlatch(
input s, r, rst, en, // en == clock
output reg q);

	always @(*) begin
	  if(!rst)
		q = 1'b0;
	  else if(en) begin
		case({s, r}) 
		  2'b00 : q = q;  // no change
		  2'b01 : q = 1'b0;  // reset
		  2'b10 : q = 1'b1;  // set
		  2'b11 : q = 1'bx;  // not defined
	        endcase
	   end
	end

endmodule