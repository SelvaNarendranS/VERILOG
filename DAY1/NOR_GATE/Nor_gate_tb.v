// Or gate testbench

`timescale 1ns/1ps

module nor_gate_tb();
  wire c;
  reg a, b;

  // instantiation
  nor_gate nor1( .a(a), .b(b), .c(c)); 

  initial begin 

    $monitor("Time = %0t | a = %b | b = %b | c = %b ",$time, a, b);
    dumpfile("nor_gate_dump.vcd");
    dumpvars;

    // combinations
    a = 0; b = 0; #5
    a = 0; b = 1; #5
    a = 1; b = 0; #5
    a = 1; b = 1; #5
    $finish;
  end

endmodule
