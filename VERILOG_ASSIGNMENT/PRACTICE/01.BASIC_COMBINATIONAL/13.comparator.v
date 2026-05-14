// 1 bit comparator

// dut
module comparator(
  input a, 
  input b,
  output less, 
  output greater, 
  output equal
);
  
  assign less = a < b;
  assign greater = a > b;
  assign equal = (a == b);
  
endmodule

//testbench
module comparator_tb;
  reg a; 
  reg b;
  wire less;
  wire greater;
  wire equal;
  
  // instantiation
  comparator dut_inst(a, b, less, greater, equal);
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    
    $display("---- 1 bit comparator -----");
    $monitor("time = %0t | a = %b | b = %b | a less b = %0d, a greater b = %0b | a equal b = %0b", $time, a, b, less, greater, equal);
    
    // test stimulus
    a = 0; b = 0; 	#2;
    a = 0; b = 1; 	#2;
    a = 1; b = 0; 	#2;
    a = 1; b = 1; 	#2;
    
    $finish;
  end
  
endmodule
