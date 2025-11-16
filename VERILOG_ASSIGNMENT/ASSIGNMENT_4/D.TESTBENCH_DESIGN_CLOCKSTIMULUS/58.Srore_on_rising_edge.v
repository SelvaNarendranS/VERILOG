// Simulate a register that updates on the rising edge of the clock.

// Test bench

`timescale 1ns/1ps

module dff_tb;
wire [3:0]q, q_bar;
reg rst, clk;
reg [3:0]d;
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
	$dumpfile("Dff_dump.vcd");
	$dumpvars;

	// initialize values

	rst <= 1; 
	d <= 0; #5;

	#10 rst <= 0; // Deassert reset

	repeat(10)begin
	d = $random; #2;
	end

	// recheck 

		#6 d <= 4'b1; #5;
 
	#20 $finish;
	end

endmodule
	

// Behavioral model

// D Flip flop

module dff( 
input clk, rst,
input [3:0]d,
output reg [3:0]q,
output [3:0]q_bar);

	always @(posedge clk or posedge rst)
	begin
	   if(rst) // rst = active high reset
		q <= 1'b0;
	   else
		q <= d;
	end
	assign q_bar = ~q;

endmodule 
