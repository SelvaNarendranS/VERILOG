// Implement a function that shifts input right by n bits.

module shift_right;
	parameter N = 4;
	reg [N-1:0]a;
	reg [3:0]n;
	wire [N-1:0]out;
	
	assign out = shift_r(a, n); // Function call

	initial begin
		a = 4'd15; n = 4'd3;		 
		#2 $display("time = %0t | a = %b | n = %d | shift right = %b",$time, a, n, out);
		#10 $finish;
	end

// Function definition
function [N-1:0]shift_r;
	input [N-1:0]a;
	input [3:0]n;
	reg [N-1:0]temp;
	integer i;
	begin
		temp = a;
		for(i = 0; i < n; i++) begin  
		temp = {1'b0,temp[N-1:1]};
		end
	shift_r = temp;
	end
endfunction

endmodule