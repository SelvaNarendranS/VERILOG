// Design a testbench using a task to apply input patterns to a 4-bit adder.

`timescale 1ns/1ps

module full_adder_tb;
wire [4:0]sum; 
reg [3:0]a, b;
reg c;

	//instantiation
	full_adder uub(
	.sum(sum),
	.a(a), 
	.b(b),
	.c(c));

	// combinations
	task test_case;
		output [3:0]a, b;
		output c;
		begin 
			a = $random;
			b = $random;
			c = $random; #2;
			end
	endtask

	initial begin 
		a = 4'b0; b = 4'b0; c = 4'b0;
		$monitor("Time = %0t | a = %b(%d) | b = %b(%d) | c = %b(%d) | sum = %b(%d)", $time, a, a, b, b, c, c, sum, sum);
		for (integer i = 1; i <= 10; i = i + 1) begin
			test_case(a, b, c);
		end
	#11 $finish;
	end
endmodule

// Full adder design
module full_adder( 
	input [3:0]a, b, 
	input c, 
	output [4:0]sum);

	assign sum = a + b + c;

endmodule

