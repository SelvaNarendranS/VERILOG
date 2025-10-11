// Xor gate testbench

`timescale 1ns/1ps

module half_adder_tb();
  wire sum, carry;
  reg a, b;

  // instantiation
  half_adder hfadd1 ( .a(a), .b(b), .sum(sum), .carry(carry));

  initial begin
    $monitor("Time = %0t | a = %b | b = %b | sum = %b | carry = %b ",$time, a, b, sum, carry);
    $dumpfile("half_adder_dump.vcd");
    $dumpvars;

    // combinations
    a = 0; b = 0; #5
    a = 0; b = 1; #5
    a = 1; b = 0; #5
    a = 1; b = 1; #5
    $finish;
  end

endmodule
