// N bit synchronous down counter 

module sy_dncnt #(parameter N = 4)(
input clk, rst, enable,
output reg [N-1:0]q);

	always @(posedge clk) begin    // For synchronous reset only applied at clockedge on Q
		if(rst)
			q <= {N{1'b1}};
		else if (enable)
			q <= q - 1'b1;
	end

endmodule
