// Behavioral level Modelling

module demux2(
input a,
input select_line, 
output reg [1:0]b);

	always@(*) begin

		b = 2'b00;	
		case(select_line)
	
		1'b0 : b[0] = a;
		1'b1 : b[1] = a;
		default : b = 1'b0;
	
		endcase
	end

endmodule
