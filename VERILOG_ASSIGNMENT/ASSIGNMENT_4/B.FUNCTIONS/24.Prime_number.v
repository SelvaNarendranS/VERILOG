// Implement a function to return 1 if input is a prime number, else 0.

module Prime_number;
	reg [7:0]in;
	wire out;

	assign out = prime(in); // function call

	initial begin
		in = 8'd23;
		#2 $display("Time = %0t | in = %d | out = %0s", $time, in, ((out) ? "Prime number" : "Not a Prime Number"));
		#2 $finish;
	end


// Function definition
function automatic prime;
	input integer a;
	integer i;
	reg temp;
	begin
		if(a < 2)
			prime = 0;
		else begin
			temp = 0;
			for(i = 2; i <= a/2; i++) begin
				if(a % i == 0)
					temp = 1;
			end
		prime = (temp == 0);
		end
	end
endfunction
endmodule


