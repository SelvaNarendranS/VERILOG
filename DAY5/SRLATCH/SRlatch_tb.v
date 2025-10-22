// Test bench

`timescale 1ns/1ps

module srlatch_tb;
wire q;
reg rst, en, s, r;
integer i;

	// instantiation 
	srlatch sr0 (.rst(rst), .en(en), .s(s), .r(r), .q(q));

	initial begin

	$monitor("Time = %0t | reset = %b | enable = %b | S = %b | R = %b | Q = %b ", $time, rst, en, s, r, q);
	$dumpfile("SRlatch_dump.vcd");
	$dumpvars;

	// initialize

	s <= 0;
	r <= 0;
	rst <= 0;
	en <= 0;

	#10 rst <= 1; // Deassert reset

	// test case

	for(i = 0; i < 16; i++) begin
	   if(i < 3) begin
		en <= 0;
		{s,r} <= $random % 4; #5;
	   end
	   else begin
		en <= 1;
		{s,r} <= $random % 4; #5;
	   end
	end

	// recheck at enable 0

		en = 0;
		{s, r} = 2'b00; #5;


	#10  $finish;
	end

endmodule		

