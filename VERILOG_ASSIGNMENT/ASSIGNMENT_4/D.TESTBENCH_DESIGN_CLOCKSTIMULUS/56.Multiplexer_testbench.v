// Write a testbench that tests a multiplexer by toggling select lines.

// 2:1 MUX testbench

`timescale 1ns/1ps

module mux2_tb;
wire b;
reg [1:0]a;
reg select_line;

	// Instantiation
	mux2 m2( .a(a), .select_line(select_line), .b(b));
	
	task toggle;
	integer i;
	begin 
		for(i = 0; i < 2; i++) begin
			select_line =i;
			#5;
			$display("Time = %0t, a[0] = %b, a[1] = %b select line = %b, b = %b", $time, a[0], a[1], select_line, b);
		end
	end
	endtask

	initial begin
	
	// Conditions
	repeat(10) begin
		a = $random;  #5;
		toggle;
	end
	
	$finish;
	end

endmodule


// Mux Design

module mux2(
input [1:0]a,
input select_line, 
output reg b);

	always@(*) begin
	
		case(select_line)
	
		1'b0 : b = a[0];
		1'b1 : b = a[1];
		default : b = 1'b0;
	
		endcase
	end

endmodule
