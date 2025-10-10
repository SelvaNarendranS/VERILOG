// And gate testbench

module and_gate_tb();
wire c;  
reg a, b;

//instantiation 
and_gate and1(.a(a), .b(b), .c(c));

initial begin
 
	a = 0 ; b = 0 ; #5
	a = 0 ; b = 1 ; #5
        a = 1 ; b = 0 ; #5                                                          
	a = 1 ; b = 1 ; #5
	$finish;
end

initial begin
	$monitor("time = %0t | a = %b | b = %b | c = %b",$time,a,b,c);
	$dumpfile("and_gate_dumpfile.vcd");
	$dumpvars; // or - if more than 1 module $dumpvars(0,and_gate_tb); 
end

endmodule 

