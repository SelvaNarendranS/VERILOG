// Behavioral Model

module tlatch(
input en, t, rst, // en == clock
output reg q);

	always @(en or t or rst)
	begin
		if(!rst)
		   q <= 0;
		else if(en) begin
		   case(t) 
			1'b0 : q = q;   // no change
			1'b1 : q = ~q;  // toggle
		   endcase
		end
	end

endmodule 