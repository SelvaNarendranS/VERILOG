// Write a testbench for a D Flip-Flop with asynchronous reset.

`timescale 1ns/1ps

module dff_tb;
wire q, q_bar;
reg rst, d, clk;
integer i;


	// instantiation 
	dff dff0(.rst(rst), .clk(clk), .d(d), .q(q), .q_bar(q_bar));

	// Clock generation
	initial begin
	  clk = 0;
	  forever #5 clk = ~clk;
	end 

	always @(posedge clk) begin
		$display	("Time = %0t | reset = %b | clk = %b | D = %b | Q = %b | Q bar = %b ", $time, rst, clk, d, q, q_bar);
	end

	initial begin
	$dumpfile("Dff_dump.vcd");
	$dumpvars;

	// initialize values

	rst <= 1; 
	d <= 0; #5;

	#10 rst <= 0; // Deassert reset

	repeat(10)begin
		d = 0; #4;
		d = 1; #4;
	end

	// recheck 

		#6 d <= 1'b1; #5;
 
	#20 $finish;
	end

endmodule

// D Flip flop --- design

module dff( 
input clk, d, rst,
output reg q,
output q_bar);

	always @(posedge clk or posedge rst)
	begin
	   if(rst) // rst = active high reset
		q <= 1'b0;
	   else
		q <= d;
	end
	assign q_bar = ~q;

endmodule 