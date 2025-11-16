// Demonstrate difference between $write and $display.

module xnor_gate;
    reg a, b;
    wire out;
	
	assign out = ~(a ^ b);
 
    initial begin

	$display("------------- using $display ---------------");
	a = 0; b = 1; #4;
	$display("time = %0t | a = %d | b = %d | out = %d`````", $time, a, b, out);
	$display("\n");

	$display("------------- using $write ---------------");
	
	a = 0; b = 0; #4;
	$write("time = %0t | a = %d | b = %d | out = %d``````", $time, a, b, out);
	a = 1; b = 1; #2;
	$write("time = %0t | a = %d | b = %d | out = %d`````", $time, a, b, out);
	a = 0; b = 1; #4;
	$write("time = %0t | a = %d | b = %d | out = %d`````", $time, a, b, out);	 
	$write("\n \n print in the previous line ------- '\\n' is used manually");

	#20;
	$finish;
                
    end
endmodule

