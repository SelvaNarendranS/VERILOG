// Arithmetic logic unit

// dut
module alu #(parameter WIDTH = 8) (
  input signed [WIDTH-1:0] a,
  input signed [WIDTH-1:0] b,
  input [2:0] opcode,
  output reg signed [WIDTH-1:0] result,
  output zero,
  output reg carry,
  output overflow
);
  
  always @(*) begin
    result = 'b0;
    carry = 0;		// default
    
    case(opcode)
      3'd0 : {carry, result} = a + b;			// ADDITION
      3'd1 : {carry, result} = a - b;			// SUBTRACT
      3'd2 : result = a & b;		// and
      3'd3 : result = a | b;		// or
      3'd4 : result = a ^ b;		// xor
      3'd5 : result = a << 1;		// leftshift of a
      3'd6 : result = a >> 1;		// right shift a
      3'd7 : result = {{(WIDTH-1){1'b0}}, (a == b)};		// comparation
      default : result = 0;
    endcase
  end
  
  assign zero = (result == 0);
  assign overflow = (opcode == 3'd0) && ((a[WIDTH-1] == b[WIDTH-1]) && (result[WIDTH-1] != a[WIDTH-1])); 
  
endmodule

// testbench
module alu_tb;
  
  parameter WIDTH = 8;
  
  reg signed [WIDTH-1:0] a;
  reg signed [WIDTH-1:0] b;
  reg [2:0] opcode;
  wire signed [WIDTH-1:0] result;
  wire zero;
  wire carry;
  wire overflow;
  integer i;
  
  // instantiation
  alu #(.WIDTH(WIDTH)) dut_inst(.a(a),
                                .b(b),
                                .opcode(opcode),
                                .result(result),
                                .zero(zero),
                                .carry(carry),
                                .overflow(overflow)
                               );
  
  initial begin
    
    $dumpfile("dump.vcd");
    $dumpvars;
    
    $display("--------- ALU -------");
    $monitor("Time=%0dt | Opcode=%0d (%s) | A=%0d, B=%0d | Result=%0d | Zero=%b, Carry=%b, Overflow=%b",  $time, opcode,  
             (opcode == 3'd0) ? "ADDITION" : 
             (opcode == 3'd1) ? "SUBTRACT" : 
             (opcode == 3'd2) ? "AND"      : 
             (opcode == 3'd3) ? "OR"       : 
             (opcode == 3'd4) ? "XOR"      : 
             (opcode == 3'd5) ? "L_SHIFT"  : 
             (opcode == 3'd6) ? "R_SHIFT"  : "COMPARE", a, b, result, zero, carry, overflow);
    
    // test stimulus
    a = 118;
    b = 12;	
    
    for(i = 0; i < 8; i++) begin
      opcode = i;		#2;
    end
    
    $finish;
  end
endmodule
