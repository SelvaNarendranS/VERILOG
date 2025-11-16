// Write a testbench for a 1-bit NOT gate.

module Not_gate_tb;
    	reg a;
	wire out;

	// instantiation
	not_gate uup(a, out);
	
    	
   initial begin
	    $monitor("time = %0t | a = %d | out = %d", $time, a, out);
	    $dumpfile("Not_gate_dump.vcd");
            $dumpvars(0, Not_gate_tb); 
	
	a = 0; #4; 
	a = 1; #2;
	a = 0; #4; 
	a = 1; #2;
	a = 0; #4; 
	a = 1; #2;

	#20;
	$finish;
                
    end
endmodule

// design 
module not_gate(
	input a,
	output out);

	assign out = ~a;

endmodule

