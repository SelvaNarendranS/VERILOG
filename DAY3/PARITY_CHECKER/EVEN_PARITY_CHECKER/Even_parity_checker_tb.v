// Test bench

`timescale 1ns/1ps

module even_parity_checker_tb;
reg [4:0]a;
wire b;

	// intantation
	even_parity_checker epc(.a(a), .b(b));	 

	always @(a or b) begin
	if(b)
	   $monitor("Time = %0t | a = %b | b = %b - ERROR", $time, a, b);
	else 
	   $monitor("Time = %0t | a = %b | b = %b - NO ERROR", $time, a, b);
	end

	initial begin

	$dumpfile("even_parity_checker_dump");
	$dumpvars;

		//conditions
	
		for(integer i=0; i<2**5; i++) begin 
			a = i; 
			#5;
		end
		$finish;
	
	//$finish;
	end

endmodule