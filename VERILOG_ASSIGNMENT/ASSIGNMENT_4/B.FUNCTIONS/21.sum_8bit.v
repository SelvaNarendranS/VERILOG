// Write a function that returns the sum of two 8-bit inputs.

module add_8bit;
	reg [7:0]a, b;
	wire [8:0]sum;
	
	assign sum = addition(a, b); // Function call

	initial begin
		a = 8'd42; b = 8'd64;
		#2 $display("time = %0t | a = %d | b = %d | sum = %d",$time, a, b, sum);
	end

// Function definition
function [8:0]addition;
	input [7:0]x, y;
		
	begin
		addition = x + y;
	end
endfunction

endmodule	


