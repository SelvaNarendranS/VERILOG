// Create a function that returns the XOR of all bits of an input (odd parity).

module odd_parity;
	reg [7:0]a;
	wire odd;   
	
	assign odd = parity(a); // Function call

	initial begin
		a = 8'd37;
		#2 $display("time = %0t | a = %b(%d) | odd parity = %d",$time, a, a, odd);
	end

// Function definition
function [7:0]parity;   //  odd parity generation  
	input [7:0]x;
		
	begin
		parity = ~(^x);   // 00100101( 37)  ans = 1
	end
endfunction

endmodule	



