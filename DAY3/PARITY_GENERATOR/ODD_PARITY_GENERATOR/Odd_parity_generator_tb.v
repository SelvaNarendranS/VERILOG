// Test bench

`timescale 1ns/1ps

module odd_parity_generator_tb;
reg [3:0]a;
wire b;
wire [4:0]generated;

	// intantation
	odd_parity_generator opg(.a(a), .b(b), .generated(generated));	

	initial begin

	$monitor("Time = %0t | a = %b | b = %b | Generated = %b ", $time, a, b,generated);
	$dumpfile("odd_parity_generator_dump");
	$dumpvars;

	//conditions
	a = 4'b0000; #5
	a = 4'b0010; #5
	a = 4'b0011; #5
	a = 4'b0111; #5
	a = 4'b1111; #5
	
	$finish;
	end

endmodule
