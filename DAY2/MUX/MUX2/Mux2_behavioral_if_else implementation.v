// Behavioral level Modelling  if - else implementation 

module mux2(
input [1:0]a,
input select_line, 
output reg b);

	always@(*) begin
	   if (select_line) 
		b = a[1];
	   else 
		b = a[0];
	end

endmodule
