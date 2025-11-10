// Mealy fsm for data[1:0] = 10 → 01 → 11 → 00  sequence detector
// Test bench

`timescale 1ns/1ps
module mealy_tb;
reg clk, reset;
reg [1:0]data;
wire detected;


	// instantiation
	mealy uup(.clk(clk), .reset(reset), .data(data), .detected(detected));

	// clocl generation
	initial begin
		clk = 1'b0;
		forever #5 clk = ~clk;
	end


	// Display
	always @(posedge clk) begin
		$display("Time = %0t | State = %b | data = %b | detected = %b", $time, uup.state, data, detected);
        end


	// Test case 
	initial begin
		$dumpfile("Mealy_dump.vcd");
		$dumpvars;

		// reset
		reset = 1'b0;
		data = 2'b0; #10;

		
		// De-assert reset		
		reset = 1'b1; #10;

		// test case
		data = 2'b10; #10;
	       	data = 2'b01; #10;
		data = 2'b11; #10;
		data = 2'b00; #10;
		data = 2'b01; #10;
		data = 2'b10; #10;
		data = 2'b00; #10;
		data = 2'b11; #10;
		data = 2'b00; #10;
		data = 2'b11; #10;
		data = 2'b10; #10;
		data = 2'b10; #10;
		data = 2'b11; #10;
		data = 2'b00; #10;
		#12 $finish;
	end

endmodule
