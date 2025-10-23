// Half subtractor gate testbench

`timescale 1ns/1ps

module half_subtractor_tb();
  wire difference, borrow;
  reg a, b;

  // instantiation
  half_subtractor hfsub1 ( .a(a), .b(b), .difference(difference), .borrow(borrow));

  initial begin
    $monitor("Time = %0t | a = %b | b = %b | difference = %b | borrow = %b ",$time, a, b, difference, borrow);
    $dumpfile("half_subtractor_dump.vcd");
    $dumpvars;

    // combinations
    a = 0; b = 0; #5
    a = 0; b = 1; #5
    a = 1; b = 0; #5
    a = 1; b = 1; #5
    $finish;
  end

endmodule
