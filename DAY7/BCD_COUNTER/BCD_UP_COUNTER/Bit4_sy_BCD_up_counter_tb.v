// 4 bit synchronous Binary coded decimal up - counter test bench

`timescale 1ns/1ps

module sy_BCD_upcnt_tb;
wire [7:0]q;
reg clk, rst, enable;

	// Instantiation
	sy_BCD_upcnt uup(.clk(clk), .rst(rst), .q(q), .enable(enable));

	initial clk = 0;
	always #5 clk = ~clk;

	always @(posedge clk) begin
		$display("Time = %0t | clk = %b | rst = %b | enable = %b | q = %b %b ",$time, clk, rst, enable, q[7:4], q[3:0]);
		end

	initial begin
		$dumpfile("Nbit_sy_up_counter_dump.vcd");
		$dumpvars;

		// initial reset
		rst = 1;
		enable = 0; #5;

		// Deassert reset
		#10 rst = 0;

		// test case
		repeat(32) begin
		clk = 1;
		enable = 1; #10;
	        end	

		#40 $finish;
	end
endmodule


