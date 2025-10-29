// 4 bit synchronous Binary coded decimal up counter 

module sy_BCD_upcnt(  
input clk, rst, enable,
output reg [7:0]q);

reg [3:0]ones, tens;

	always @(posedge clk) begin    // For synchronous reset only applied at clockedge on Q
		if(rst) begin
			ones <= 4'd0;
			tens <= 4'd0;
		end
		else if (enable) begin
			if(ones == 4'd9) begin
				ones <= 1'd0;
				if(tens == 4'd9)
					tens <= 1'b0;
				else
					tens <= tens + 1;
			end
			else
				ones <= ones + 1;	
		end
	end

	always @(*) begin 
		q = {tens, ones};
	end

endmodule
