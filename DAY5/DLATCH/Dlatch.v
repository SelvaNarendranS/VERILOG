// Behavioral Model

module dlatch(
input en, d, rst, // en == clock
output reg q);

	always @(en or d or rst)
	begin
		if(!rst)
		   q <= 0;
		else
			if(en) 
			   q <= d;
	end

endmodule 