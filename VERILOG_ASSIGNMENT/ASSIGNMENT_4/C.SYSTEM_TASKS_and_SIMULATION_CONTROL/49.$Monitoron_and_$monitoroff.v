// Show usage of $monitoron and $monitoroff to control monitoring.

module xor_gate;
    reg a, b;
    wire out;
	
	assign out = (a ^ b);
 
    initial begin
	    $monitor("time = %0t | a = %d | b = %d | out = %d", $time, a, b, out);

	$display("------------- Initil data ---------------");
	a = 0; b = 1; #4;

	$monitoroff;
	$display("------------- Monitor off ---------------");
	
	a = 0; b = 0; #4; 
	a = 1; b = 1; #2;
	a = 0; b = 1; #4; 
	a = 1; b = 0; #2;

	$monitoron;
	$display("\n\n------------- Monitor on ----------------");

	a = 0; b = 0; #4; 
	a = 1; b = 1; #2;
	a = 0; b = 1; #4; 
	a = 1; b = 0; #2;

	#20;
	$finish;
                
    end
endmodule

