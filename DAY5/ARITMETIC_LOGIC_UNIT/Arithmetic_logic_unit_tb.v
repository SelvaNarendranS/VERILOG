// Test bench

// n bit Arithmetic and logic unit

`timescale 1ns/1ps

module alu_tb;
parameter N = 8;
reg [N-1:0]a, b;
reg [3:0]select;
wire [N-1:0]y;

	// instantiation 
	alu #(.N(N)) alu0 (.a(a), .b(b), .select(select), .result(y));
	

	initial begin

		$monitor("Time = %0t, A = %b(%d), B = %b(%d), select = %b(%d), Y= %b(%d)",$time, a, a, b, b, select, select, y, y);
		

		// test case
		for (integer i = 0; i < 16; i = i + 1) begin
			a = $random; 
            		b = $random; 
            		select = i; #5;
		end

	#7 $finish;
	end
endmodule


