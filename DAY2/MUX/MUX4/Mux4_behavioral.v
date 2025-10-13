// Behavioral level Modelling

module mux4(
input [3:0]a,
input [1:0]select_line,
output reg b);

	always@(*) begin
	
		case(select_line)
	
		2'b00 : b = a[3];
		2'b01 : b = a[2];
		2'b10 : b = a[1];
		2'b11 : b = a[0];
		default : b = 2'b00;
	
		endcase
	end

endmodule
