// Behavioral model

module binary_to_7segment(
input [3:0]a,
output reg [7:0]b);

	always @(*) begin
		b = 8'b00000000;

		case(a)      //abcdefgdt
		4'b0000: b = 8'b11111100;  // 0  lsb equal to dot rest bits is for 7 segment
        	4'b0001: b = 8'b01100000;  // 1
        	4'b0010: b = 8'b11011010;  // 2
        	4'b0011: b = 8'b11110010;  // 3
		4'b0100: b = 8'b01100110;  // 4
        	4'b0101: b = 8'b10110110;  // 5
        	4'b0110: b = 8'b10111110;  // 6
        	4'b0111: b = 8'b11100000;  // 7
        	4'b1000: b = 8'b11111110;  // 8
        	4'b1001: b = 8'b11100110;  // 9
        	4'b1010: b = 8'b11101110;  // A
        	4'b1011: b = 8'b00111110;  // B
		4'b1100: b = 8'b10011100;  // C
        	4'b1101: b = 8'b01111010;  // D
        	4'b1110: b = 8'b10011110;  // E
        	4'b1111: b = 8'b10001110;  // F
		default: b = 8'b00000000;
		endcase
	end

endmodule 
	
