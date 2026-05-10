// full_adder

// DUT
module full_adder(
  input a,
  input b,
  input c,
  output [1:0] assign_out,		// {carry, sum}
  output reg [1:0] always_out		// {carry, sum}
);
  
  // Data flow modeling
  assign assign_out[0] = a ^ b ^ c;	// sum
  assign assign_out[1] = (a & b) | (c & (a ^ b));	// carry
  
  // behavioral modeling
  always @(*) begin
    always_out = {((a & b) | (c & (a ^ b))), (a ^ b ^ c)};
  end
  
endmodule

// TESTBENCH
module full_adder_tb;
  wire [1:0] assign_out;
  wire [1:0] always_out;
  reg a;
  reg b;
  reg c;
  
  // instantation
  full_adder dut_inst(.a(a), 
                      .b(b),
                      .c(c),
                      .assign_out(assign_out),
                      .always_out(always_out)
                     );
  
  initial begin
    integer i;
    
    $dumpfile ("dump.vcd");
    $dumpvars(0, full_adder_tb);
    
    $display("----- Full Adder --------");
    $monitor("time = %0t | a = %0b | b = %0b | c = %0b | assign sum = %0b | assign carry = %0b | always sum = %0b | always carry = %0b", 
             $time, a, b, c,
             assign_out[0], assign_out[1], 
             always_out[0], always_out[1]
            );
    
    // test stimulus  
    for(i=0; i<8; i++) begin
      {a, b, c} = i; #2;
    end
    
    $finish;
  end
  
endmodule
