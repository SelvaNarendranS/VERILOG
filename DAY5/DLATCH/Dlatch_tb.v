// Test bench

`timescale 1ns/1ps

module dlatch_tb;
wire q;
reg rst, en, d;
integer i;


	// instantiation 
	dlatch dl0(.rst(rst), .en(en), .d(d), .q(q));

	// clock generation
	initial en = 0;
	always #13 en = ~en;
	
	initial begin
	
	$monitor("Time = %0t | reset = %b | enable = %b | D = %b | Q = %b ", $time, rst, en, d, q);
	$dumpfile("Dlatch_dump.vcd");
	$dumpvars;

	// initialize values

	rst <= 0; 
	en <= 0;
	d <= 0;

	#10 rst <= 1; // Deassert reset

	// test cases	
	for(i = 0; i < 16; i++) begin
		if(i < 8) begin
		   en <= 0; 
		   d <= $random % 2; #5;
		   end
		else begin
		   en <= 1;
		   d <= $random % 2; #5;
		   end
	end

	// recheck at enable 0

		en <= 0;
		d <= 1'b1; #5;
 
	#10 $finish;
	end

endmodule
	

