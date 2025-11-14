// Create a function that returns the number of 1’s in an 8-bit input.

module count_1s;
	reg [7:0]a;
	wire [3:0]out;   
	
	assign out = count(a); // Function call

	initial begin
		a = 8'd46;
		#2 $display("time = %0t | a = %b(%d) | Result = %d",$time, a, a, out);
	end

// Function definition
function [4:0]count;   
	input [7:0]x;
	reg [3:0]a;
	integer i;
	begin
		a = 0;
		for(i = 0; i < 8; i++) begin
			if(x[i]) 
				a = a + 1;	
		end 
	count = a;  
	end
endfunction

endmodule	




