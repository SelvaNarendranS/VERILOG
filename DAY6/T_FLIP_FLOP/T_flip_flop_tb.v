// Test bench

`timescale 1ns/1ps

module tff_tb;
wire q, q_bar;
reg rst, t, clk;


	// instantiation 
	tff tff0(.rst(rst), .clk(clk), .t(t), .q(q), .q_bar(q_bar));

	// Clock generation
	initial begin
	  clk = 0;
	  forever #10 clk = ~clk;
	end 

	initial begin
	
	$monitor("Time = %0t | reset = %b | clk = %b | T = %b | Q = %b | Q bar = %b ", $time, rst, clk, t, q, q_bar);
	$dumpfile("t_flip_flop_dump.vcd");
	$dumpvars;

	// initialize values

	rst = 1; 
	clk = 0;
	t = 0; #5;

	#10 rst = 0; // Deassert reset

	// test case
	#14 t = 0;
	#16 t = 1;
	#22 t = 1;
	#32 t = 0;
	#15 t = 1;

 
	#11 $finish;
	end

endmodule
	
