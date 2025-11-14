// Write a function that calculates the square of a number.

module square_8bit;
	reg [7:0]a;
	wire [16:0]square;
	
	assign square = sq(a); // Function call

	initial begin
		a = 8'd62;
		#2 $display("time = %0t | a = %d | square = %d",$time, a, square);
	end

// Function definition
function [16:0]sq;
	input [7:0]x;
		
	begin
		sq = x * x;
	end
endfunction

endmodule	



