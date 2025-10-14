// 4:2 encoder Testbench

`timescale 1ns/1ps

module encoder4_2_tb;
wire [1:0]b;
reg [3:0]a;

	// instantation 
	encoder4_2 neco(.a(a), .b(b));

	initial begin
	
	$monitor("Time = %0t | a = %b |  b = %b ", $time, a, b,);
	$dumpfile("encoder4_2_dump.vcd");
	$dumpvars;

	// conditions
	a = 4'b0001; #5
        a = 4'b0010; #5
        a = 4'b0100; #5
        a = 4'b1000; #5

	$finish;
	end

endmodule

