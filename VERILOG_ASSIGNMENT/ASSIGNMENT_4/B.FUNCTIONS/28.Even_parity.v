// Implement a function to compute even parity using XOR.

module even_parity;
	reg [7:0]a;
	wire even;   
	
	assign even = parity(a); // Function call

	initial begin
		a = 8'd26;
		#2 $display("time = %0t | a = %b(%d) | even parity = %d",$time, a, a, even);
	end

// Function definition
function [7:0]parity;   //  even parity generation  
	input [7:0]x;
		
	begin
		parity = (^x);   
	end
endfunction

endmodule	




