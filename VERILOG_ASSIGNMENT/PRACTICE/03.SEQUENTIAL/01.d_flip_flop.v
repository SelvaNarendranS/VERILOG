// Behavioral model

// D Flip flop
// dut
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

// Test bench
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

	initial begin
	
	$monitor("Time = %0t | reset = %b | clk = %b | D = %b | Q = %b | Q bar = %b ", $time, rst, clk, d, q, q_bar);
	$dumpfile("Dff_dump.vcd");
	$dumpvars;

	// initialize values

	rst <= 1; 
	d <= 0; #12;

	rst <= 0; #3; 	// Deassert reset
      
      for(i=0; i < 11; i++) begin
        d = ~d;		#7;
      end

	// recheck
    d <= 1'b1; #6;
 
	#20 $finish;
	end

endmodule
	
