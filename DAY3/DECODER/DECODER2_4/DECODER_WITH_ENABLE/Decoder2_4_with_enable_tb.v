// 2:4 decoder Testbench

`timescale 1ns/1ps

module decoder2_4_with_enable_tb;
wire [3:0]b;
reg enable;
reg [1:0]a;

	// instantation 
	decoder2_4_with_enable deco(.a(a), .b(b), .enable(enable));

	initial begin
	
	$monitor("Time = %0t | a = %b |  b = %b | enable = %b |( b[3] = %b | b[2] = %b | b[1] = %b | b[0] = %b )", $time, a, b, enable, b[3], b[2], b[1], b[0]);
	$dumpfile("decoder_with_enable_dump.vcd");
	$dumpvars;

	// conditions
	enable = 0; a = 2'b00; #5
        enable = 0; a = 2'b01; #5
        enable = 0; a = 2'b10; #5
        enable = 0; a = 2'b11; #5
	enable = 1; a = 2'b00; #5
        enable = 1; a = 2'b01; #5
        enable = 1; a = 2'b10; #5
        enable = 1; a = 2'b11; #5

	$finish;
	end

endmodule
