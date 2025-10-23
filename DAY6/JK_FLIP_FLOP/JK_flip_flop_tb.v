// Test bench

`timescale 1ns/1ps

module jkff_tb;
wire q, q_bar;
reg rst, j, k, clk;


	// instantiation 
	jkff jkff0(.rst(rst), .clk(clk), .j(j), .k(k), .q(q), .q_bar(q_bar));

	// Clock generation
	initial begin
	  clk = 0;
	  forever #10 clk = ~clk;
	end 

	initial begin
	
	$monitor("Time = %0t | reset = %b | clk = %b | J = %b | K = %b | Q = %b | Q bar = %b ", $time, rst, clk, j, k, q, q_bar);
	$dumpfile("JK_flip_flop_dump.vcd");
	$dumpvars;

	// initialize values

	rst = 1; 
	clk = 0;
	{j, k} = 2'b00; #5;

	rst = 0; #5; // Deassert reset

	// test case
	repeat(30) 
	begin
	j <= $random;
	k <= $random; #6;
	end

	#11 $finish; 
	end

endmodule
	
