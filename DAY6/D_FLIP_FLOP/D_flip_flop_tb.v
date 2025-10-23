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

	/*  another method
	// test cases	
	for(i = 0; i < 16; i++) begin
		if(i < 3) begin
		   @(posedge clk);
		   #2 d <= $random % 2; #4;
		   end
		else begin
		   @(posedge clk);
		   #2 d <= $random % 2; #4;
		   end
	end
	*/
	repeat(30)begin
	d = $random; #2;
	end

	// recheck 

		#6 d <= 1'b1; #5;
 
	#20 $finish;
	end

endmodule
	
