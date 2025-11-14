// Write a function that checks if the input is power of 2.

module power_two;
	reg [7:0]a;
	wire out;
	
	assign out = power_2(a); // Function call

	initial begin
		a = 8'd64;		 
		#2 $display("time = %0t | a = %d | Power = %d",$time, a, out);

		a = 8'd24;		 
		#2 $display("time = %0t | a = %d | Power = %d",$time, a, out);

	end

// Function definition
function power_2;
	input [7:0]a;

	begin
		 power_2 = ((a != 0) && ((a & (a-1))== 0)) ? 1'b1 : 1'b0;
	end
endfunction

endmodule	



