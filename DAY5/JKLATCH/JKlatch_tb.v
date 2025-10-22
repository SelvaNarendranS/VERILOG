// Test bench

`timescale 1ns/1ps

module jklatch_tb;
wire q;
reg rst, en, j, k;
integer i;

	// instantiation 
	jklatch jk0 (.rst(rst), .en(en), .j(j), .k(k), .q(q));

	initial begin

	$monitor("Time = %0t | reset = %b | enable = %b | J = %b | K = %b | Q = %b ", $time, rst, en, j, k, q);
	$dumpfile("JKlatch_dump.vcd");
	$dumpvars;

	// initialize

	j <= 0;
	k <= 0;
	rst <= 0;
	en <= 0;

	#10 rst <= 1; // Deassert reset

	// test case

	for(i = 0; i < 16; i++) begin
	   if(i < 3) begin
		en <= 0;
		{j,k} <= $random % 4; #5;
	   end
	   else begin
		en <= 1;
		{j,k} <= $random % 4; #5;
	   end
	end

	// recheck at enable 0

		en = 0;
		{j, k} = 2'b00; #5;


	#10  $finish;
	end

endmodule
