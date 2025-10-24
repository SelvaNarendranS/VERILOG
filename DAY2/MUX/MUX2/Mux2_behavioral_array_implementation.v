// Behavioral level Modelling  array index implementation 

module mux2(
input [1:0]a,
input select_line, 
output reg b);

	always@(*) begin
	    b = a[select_line];
	end

endmodule
