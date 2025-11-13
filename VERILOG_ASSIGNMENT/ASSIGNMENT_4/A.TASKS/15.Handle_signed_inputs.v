// Modify the given add_task to handle signed inputs.

module add_8bit;
        reg signed [7:0]a, b;
        reg signed [7:0]sum;

        initial begin
                a = -8'd50; b = 8'd90;
                add(a, b, sum);  // Tasks call
        end

// Task definition
task add;
        input signed[7:0]a, b;
        output signed [7:0]sum;

        begin
                sum = a + b;
          	$display("time = %0t | a = %d | b = %d | Sum = %d",$time, a, b, sum);
        end
endtask

endmodule

