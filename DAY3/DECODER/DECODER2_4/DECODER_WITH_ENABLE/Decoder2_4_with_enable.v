// 2:4 decoder Behavioral model

module decoder2_4_with_enable (
input [1:0]a,
input enable,
output reg [3:0]b);

	always @(*) begin

		if(enable) begin

		case(a)
		2'b00: b = 4'b0001;
        	2'b01: b = 4'b0010;
        	2'b10: b = 4'b0100;
        	2'b11: b = 4'b1000;
		default: b = 4'b0000;
		endcase
		end

		else begin
		b = 4'b0000; end
	end

endmodule 
	
