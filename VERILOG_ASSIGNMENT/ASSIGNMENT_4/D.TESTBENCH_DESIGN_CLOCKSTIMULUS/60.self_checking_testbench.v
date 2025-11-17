// Develop a testbench that compares expected and actual output and flags mismatches.

`timescale 1ns/1ps

module adder_tb;

    reg  [3:0] a, b;
    wire [4:0] sum;

    // Instantiate DUT
    adder DUT (
        .a(a),
        .b(b),
        .sum(sum)
    );

    integer i;               
    reg [4:0] expected_sum;

    initial begin

        // test cases
        for (i = 0; i < 10; i = i + 1) begin
            a = $random;  
            b = $random;

            expected_sum = a + b;
            #1;

            if (sum == expected_sum) begin
                $display("PASS: time=%0t | a=%b | b=%b | expected=%b | got=%b",$time, a, b, expected_sum, sum);
            end else begin
                $display("FAIL: time=%0t | a=%b | b=%b | expected=%b | got=%b", $time, a, b, expected_sum, sum);
            end
        end
        #10 $finish;
    end

endmodule

// design

module adder(
    input  [3:0] a, b,
    output [4:0] sum);

    assign sum = a + b;

endmodule

