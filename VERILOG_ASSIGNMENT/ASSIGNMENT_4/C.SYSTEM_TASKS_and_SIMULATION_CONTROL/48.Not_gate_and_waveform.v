// Use $dumpfile and $dumpvars to generate waveform for a NOT gate.

module Not_gate;
    reg a;
    wire out;
	
	assign out = ~a;
 
    initial begin
	    $monitor("time = %0t | a = %d | out = %d", $time, a, out);
	    $dumpfile("Not_gate_dump.vcd");
            $dumpvars(0, Not_gate); 
	
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

