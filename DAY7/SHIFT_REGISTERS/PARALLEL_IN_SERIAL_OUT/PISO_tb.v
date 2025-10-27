// Test bench 
// N bit Parallel in serial out shift register

module piso_tb;
parameter N = 4;
wire s_out;
reg [N-1:0]p_in;
reg clk, rst, control;

	// Instantiation
	piso #(.N(N)) piso(.clk(clk), .rst(rst), .control(control), .load(load), .p_in(p_in), .s_out(s_out));

	initial clk = 0;
	always #5 clk = ~clk;

	always @(posedge clk) begin
		$display("Time = %0t | clk = %b | rst = %b | control = %b | parallel in = %b | serial out = %b ",$time, clk, rst, control, p_in, s_out);
		end

	initial begin
		$dumpfile("Piso_dump.vcd");
		$dumpvars;

		// initial reset
		rst = 1;
		p_in = 0;
   		control = 1'b0; #5;

		// Deassert reset
		#10 rst = 0;

		// test case

		p_in = 4'b1110;
		control = 1'b0; #20; // parallel load

		control = 1'b1; #20; // right shift serial in 

		#40 $finish;
	end
endmodule

