// Not gate testbench

`timescale 1ns/1ps

module not_gate_tb();
wire b; 
reg a;

//instantiation
	not_gate not1( .a(a), .b(b) );

initial begin 

	$monitor("Time = 0%t | a = %b | b = %b ",$time, a, b);
	$dumpfile("not_gate_dump.vcd");
	$dumpvars;

	// input combinations
	a = 0; #5
	a = 1; #5
	$finish;
end

endmodule 

