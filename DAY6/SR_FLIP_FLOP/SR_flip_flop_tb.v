// Test bench

`timescale 1ns/1ps

module srff_tb;
wire q, q_bar;
reg rst, s, r, clk;


	// instantiation 
	srff srff0(.rst(rst), .clk(clk), .s(s), .r(r), .q(q), .q_bar(q_bar));

	// Clock generation
	initial begin
	  clk = 0;
	  forever #10 clk = ~clk;
	end 

	initial begin
	
	$monitor("Time = %0t | reset = %b | clk = %b | S = %b | R = %b | Q = %b | Q bar = %b ", $time, rst, clk, s, r, q, q_bar);
	$dumpfile("SR_flip_flop_dump.vcd");
	$dumpvars;

	// initialize values

	rst = 1; 
	clk = 0;
	{s, r} = 2'b00; #5;

	rst = 0; #5; // Deassert reset

	// test case
	repeat(30) 
	begin
	s <= $random;
	r <= $random; #3;
	end

	#11 $finish; 
	end

endmodule
	
