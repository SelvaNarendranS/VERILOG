// N bit asynchronous up counter 

module asy_upcnt #(parameter N = 4)(
input clk, rst, enable,
output reg [N-1:0]q);

	always @(posedge clk or posedge rst) begin    // For asynchronous reset applied immediately to Q
		if(rst)
			q <= {N{1'b0}};
		else if (enable)
			q <= q + 1'b1;
	end

endmodule
