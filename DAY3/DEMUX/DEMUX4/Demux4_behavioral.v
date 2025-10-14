// Behavioral level Modelling

module demux4(
input a,
input [1:0]select_line,
output reg [3:0]b);

	always@(*) begin

		b = 4'b0000;	
		case(select_line)
	
		2'b00 : b[0] = a;
		2'b01 : b[1] = a;
		2'b10 : b[2] = a;
		2'b11 : b[3] = a;
		default : b = 1'b0;
	
		endcase
	end

endmodule
