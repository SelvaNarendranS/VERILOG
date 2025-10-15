// 1 bit comparator Test bench

`timescale 1ns/1ps

module comparator_tb;
wire greater, equal, less;
reg a, b;

	// Instantation
	comparator c1b(.a(a), .b(b), .greater(greater), .equal(equal), .less(less));

	initial begin

	$monitor("a = %b | b = %b | A Greater B = %b | A Equal B = %b | A Less B = %b | Time = %0t",a, b, greater, equal, less, $time);
	$dumpfile("comparator_dump.vcd");
	$dumpvars;

	// Test values (simule generator)

	a = 0; b = 0; #5
        a = 0; b = 1; #5
        a = 1; b = 0; #5
        a = 1; b = 1; #5
	
	$finish;
	end

endmodule
