// Full subractor testbench

`timescale 1ns/1ps

module full_subractor_tb;
wire [3:0]difference;
wire bout;
reg [3:0]a, b;
reg bin;

wire signed [3:0]sub_output;

	//instantiation
	ripple_borrow_subractor rbs(
	.difference(difference),
        .bout(bout),
	.a(a), 
	.b(b),
	.bin(bin));

	assign sub_output = difference;

	initial begin
	
	$monitor("Time = %0t | a = %b(%0d) | b = %b(%0d) | bin = %b | difference = %b (%0d signed: %0d) | bout = %b", $time, a,a, b,b, bin, difference,difference,sub_output, bout);
	$dumpfile("ripple_borrow_subractor_dump.vcd");
	$dumpvars; 
		
	// combinations
	a = 4'b1101; b = 4'b1110; bin = 1'b0; #5
	a = 4'b1101; b = 4'b1110; bin = 1'b1; #5
	a = 4'b0101; b = 4'b1110; bin = 1'b1; #5
	a = 4'b1001; b = 4'b1010; bin = 1'b1; #5

	$finish; 
	end


endmodule


