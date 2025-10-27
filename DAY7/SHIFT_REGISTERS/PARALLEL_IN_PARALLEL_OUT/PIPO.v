// N bit Parallel in Parallel out shift register using always block without instantiation

module pipo #(parameter N = 4)(
input clk, rst, 
input [N-1:0]a,
output reg [N-1:0]f);

	always @(posedge clk or posedge rst) begin
		if(rst)
			f <= 1'b0;
		else
			f <= a; 
	end
endmodule
