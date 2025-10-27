// Test bench 
// N bit Serial in parallel out shift register

module sipo_tb;
parameter N = 4;
wire [N-1:0]f;
reg a;
reg clk, rst, enable;

	// Instantiation
	sipo #(.N(N)) spo(.clk(clk), .rst(rst), .enable(enable), .a(a), .f(f));

	initial clk = 0;
	always #5 clk = ~clk;

	initial begin
		$monitor("Time = %0t | clk = %b | rst = %b | enable = %b | A = %b | F = %b ",$time, clk, rst, enable, a, f);
		$dumpfile("sipo_dump.vcd");
		$dumpvars;

		// initial reset
		rst = 1;
		enable = 1;
		a   = 0; #5;

		// Deassert reset
		rst = 0; #15;

		repeat(15) begin
			a = $random; #4;
		end

		// checking enable
		repeat(2) begin
			enable = 0;
			a = $random; #4;
		end

		enable = 1;
		a = $random; #4;

		#14 $finish;
	end

endmodule

