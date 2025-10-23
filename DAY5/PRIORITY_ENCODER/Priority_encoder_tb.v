// 4:2 priority encoder Testbench

`timescale 1ns/1ps

module priority_encoder4_2_tb;
wire [1:0]b;
wire v;
reg enable;
reg [3:0]a;

	// instantation 
	priority_encoder4_2 uut(.a(a), .b(b), .v(v), .enable(enable));

	initial begin
	
	$monitor("Time = %0t | enable = %b | a = %b |  b = %b | v = %b ", $time, enable, a, b, v);
	$dumpfile("Priorty_encoder_dump.vcd");
	$dumpvars;

	// conditions
	enable = 0; a = 4'b0000; #5;  // Disabled condition
    	enable = 1; a = 4'b0000; #5;  // No valid input
	a = 4'b0001; #5
        a = 4'b0010; #5
        a = 4'b0100; #5
        a = 4'b1000; #5
        a = 4'b0110; #5
        a = 4'b1110; #5

	enable = 0; #5 // final disable

	$finish;
	end

endmodule

