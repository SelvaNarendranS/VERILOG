// Implement a task that toggles a signal every 10 time units using # delay.

module clock_gen;
    reg clk;

    // Clock generation Task definition
    task clock_task;
        begin
            clk = 1'b0;
            forever #10 clk = ~clk;
        end
    endtask

    initial begin
        $monitor("time = %0t | clock = %b", $time, clk);

        fork
            begin
                clock_task();   // task call inside a  block
            end
	#100 $finish;
        join

        
    end
endmodule
