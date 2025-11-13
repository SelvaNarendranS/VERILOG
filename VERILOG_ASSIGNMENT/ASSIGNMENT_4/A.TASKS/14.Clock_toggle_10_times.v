// Create a task to toggle a clock signal 10 times with a delay of 5 time units.

module clock_gen;
    reg clk;
    integer i;

    // Clock generation Task definition
    task clock_task;
        begin
            clk = 1'b0;
	    for(i = 0; i < 10; i++) begin
            #5 clk = ~clk;
	    $display("time = %0t | clock = %b", $time, clk);
	    end
        end
    endtask

    initial begin


        clock_task();   // task call inside a  block
	$finish;
                
    end
endmodule

