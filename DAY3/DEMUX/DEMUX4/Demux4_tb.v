// 1:4 MUX testbench

`timescale 1ns/1ps

module demux4_tb;
wire [3:0]b;
reg a;
reg [1:0]select_line;

	// Instantiation
	demux4 m2( .a(a), .select_line(select_line), .b(b));

	initial begin

	$monitor("Time = %0t, a = %b, select line = %b, b[0] = %b, b[1] = %b, b[2] = %b, b[3] = %b", $time, a, select_line, b[0], b[1], b[2], b[3]);
	$dumpfile("demux4_dump.vcd");
	$dumpvars;

	// Conditions

	a = 0; select_line = 2'b00;  #5
	a = 1; select_line = 2'b01;  #5
	a = 0; select_line = 2'b10;  #5
	a = 1; select_line = 2'b11;  #5

	$finish;
	end

endmodule;
