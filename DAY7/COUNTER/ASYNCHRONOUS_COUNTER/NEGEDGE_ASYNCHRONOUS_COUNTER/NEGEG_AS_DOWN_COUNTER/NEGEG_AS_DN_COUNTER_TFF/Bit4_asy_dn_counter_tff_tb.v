// 4 bit Asynchronous down - counter or ripple counter test bench

`timescale 1ns/1ps

module asy_dncnt_tb;
wire [3:0]q;
reg clk, rst;

	// Instantiation
	asy_dncnt asdc(.clk(clk), .rst(rst), .q(q));

	initial clk = 0;
	always #5 clk = ~clk;

	always @(posedge clk) begin
		$display("Time = %0t | clk = %b | rst = %b | q = %b ",$time, clk, rst, q);
		end

	initial begin
		$dumpfile("Asy_dncnt_dump.vcd");
		$dumpvars;

		// initial reset
		rst = 1; #5;

		// Deassert reset
		#10 rst = 0;

		// test case
		repeat(15) begin
		clk = 1; #10;
	        end	

		#40 $finish;
	end
endmodule

