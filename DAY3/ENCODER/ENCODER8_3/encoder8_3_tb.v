// 8:3 decoder Testbench

`timescale 1ns/1ps

module decoder8_3_tb;
wire [2:0]b;
reg [7:0]a;

	// instantation 
	decoder8_3 enco(.a(a), .b(b));

	initial begin
	
	$monitor("Time = %0t | a = %b |  b = %b ", $time, a, b,);
	$dumpfile("encoder8_3_dump.vcd");
	$dumpvars;

	// conditions
	a = 8'b00000001; #5
        a = 8'b00000010; #5
        a = 8'b00000100; #5
        a = 8'b00001000; #5
	a = 8'b00010000; #5
        a = 8'b00100000; #5
        a = 8'b01000000; #5
        a = 8'b10000000; #5

	$finish;
	end

endmodule
