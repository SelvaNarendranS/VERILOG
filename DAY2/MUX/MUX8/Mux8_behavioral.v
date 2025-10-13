// 8*1 Behavioral level Modelling

module mux8(
input [7:0]a,
input [2:0]select_line,
output reg b);

	always@(*) begin
	
		case(select_line)
	
		3'b000 : b = a[7];
		3'b001 : b = a[6];
		3'b010 : b = a[5];
		3'b011 : b = a[4];
		3'b100 : b = a[3];
		3'b101 : b = a[2];
		3'b110 : b = a[1];
		3'b111 : b = a[0];
		default : b = 1'b0;
	
		endcase
	end

endmodule
