// Simulate a 16-bit register being initialized and incremented inside an always block.

module sy_upcnt(
input clk, rst, enable,
output reg [15:0]q);

	always @(posedge clk) begin    // For synchronous reset only applied at clockedge on Q
		if(rst)
			q <= {16{1'b0}};
		else if (enable)
			q <= q + 1'b1;
	end

endmodule


// N bit synchronous up - counter test bench

`timescale 1ns/1ps

module sy_upcnt_tb;
wire [15:0]q;
reg clk, rst, enable;

	// Instantiation
	sy_upcnt sdc(.clk(clk), .rst(rst), .q(q), .enable(enable));

	initial clk = 0;
	always #5 clk = ~clk;

	always @(posedge clk) begin
		$display("Time = %0t | clk = %b | rst = %b | enable = %b | q = %b ",$time, clk, rst, enable, q);
		end

	initial begin

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


