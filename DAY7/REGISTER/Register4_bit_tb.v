// Test bench
// 4 bit register with parallel load

module register4_tb;
wire [3:0]f;
reg clk, rst;
reg [3:0]a;

	// Instantiation 
	register4 r0(.clk(clk), .rst(rst), .a(a), .f(f));

	// clock generation
	initial clk = 0;
	always #10 clk = ~clk;
	
	initial begin 
		$monitor("Time = %0t | clk = %b | rst = %b | A = %b | F = %b ",$time, clk, rst, a, f);
		$dumpfile("Register4_bit_dump.vcd");
		$dumpvars(1, register4_tb);

		// initial reset 
		rst = 1;
		a   = 0; #5;

		// Deassert reset
		rst = 0; #15;

		repeat(30) begin
			a = $random % 16; #4;
		end

		#13 $finish;
	end

endmodule
