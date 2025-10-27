// Test bench
// 4 bit Universal Shift register

module universal_sr_tb;
reg clk, rst, r_shift, l_shift;
reg [1:0]control;
reg [3:0]p_in;
wire [3:0]p_out;

	// Instantiation
	universal_sr uur(.clk(clk), .rst(rst), .r_shift(r_shift), .l_shift(l_shift), .control(control), .p_in(p_in), .p_out(p_out));

	// clock generation
	initial clk = 0;
	always #5 clk = ~clk;

	initial begin
		$monitor("Time = %0t | clk = %b | rst = %b | right_shift = %b |\n left_shift = %b | Control = %b | parallel in = %b | Parallel out = %b \n ",$time, clk, rst, r_shift, l_shift, control, p_in, p_out);
		$dumpfile("Universal_sr.vcd");
		$dumpvars;

		// reset 
		rst = 1;
		p_in = 0;
		r_shift = 0;
    		l_shift = 0;
   		control = 2'b00; #5;

		// Deassert reset
		#10 rst = 0;

		// test case

		p_in = 4'b1110;
		control = 2'b11; #20; // parallel load

		control = 2'b00; #20; // no change

		r_shift = 1'b1;
		control = 2'b01; #20; // right shift serial in

		l_shift = 1'b0;
                control = 2'b10; #20; // left shift serial in


		#68 $finish;
	end
endmodule
