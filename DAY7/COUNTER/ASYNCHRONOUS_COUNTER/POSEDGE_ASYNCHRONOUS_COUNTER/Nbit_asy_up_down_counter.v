// N bit asynchronous up/down counter 

module asy_up_dncnt #(parameter N = 4)(
input clk, rst, enable, up_count, down_count,
output reg [N-1:0]q);

	always @(posedge clk or posedge rst) begin    // For asynchronous reset applied immediately to Q
		if(rst)
			q <= {N{1'b0}};
		else if (enable) begin
			if(up_count)
				q <= q + 1'b1;
			else if(down_count)
				q <= q - 1'b1;
		end
	end

endmodule
