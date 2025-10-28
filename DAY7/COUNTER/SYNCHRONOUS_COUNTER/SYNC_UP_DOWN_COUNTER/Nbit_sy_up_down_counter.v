// N bit synchronous up/down counter 

module sy_up_dncnt #(parameter N = 4)(
input clk, rst, enable, up_count, down_count,
output reg [N-1:0]q);

	always @(posedge clk) begin    // For synchronous reset only applied at clockedge on Q
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
