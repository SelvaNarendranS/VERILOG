// Behavioral model

module decoder3_8 (
input [2:0]a,
output reg [7:0]b);

	always @(*) begin

		case(a)
		3'b000: b = 8'b00000001;
        	3'b001: b = 8'b00000010;
        	3'b010: b = 8'b00000100;
        	3'b011: b = 8'b00001000;
		3'b100: b = 8'b00010000;
        	3'b101: b = 8'b00100000;
        	3'b110: b = 8'b01000000;
        	3'b111: b = 8'b10000000;
		default b = 4'b0000;
		endcase
	end

endmodule 
	
