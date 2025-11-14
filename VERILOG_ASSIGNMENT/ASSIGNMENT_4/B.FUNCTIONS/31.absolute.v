// Write a function to compute the absolute value of a signed input.

module absolute_8bit;
	reg signed[7:0]a;
	wire signed [7:0]out;
	
	assign out = absolute(a); // Function call

	initial begin
		a = -8'd42;
		#2 $display("time = %0t | a = %d | Absolute value = %d",$time, a, out);

		a = 8'd84;
		#2 $display("time = %0t | a = %d | Absolute value = %d",$time, a, out);
		#1 $finish;
	end

// Function definition
function signed [7:0]absolute;
	input signed [7:0]x;
		
	begin
		if(x < 0)
			absolute = -x;
		else
			absolute = x;
	end
endfunction

endmodule	



