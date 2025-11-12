// Calculate the square of an 8-bit input number using task

module square_8bit;
        reg [7:0]a;
        reg  [15:0]sq;

        initial begin
                a = $random;
                square(a, sq);  // Task call
        end

// square Task definition
task square;
        input [7:0]a;
        output [15:0]sq;

        begin
                sq = a * a;
          	$display("time = %0t | a = %d | square = %d",$time, a, sq);
        end
endtask

endmodule


