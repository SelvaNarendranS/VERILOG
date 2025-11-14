// Write a recursive function to compute factorial using automatic.

module factorial_recursive;
	reg [7:0]in;
	wire [15:0]out;

	assign out = factorial(in); // function call

	initial begin
		in = 8'd7;
		$monitor("Time = %0t | in = %d | out = %d", $time, in, out);
		#2 $finish;
	end


// Function automatic definition
function automatic [15:0]factorial;
	input integer a;
	begin
		if(a == 0 | a == 1)
			factorial = 1;
	      	else
			factorial = a * factorial(a - 1); // recursive call
	end
endfunction
endmodule

