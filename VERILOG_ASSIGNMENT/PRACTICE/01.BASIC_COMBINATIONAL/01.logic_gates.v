// Logic gates

// DUT
module logic_gates(
  input a, 
  input b,
  output reg       and_y,
  output reg       or_y,
  output reg [1:0] not_y,		// {Not b, Not a}
  output reg 	   nand_y,
  output reg 	   nor_y,
  output reg 	   xor_y,
  output reg 	   xnor_y
);
  
  // combinational block -- logic
  always @(*) begin
    
    and_y	= a & b;
    or_y	= a | b;
    not_y	= {~b, ~a};
    nand_y	= ~(a & b);
    nor_y	= ~(a | b);
    xor_y	= a ^ b;
    xnor_y	= ~(a ^ b);
    
  end
  
endmodule


// TESTBENCH

module logic_gates_tb;
  wire       and_y;
  wire       or_y;
  wire [1:0] not_y;		// {Not b, Not a}
  wire 	   	 nand_y;
  wire 	   	 nor_y;
  wire 	   	 xor_y;
  wire 	   	 xnor_y;
  reg 		 a;
  reg 		 b;
  
  // instantation
  logic_gates dut_inst (.a(a),
                        .b(b),
                        .and_y(and_y),
                        .or_y(or_y),
                        .not_y(not_y),
                        .nand_y(nand_y),
                        .nor_y(nor_y),
                        .xor_y(xor_y),
                        .xnor_y(xnor_y)
                       );
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    
    $display(" ---- The all logic Gates -----");
    $monitor("time= %0t | A = %0b | B = %0b | AND = %0b | OR = %0b | NOT A = %0b | NOT B = %0b | NAND = %0b | NOR = %0b | XOR = %0b | XNOR = %0b", $time, a, b, and_y, or_y, not_y[0], not_y[1], nand_y, nor_y, xor_y, xnor_y);
    
    // input stimulus
    a = 0; b = 0; 	#2;
    a = 0; b = 1; 	#2;
    a = 1; b = 0; 	#2;
    a = 1; b = 1; 	#2;
    
    $finish;
  end
  
endmodule
