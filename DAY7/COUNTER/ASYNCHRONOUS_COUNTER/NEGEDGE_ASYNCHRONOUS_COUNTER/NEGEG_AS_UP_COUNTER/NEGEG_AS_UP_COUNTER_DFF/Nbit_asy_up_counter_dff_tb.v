// N bit Asynchronous up - counter or ripple counter test bench

`timescale 1ns/1ps

module asy_upcnt_tb;
parameter N = 4;
wire [N-1:0]q;
reg clk, rst;

	// Instantiation
	asy_upcnt #(.N(N)) asuc(.clk(clk), .rst(rst), .q(q));

	initial clk = 0;
	always #5 clk = ~clk;

	always @(posedge clk) begin
		$display("Time = %0t | clk = %b | rst = %b | q = %b ",$time, clk, rst, q);
		end

	initial begin
		$dumpfile("Asy_upcnt_dump.vcd");
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

