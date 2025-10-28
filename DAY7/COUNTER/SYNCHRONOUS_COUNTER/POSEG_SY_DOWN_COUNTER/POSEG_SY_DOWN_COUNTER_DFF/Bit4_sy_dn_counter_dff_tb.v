// 4 bit synchronous down - counter test bench

`timescale 1ns/1ps

module sy_dncnt_tb;
wire [3:0]q;
reg clk, rst, enable;

	// Instantiation
	sy_dncnt suc(.clk(clk), .rst(rst), .q(q), .enable(enable));

	initial clk = 0;
	always #5 clk = ~clk;

	always @(posedge clk) begin
		$display("Time = %0t | clk = %b | rst = %b | enable = %b | q = %b ",$time, clk, rst, enable, q);
		end

	initial begin
		$dumpfile("Sy_dncnt_dump.vcd");
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

