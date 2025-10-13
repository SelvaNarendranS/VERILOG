// 8:1 MUX testbench

`timescale 1ns/1ps

module mux8_tb;
wire b;
reg [7:0]a;
reg [2:0]select_line;

	// Instantiation
	mux8 m8( .a(a), .select_line(select_line), .b(b));

	initial begin

	$monitor("Time = %0t, a = %b select line = %b, b = %b", $time, a, select_line, b);
	$dumpfile("mux8_dump.vcd");
	$dumpvars;

	// 48 - Conditions(only testing 8)

	a = 8'b10101010; 
	select_line = 3'b000;  #5 
	select_line = 3'b001;  #5 
	select_line = 3'b010;  #5 
	select_line = 3'b011;  #5
	select_line = 3'b100;  #5 
	select_line = 3'b101;  #5 
	select_line = 3'b110;  #5 
	select_line = 3'b111;  #5

	$finish;
	end

endmodule

