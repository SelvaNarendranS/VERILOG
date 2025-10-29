// N bit synchronous Johnson counter 

module sy_johnsoncnt #(parameter N = 4)(
input clk, rst, enable,
output reg [N-1:0]q);

	always @(posedge clk) begin    // For synchronous reset only applied at clockedge on Q
		if(rst)
			q <= {N{1'b0}};
		else if (enable)
			q <= {~q[0],q[N-1:1]};
	end

endmodule
