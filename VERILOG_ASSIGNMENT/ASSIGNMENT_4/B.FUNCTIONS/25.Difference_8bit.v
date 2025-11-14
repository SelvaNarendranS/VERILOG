// Create a function that returns the difference of two inputs.

module subract_8bit;
	reg [7:0]a, b;
	wire signed [7:0]difference;
	
	assign difference = subraction(a, b); // Function call

	initial begin
		a = 8'd42; b = 8'd64;
		#2 $display("time = %0t | a = %d | b = %d | Difference = %d",$time, a, b, difference);
	end

// Function definition
function signed [7:0]subraction;
	input [7:0]x, y;
		
	begin
		subraction = x - y;
	end
endfunction

endmodule	



