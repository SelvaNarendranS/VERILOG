// Behavioral level Modelling

module mux2(
input [1:0]a,
input select_line, 
output reg b);

	always@(*) begin
	
		case(select_line)
	
		1'b0 : b = a[0];
		1'b1 : b = a[1];
		default : b = 1'b0;
	
		endcase
	end

endmodule
