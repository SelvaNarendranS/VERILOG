// Write a task that implements a simple delay-based blinking LED simulation.

module led_blink;
	reg a;

	initial begin
		$monitor("time = %0t | LED = %b", $time, a);

        	fork
            	begin
                	blinking();   // task call inside a  block
            	end
		#100 $finish;
        	join;
	end

// Task definition
task blinking;	
	 begin
            a = 1'b0;
            forever #10 a = ~a;
        end
endtask

endmodule	



