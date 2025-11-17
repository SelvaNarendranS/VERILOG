// Write a testbench for a blocking-assigned flip-flop—verify its output.

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
	  forever #10 clk = ~clk;
	end 

	initial begin
	
	$monitor("Time = %0t | reset = %b | clk = %b | D = %b | Q = %b | Q bar = %b ", $time, rst, clk, d, q, q_bar);

	// initialize values

	rst <= 1; 
	d <= 0; #5;

	#10 rst <= 0; // Deassert reset

	// test cases	
		d = 0; #2;
		d = 1; #2;
		d = 0; #2;
		d = 1; #2;
		d = 1; #2;
	end

	// recheck 
	#6 d <= 1'b1; #5;
 
	#20 $finish;
	end

endmodule
	

// D Flip flop design 
  
module dff( 
input clk, d, rst,
output reg q,
output q_bar);

	always @(posedge clk or posedge rst)
	begin
	   if(rst) // rst = active high reset
		q = 1'b0;
	   else
		q = d;
	end
	assign q_bar = ~q;

endmodule 