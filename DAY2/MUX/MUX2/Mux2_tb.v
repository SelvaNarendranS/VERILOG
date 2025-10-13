// 2:1 MUX testbench

`timescale 1ns/1ps

module mux2_tb;
wire b;
reg [1:0]a;
reg select_line;

	// Instantiation
	mux2 m2( .a(a), .select_line(select_line), .b(b));

	initial begin

	$monitor("Time = %0t, a[0] = %b, a[1] = %b select line = %b, b = %b", $time, a[0], a[1], select_line, b);
	$dumpfile("mux2_dump.vcd");
	$dumpvars;

	// Conditions

	a = 2'b00; select_line = 0;  #5
	a = 2'b01; select_line = 0;  #5
	a = 2'b10; select_line = 1;  #5
	a = 2'b11; select_line = 1;  #5

	$finish;
	end

endmodule;
