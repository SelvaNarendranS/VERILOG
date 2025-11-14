// Implement a function that calculates a^b using loop (a to the power b).

module square_8bit;
	reg [7:0]a, b;
	wire [50:0]square;
	
	assign square = sq(a, b); // Function call

	initial begin
		a = 8'd52; b= 8'd6;
		#2 $display("time = %0t | a = %d | b = %d | square = %0d",$time, a, b, square);
	end

// Function definition
function [50:0]sq;
	input [7:0]x, y;
	integer i;
	begin
		sq = 1;
		for(i = 0; i < y; i++) begin
			sq = sq * x;
		end 
	end
endfunction

endmodule	



