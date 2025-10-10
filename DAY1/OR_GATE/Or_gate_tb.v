// Or gate testbench

`timescale 1ns/1ps

module or_gate_tb();

wire c;
reg a, b;

//instantiation
or_gate or1( .a(a), .b(b), .c(c) );

initial begin 
	
	a = 0 ; b = 0 ; #5
	a = 0 ; b = 1 ; #5
        a = 1 ; b = 0 ; #5                                                          
	a = 1 ; b = 1 ; #5
	$finish;
end

initial begin

	$monitor(" time = 0%t | a = %b | b = %b | c = %b",$time,a,b,c);
	$dumpfile( "or_gate_dump_file.vcd");
	$dumpvars;
end

endmodule
