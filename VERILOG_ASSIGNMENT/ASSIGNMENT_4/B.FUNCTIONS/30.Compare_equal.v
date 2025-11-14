// Write a function to compare two inputs and return 1 if equal.

module compare_8bit;
	reg [7:0]a, b;
	wire equal;
	
	assign equal = same(a, b); // Function call

	initial begin
		a = 8'd12; b =8'd12;		 
		#2 $display("time = %0t | a = %d | b = %d | Equal = %d",$time, a, b, equal);

		a = 8'd15; b =8'd42;		 
		#2 $display("time = %0t | a = %d | b = %d | Equal = %d",$time, a, b, equal);

	end

// Function definition
function same;
	input [7:0]x, y;

	begin
		 same = (x == y) ? 1'b1 : 1'b0;
	end
endfunction

endmodule	



