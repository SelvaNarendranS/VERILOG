//4 bit Universal shift registers 

module universal_sr(
input clk, rst, r_shift, l_shift,
input [1:0]control,
input [3:0]p_in,
output reg [3:0]p_out);

	always @(posedge clk or posedge rst) begin
		if(rst)
			p_out <= 4'b0000;
		else begin
			case(control)
				2'b00 : p_out <= p_out;			 //no change
			        2'b01 : p_out <= {r_shift, p_out[3:1]};  // right shift serial in
				2'b10 : p_out <= {p_out[2:0], l_shift};  // left shift serial in 
				2'b11 : p_out <= p_in;			// Parallel load
				default : p_out <= 1'bz;
			endcase
		end
	end
endmodule	
