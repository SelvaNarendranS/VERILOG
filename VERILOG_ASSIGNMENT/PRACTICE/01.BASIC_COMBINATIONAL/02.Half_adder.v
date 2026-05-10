// half_adder

// DUT
module half_adder(
  input a,
  input b,
  output [1:0] assign_out,		// {carry, sum}
  output reg [1:0] always_out		// {carry, sum}
);
  
  // Data flow modeling
  assign assign_out[0] = a ^ b;	// sum
  assign assign_out[1] = a & b;	// carry
  
  // behavioral modeling
  always @(*) begin
    always_out = {(a & b), (a ^ b)};
  end
  
endmodule

// TESTBENCH
module half_adder_tb;
  wire [1:0] assign_out;
  wire [1:0] always_out;
  reg a;
  reg b;
  
  // instantation
  half_adder dut_inst(.a(a), 
                      .b(b),
                      .assign_out(assign_out),
                      .always_out(always_out)
                     );
  
  initial begin
    $dumpfile ("dump.vcd");
    $dumpvars(0, half_adder_tb);
    
    $display("----- Half Adder --------");
    $monitor("time = %0t | a = %0b | b = %0b | assign sum = %0b | assign carry = %0b | always sum = %0b | always carry = %0b", 
             $time, a, b,
             assign_out[0], assign_out[1], 
             always_out[0], always_out[1]);
    
    // test stimulus
    a = 0; b = 0; 	#2;
    a = 0; b = 1; 	#2;
    a = 1; b = 0; 	#2;
    a = 1; b = 1; 	#2;
    
    $finish;
  end
  
endmodule
