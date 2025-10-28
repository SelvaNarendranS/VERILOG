// N bit asynchronous down - counter test bench

`timescale 1ns/1ps

module asy_dncnt_tb;
parameter N = 4;
wire [N-1:0]q;
reg clk, rst, enable;

	// Instantiation
	asy_dncnt #(.N(N)) asdc(.clk(clk), .rst(rst), .q(q), .enable(enable));

	initial clk = 0;
	always #5 clk = ~clk;

	always @(posedge clk) begin
		$display("Time = %0t | clk = %b | rst = %b | enable = %b | q = %b ",$time, clk, rst, enable, q);
		end

	initial begin
		$dumpfile("Nbit_sy_down_counter_dump.vcd");
		$dumpvars;

		// initial reset
		rst = 1;
		enable = 0; #5;

		// Deassert reset
		#10 rst = 0;

		// test case
		repeat(15) begin
		clk = 1;
		enable = 1; #10;
	        end	

		#40 $finish;
	end
endmodule


