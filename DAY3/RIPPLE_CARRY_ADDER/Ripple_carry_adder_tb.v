// Full adder testbench

`timescale 1ns/1ps

module full_adder_tb;
wire [4:0]sum;
wire cout;
reg [3:0]a, b;
reg cin;

	//instantiation
	ripple_carry_adder rca(
	.sum(sum),
        .cout(cout),
	.a(a), 
	.b(b),
	.cin(cin));

	initial begin
	
	$monitor("Time = %0t | a = %b(%d) | b = %b(%d) | cin = %b | sum = %b(%d) | cout = %b", $time, a,a, b,b, cin, sum,sum, cout);
	$dumpfile("ripple_carry_adder_dump.vcd");
	$dumpvars; 
		
	// combinations
	a = 4'b1101; b = 4'b1110; cin = 1'b0; #5
	a = 4'b1101; b = 4'b1110; cin = 1'b1; #5

	$finish; 
	end


endmodule


