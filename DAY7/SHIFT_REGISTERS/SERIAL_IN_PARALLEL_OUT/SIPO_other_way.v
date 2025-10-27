// N bit Serial in parallel out shift register using always block without instantiation

module sipo #(parameter N = 4)(
input clk, rst, enable, a,
output reg [N-1:0]f);

	always @(posedge clk or posedge rst) begin
		if(rst)
			f <= 0;
		else if(enable)
			f <= {f[N-2:0],a};  
	end
endmodule	
