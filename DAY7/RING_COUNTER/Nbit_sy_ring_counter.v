// N bit synchronous ring counter 

module sy_ringcnt #(parameter N = 4)(
input clk, rst, enable,
output reg [N-1:0]q);

	always @(posedge clk) begin    // For synchronous reset only applied at clockedge on Q
		if(rst)
			q <= {N{1'b0}};
		else if (enable) begin
			q <= q + 1'b1;
			if(q == ((2**N)-1))
				q <= {N{1'b0}};
			end
	end

endmodule
