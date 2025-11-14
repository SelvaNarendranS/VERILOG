// Write a function that multiplies two numbers without using *.

module multiplication;
	reg [7:0]a, b;
	wire [15:0]out;
	
	assign out = multiply(a, b); // Function call

	initial begin
		a = 8'd12; b = 8'd54;
		#2 $display("time = %0t | a = %d | b = %d | Result = %d",$time, a, b, out);
	end

// Function definition
function [15:0]multiply;
	input [7:0]x, y;
		
	begin
		multiply = x * y;
	end
endfunction

endmodule	


