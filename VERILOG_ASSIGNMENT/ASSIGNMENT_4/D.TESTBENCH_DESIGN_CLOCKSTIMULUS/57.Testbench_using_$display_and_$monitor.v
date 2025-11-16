// Create a testbench that uses $display and $monitor together.

// Or gate testbench

`timescale 1ns/1ps

module namd_gate_tb();
  wire c;
  reg a, b;

  //instantiation
  nand_gate nand1( .a(a), .b(b), .c(c));

  initial begin 

    $monitor("\n[&monitor]Time = %0t | a = %b | b = %b | c = %b",$time ,a, b,c);
    $dumpfile("nand_gate_dump.vcd");
    $dumpvars;

    // combinations 
    a = 0; b = 0; #5
    $display("[$display] Time = %0t | a = %b | b = %b | c = %b",$time ,a, b,c);
    a = 0; b = 1; #5
    $display("[$display] Time = %0t | a = %b | b = %b | c = %b",$time ,a, b,c);
    a = 1; b = 0; #5
    $display("[$display] Time = %0t | a = %b | b = %b | c = %b",$time ,a, b,c);
    a = 1; b = 1; #5
    $display("[$display] Time = %0t | a = %b | b = %b | c = %b",$time ,a, b,c);

    $finish;
  end
  
endmodule

module nand_gate( input a, b, output c);
wire y;

  assign c = ~(a & b);
  
endmodule