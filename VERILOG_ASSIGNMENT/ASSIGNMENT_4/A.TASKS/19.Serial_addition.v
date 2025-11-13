// Develop a task to perform serial addition (bit-by-bit) for two 4-bit numbers.

module serial_add;
	reg [3:0]a, b;
	reg [4:0]sum;

	initial begin
		a = 4'd10; b = 4'd5;
		bit_addition(a, b, sum);  // Task call
		#10 $finish;
	end

// Task definition
task bit_addition;
	input [3:0]x, y;
	output [4:0]add;
	reg carry;
	reg [3:0]sum;
	integer i;
		
	begin
		carry = 0;
		for(i = 0; i < 4; i++) begin
			sum[i] = x[i] ^ y[i] ^ carry;
			carry = ((x[i] & y[i]) | (x[i] & carry) | (y[i] & carry));
			#1;
		end
		add = {carry, sum[3:0]};
		$display("time = %0t | a = %d | b = %d | sum = %d",$time, x, y, add);
	end
endtask

endmodule	


