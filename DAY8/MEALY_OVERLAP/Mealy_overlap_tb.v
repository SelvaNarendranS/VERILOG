// Mealy fsm for 11011 sequence detector(overlapping)
// Test bench

`timescale 1ns/1ps
module mealy_olap_tb;
reg clk, reset, data;
wire detected;


	// instantiation
	mealy_olap mlyolap(.clk(clk), .reset(reset), .data(data), .detected(detected));

	// clocl generation
	initial begin
		clk = 1'b0;
		forever #5 clk = ~clk;
	end


	// Display
	always @(posedge clk) begin
		$display("Time = %0t | State = %b | data = %b | detected = %b", $time, mlyolap.state, data, detected);
        end


	// Test case 
	initial begin
		$dumpfile("Mealy_mlyolap_tb_dump.vcd");
		$dumpvars;

		// reset
		reset = 1'b0;
		data = 1'b0; #10;

		
		// De-assert reset		
		reset = 1'b1; #10;

		// test case
		data = 1'b1; #10;
	       	data = 1'b1; #10;
		data = 1'b0; #10;
		data = 1'b1; #10;
		data = 1'b1; #10;
		data = 1'b0; #10;
		data = 1'b1; #10;
		data = 1'b1; #10;
		data = 1'b0; #10;
		data = 1'b1; #10;
		data = 1'b1; #10;
		data = 1'b1; #10;
		data = 1'b1; #10;
		data = 1'b0; #10;
		#12 $finish;
	end

endmodule
