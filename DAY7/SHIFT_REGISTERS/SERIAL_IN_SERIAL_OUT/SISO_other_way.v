// N bit Serial in serial out shift register using always block without instantiation

module siso #(parameter N = 4)(
input clk, rst, enable, a,
output reg f);

reg [N-1:0]shift_reg;

	always @(posedge clk or posedge rst) begin
		if(rst) begin
			f <= 1'b0;
			shift_reg <= 0;
		end
		else if(enable) begin
			shift_reg <= {shift_reg[N-2:0],a};  // shift left & new bit in LSB
			f <= shift_reg[N-1];
		end
	end

endmodule	
