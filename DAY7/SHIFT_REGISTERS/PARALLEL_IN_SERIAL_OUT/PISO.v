// N bit Parallel in parallel out shift register using always block without instantiation

module pipo #(parameter N = 4 (
input clk, rst, control,
input [N-1:0]p_in,
output reg s_out);

	always @(posedge clk or posedge rst) begin
		if(rst)
			p_out <= 4'b0000;
		else begin
			case(control)
				1'b0 : s_out <= p_out;			  //no change
			        1'b1 : s_out <= {r_shift, p_out[N-1:1]};  // right shift serial in
				default : s_out <= 1'bz;
			endcase
		end
	end
endmodule	
	
