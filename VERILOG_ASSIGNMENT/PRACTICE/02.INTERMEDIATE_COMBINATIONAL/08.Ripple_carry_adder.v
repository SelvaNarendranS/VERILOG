// ripple carry adder

// DUT
module shift_adder #(parameter WIDTH = 8)(
  input [WIDTH-1:0]a,
  input [WIDTH-1:0]b,
  input cin,
  output cout,		
  output reg [WIDTH-1:0] sum
);
  
  wire [WIDTH-1:0] carry;
  
  assign carry[0] = cin;
  
  genvar i;
  generate
    for(i = 0; i < WIDTH; i++) begin : ripple_adder
      assign sum[i] = a[i] ^ b [i] ^ carry[i];
      assign carry[i+1] = (a[i] &  b[i]) | (a[i] & carry[i]) | (b[i] & carry[i]);
    end
  endgenerate
  
  assign cout = carry[WIDTH-1];
  
endmodule

// TESTBENCH
module shift_adder_tb;
  
  parameter WIDTH = 8;
  
  wire [WIDTH-1:0] sum;
  wire cout;
  reg [WIDTH-1:0]a;
  reg [WIDTH-1:0]b;
  reg cin;
  
  // instantation
  shift_adder dut_inst(.a(a), 
                       .b(b),
                       .cin(cin),
                       .sum(sum),
                       .cout(cout)
                      );
  
  initial begin
    integer i;
    
    $dumpfile ("dump.vcd");
    $dumpvars(0, shift_adder_tb);
    
    $display("----- Ripple Carry Adder --------");
    $monitor("time = %0t | a = %0d | b = %0d | cin = %0d | sum = %0d | cout = %0d",$time, a, b, cin, sum, cout);
    
    // test stimulus  
    repeat(5) begin
      a = $random;
      b = $random;
      cin = $random; 		#2;
    end
    
    $finish;
  end
  
endmodule
