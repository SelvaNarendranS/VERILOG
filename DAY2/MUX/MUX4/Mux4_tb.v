// 4:1 MUX testbench

`timescale 1ns/1ps

module mux4_tb;
wire b;
reg [3:0]a;
reg [1:0]select_line;

	// Instantiation
	mux4 m2( .a(a), .select_line(select_line), .b(b));

	initial begin

	$monitor("Time = %0t, a = %b select line = %b, b = %b", $time, a, select_line, b);
	$dumpfile("mux4_dump.vcd");
	$dumpvars;

	// 16 - Conditions(only testing 4)

	a = 4'b1010; 
	select_line = 2'b00;  #5 
	select_line = 2'b01;  #5 
	select_line = 2'b10;  #5 
	select_line = 2'b11;  #5

	$finish;
	end

endmodule

