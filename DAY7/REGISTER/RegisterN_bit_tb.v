// Test bench
// N bit register with enable & parallel load

module registerN_tb;
parameter N = 4;
wire [N-1:0]f;
reg clk, rst, enable;
reg [3:0]a;

	// Instantiation 
	registerN #(.N(N)) r0(.clk(clk), .rst(rst), .enable(enable), .a(a), .f(f));

	// clock generation
	initial clk = 0;
	always #10 clk = ~clk;
	
	initial begin 
		$monitor("Time = %0t | clk = %b | rst = %b | enable = %b | A = %b | F = %b ",$time, clk, rst, enable, a, f);
		$dumpfile("RegisterN_bit_dump.vcd");
		$dumpvars(1, registerN_tb);

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
		
		#13 $finish;
	end

endmodule
