// negedge master slave configuration Test bench

`timescale 1ns/1ps

module nmsc_tb;
reg clk, master_d, rst;
wire q, q_bar;

	// instantiation 
	nmsc nmsc1(.clk(clk), .master_d(master_d), .rst(rst), .q(q), .q_bar(q_bar));

	// clock generation
	initial clk = 0;
	always #5 clk = ~clk;

	initial begin
	
	$monitor("Time = %0t | reset = %b | CLK = %b | D = %b | Q = %b | Q_bar = %b ", $time, rst, clk, master_d, q, q_bar);
	$dumpfile("nmsc_dump.vcd");
	$dumpvars;

	// initialize
	clk      <= 1; 
	rst      <= 0;
	master_d <= 0; #5;

	// initialize reset 
	rst      <= 1;
	master_d <= 0;

	#10 rst <= 0; // Deassert reset

	// test case

	repeat(30)
	begin 
	  master_d <= $random; #3;
	end

	// recheck at clk 1 
	rst      <= 0;
	master_d <= 1; #4;

	#2 $finish;
	end

endmodule