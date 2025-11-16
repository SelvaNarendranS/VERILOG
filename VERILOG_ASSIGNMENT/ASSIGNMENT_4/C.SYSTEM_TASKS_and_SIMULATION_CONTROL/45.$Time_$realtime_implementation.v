// Use $time and $realtime to print simulation time during execution.

`timescale 1ns/1ps
module time_check;

    initial begin

	#0.5;
	$display("$time = %0t | $realtime = %0t", $time, $realtime);
	#1.75; 
	$display("$time = %0t | $realtime = %0t", $time, $realtime);  //$time = 2000 - Rounded to time unit (here, 1ns) | $realtime = 2250 - precision (here, 1ps)
	#10;
	$display("$time = %0t | $realtime = %0t", $time, $realtime);

	#11 $finish;        
    end
endmodule


