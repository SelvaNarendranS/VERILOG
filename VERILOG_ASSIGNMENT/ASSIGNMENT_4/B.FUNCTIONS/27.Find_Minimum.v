// Create a function that returns the minimum of two 8-bit values.

module minimum_8bit;
	reg [7:0]a, b;
	wire [7:0]min;
	
	assign min = minimum(a, b); // Function call

	initial begin
		a = 8'd62; b =8'd25;		 
		#2 $monitor("time = %0t | a = %d | b = %d | Minimum = %d",$time, a, b, min);
	end

// Function definition
function [7:0]minimum;
	input [7:0]x, y;

	begin
		 minimum = (x < y) ? x : y;
	end
endfunction

endmodule	



