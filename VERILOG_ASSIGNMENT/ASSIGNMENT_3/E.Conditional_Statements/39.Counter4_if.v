// Design a 4-bit counter with synchronous reset using if...else.

module counter4_if;
reg clk, rst, enable;
reg [3:0]q;

	// clock generation
	initial clk = 0;
	always #5 clk = ~clk;

	always @(posedge clk) begin    // For synchronous reset only applied at clockedge on Q
		if(rst)
			q <= 1'b0;
		else if (enable)
			q <= q + 1'b1;
	end

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
