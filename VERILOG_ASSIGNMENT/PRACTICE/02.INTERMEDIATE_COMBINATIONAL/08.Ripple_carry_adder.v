// ripple carry adder

// DUT
module shift_adder #(parameter WIDTH = 8)(
  input [WIDTH-1:0]a,
  input [WIDTH-1:0]b,
  input [WIDTH-1:0]c,
  output [1:0]carry,		
  output reg [WIDTH-1:0] sum
);
  
  // behavioral modeling
  always @(*) begin
    {carry, sum} = ((a + b) + c);
  end
  
endmodule

// TESTBENCH
module shift_adder_tb;
  
  parameter WIDTH = 8;
  
  wire [WIDTH-1:0] sum;
  wire [1:0]carry;
  reg [WIDTH-1:0]a;
  reg [WIDTH-1:0]b;
  reg [WIDTH-1:0]c;
  
  // instantation
  shift_adder dut_inst(.a(a), 
                      .b(b),
                      .c(c),
                      .sum(sum),
                      .carry(carry)
                     );
  
  initial begin
    integer i;
    
    $dumpfile ("dump.vcd");
    $dumpvars(0, shift_adder_tb);
    
    $display("----- Ripple Carry Adder --------");
    $monitor("time = %0t | a = %0d | b = %0d | c = %0d | sum = %0d | carry = %0d",$time, a, b, c, sum, carry);
    
    // test stimulus  
    repeat(5) begin
      a = $random;
      b = $random;
      c = $random; 		#2;
    end
    
    $finish;
  end
  
endmodule
