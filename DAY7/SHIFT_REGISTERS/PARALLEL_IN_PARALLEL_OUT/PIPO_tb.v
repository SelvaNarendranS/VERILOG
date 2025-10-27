// Test bench 
// N bit Parallel in Parallel out shift register

`timescale 1ns/1ps

module pipo_tb;
parameter N = 4;
wire [N-1:0]f;
reg clk, rst;
reg [N-1:0]a;

	// instantiation
	pipo #(.N(N)) uur(.clk(clk), .rst(rst), .a(a), .f(f));

	// clock generation
	initial clk = 0;
	always #10 clk = ~clk;

	always @(posedge clk) begin
		#2;
		$display("Time = %0t | clk = %b | rst = %b | a = %b | f = %b",$time, clk, rst, a, f);
	end

	initial begin 
		$dumpfile("pipo_dump.vcd");
		$dumpvars;

		// initial reset
		rst = 1;
		a = 0; #5;

		// Deassert reset
		#10 rst = 0;

		// test case
		repeat(10) begin
		a = $random; #20; // parallel load
		end 

		#40 $finish;
		end

endmodule	
