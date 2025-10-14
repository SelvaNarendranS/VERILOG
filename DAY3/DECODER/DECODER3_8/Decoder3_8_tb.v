// 3:8 decoder Testbench

`timescale 1ns/1ps

module decoder3_8_tb;
wire [7:0]b;
reg [2:0]a;

	// instantation 
	decoder3_8 deco(.a(a), .b(b));

	initial begin
	
	$monitor("Time = %0t | a = %b |  b = %b |(b[7] = %b | b[6] = %b | b[5] = %b | b[4] = %b | b[3] = %b | b[2] = %b | b[1] = %b | b[0] = %b )", $time, a, b, b[7], b[6], b[5], b[4], b[3], b[2], b[1], b[0]);
	$dumpfile("decoder3_8_dump.vcd");
	$dumpvars;

	// conditions
	a = 3'b000; #5
        a = 3'b001; #5
        a = 3'b010; #5
        a = 3'b011; #5
	a = 3'b100; #5
        a = 3'b101; #5
        a = 3'b110; #5
        a = 3'b111; #5


	$finish;
	end

endmodule
