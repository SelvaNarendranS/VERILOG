// Write a function that returns the Gray code of a 4-bit binary number.

module convert_gray_code;
	reg [4:0]a;
	wire [4:0]out;
	
	assign out = convert(a); // Function call

	initial begin
		a = 5'd8;		 
		#2 $display("time = %0t | a = %b(%d) | Gray code = %b",$time, a, a, out);
		#10 $finish;
	end

// Function definition
function [4:0]convert;
	input [4:0]a;
	begin 
		convert[4] = a[4];
		convert[3] = a[4] ^ a[3];
		convert[2] = a[3] ^ a[2];
		convert[1] = a[2] ^ a[1];
		convert[0] = a[1] ^ a[0];
		
	end
endfunction

endmodule
