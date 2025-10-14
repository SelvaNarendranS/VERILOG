// 2:1 MUX testbench

`timescale 1ns/1ps

module demux2_tb;
wire [1:0]b;
reg a;
reg select_line;

	// Instantiation
	demux2 m2( .a(a), .select_line(select_line), .b(b));

	initial begin

	$monitor("Time = %0t, a = %b, select line = %b, b[0] = %b, b[1] = %b", $time, a, select_line, b[0], b[1]);
	$dumpfile("demux2_dump.vcd");
	$dumpvars;

	// Conditions

	a = 0; select_line = 0;  #5
	a = 1; select_line = 0;  #5
	a = 0; select_line = 1;  #5
	a = 1; select_line = 1;  #5

	$finish;
	end

endmodule;
