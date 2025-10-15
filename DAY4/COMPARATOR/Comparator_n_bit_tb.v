// N bit comparator Test bench

`timescale 1ns/1ps

module comparator_tb;
wire greater, equal, less;
reg [`SIZE-1:0]a, b;

	// Instantation
	comparator c1b(.a(a), .b(b), .greater(greater), .equal(equal), .less(less));

	integer max = `SIZE, min = 0;
	integer i;

	initial begin

	$monitor("a = %b | b = %b | A Greater B = %b | A Equal B = %b | A Less B = %b | Time = %0t",a, b, greater, equal, less, $time);
	$dumpfile("comparator_dump.vcd");
	$dumpvars;

	// Test values (simule generator)

	for(integer i = 0; i < 10 ; i++) begin
	a = ($random % (max - min + 1)) + min;
	b = ($random % (max - min + 1)) + min; #5;	
	end
	
	$finish;
	end

endmodule
