// Moore fsm for 1101 sequence detector(non overlapping)
// Test bench

`timescale 1ns/1ps
module moore_fsm_tb;
reg clk, reset, data;
wire detected;

	// instantiation
	moore_fsm morfsm(.clk(clk), .reset(reset), .data(data), .detected(detected));

	// clocl generation
	initial begin
		clk = 1'b0;
		forever #5 clk = ~clk;
	end

	// Display and test cases
	always @(posedge clk) begin
		$display("Time = %0t | clk = %b | reset = %b | State = %b | data = %b | detected = %b", $time, clk, reset, morfsm.state, data, detected);
	end

	initial begin
		$dumpfile("Moore_fsm_tb_dump.vcd");
		$dumpvars;

		// reset
		reset = 1'b1;
		data = 1'b0; #10;

		
		// De-assert reset		
		reset = 1'b0; #10;

		// test case
		data = 1'b1; #10;
	       	data = 1'b1; #10;
		data = 1'b0; #10;
		data = 1'b1; #10;
		data = 1'b0; #10;
		data = 1'b1; #10;
		data = 1'b1; #10;
		data = 1'b1; #10;
		data = 1'b0; #10;
		data = 1'b1; #10;
		data = 1'b1; #10;
		data = 1'b0; #10;
		data = 1'b1; #10;
		data = 1'b0; #10;

		#12 $finish;
	end

endmodule
