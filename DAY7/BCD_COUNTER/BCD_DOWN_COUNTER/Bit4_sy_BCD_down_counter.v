// 4 bit synchronous Binary coded decimal down counter 

module sy_BCD_dncnt(  
input clk, rst, enable,
output reg [7:0]q);

reg [3:0]ones, tens;

	always @(posedge clk) begin    // For synchronous reset only applied at clockedge on Q
		if(rst) begin
			ones <= 4'd9;
			tens <= 4'd9;
		end
		else if (enable) begin
			if(ones == 4'd0) begin
				ones <= 4'd9;
				if(tens == 4'd0)
					tens <= 4'd9;
				else
					tens <= tens - 1;
			end
			else
				ones <= ones - 1;	
		end
	end

	always @(*) begin 
		q = {tens, ones};
	end

endmodule
