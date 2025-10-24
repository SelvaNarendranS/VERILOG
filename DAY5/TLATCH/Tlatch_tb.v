// Test bench

`timescale 1ns/1ps

module tlatch_tb;
wire q;
reg rst, en, t;
integer i;


	// instantiation 
	tlatch tl0(.rst(rst), .en(en), .t(t), .q(q));

	// clock generation
	initial en = 0;
	always #13 en = ~en;
	
	initial begin
	
	$monitor("Time = %0t | reset = %b | enable = %b | T = %b | Q = %b ", $time, rst, en, t, q);
	$dumpfile("Tlatch_dump.vcd");
	$dumpvars;

	// initialize values

	rst <= 0; 
	en <= 0;
	t <= 0;

	#10 rst <= 1; // Deassert reset

	// test cases	
	for(i = 0; i < 16; i++) begin
		if(i < 8) begin
		   en <= 0; 
		   t <= $random % 2; #5;
		   end
		else begin
		   en <= 1;
		   t <= $random % 2; #5;
		   end
	end

	// recheck at enable 0

		en <= 0;
		t <= 1'b1; #5;
 
	#10 $finish;
	end

endmodule
	

