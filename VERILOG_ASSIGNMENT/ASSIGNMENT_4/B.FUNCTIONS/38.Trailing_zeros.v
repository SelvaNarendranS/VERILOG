// Create a function that counts trailing zeros in a binary number.

module trailing_zeros;
	reg [4:0]a;
	wire [4:0]out;
	
	assign out = trailing(a); // Function call

	initial begin
		a = 5'd8;		 
		#2 $display("time = %0t | a = %b(%d) | trailing zeros = %d",$time, a, a, out);
		#10 $finish;
	end

// Function definition
function [4:0]trailing;
	input [4:0]a;
	integer i;
	begin : count_done
		trailing = 0;
		for(i = 0; i < 5; i++) begin
			if(a[i] == 0)
				trailing = trailing + 1;
			else
				disable count_done;
		end
	end
endfunction

endmodule