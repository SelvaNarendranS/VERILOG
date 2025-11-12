// Subraction of two 8-bit numbers

module sub_8bit;
        reg [7:0]a, b;
        reg signed [7:0]diff;

        initial begin
                a = 8'd50; b = 8'd90;
                subraction(a, b, diff);  // Tasks call
        end

// Task definition
task subraction;
        input [7:0]a, b;
        output signed [7:0]diff;

        begin
                diff = a - b;
          	$display("time = %0t | a = %d | b = %d | Differences = %d",$time, a, b, diff);
        end
endtask

endmodule
