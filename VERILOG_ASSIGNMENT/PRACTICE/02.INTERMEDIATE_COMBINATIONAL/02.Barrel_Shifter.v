// Barrel Shifter

// DUT
module barrel_shifter #(parameter WIDTH = 8) (
  input signed [WIDTH-1:0] 		a,
  input [$clog2(WIDTH)-1:0] shift_amount,
  input 					enable,
  output reg [WIDTH-1:0] 	logic_left,
  output reg [WIDTH-1:0] 	logic_right,
  output reg [WIDTH-1:0] 	arithmetic_left,
  output reg [WIDTH-1:0] 	arithmetic_right
);
  
  always @(*) begin
    if(enable) begin
      logic_left = a << shift_amount;
      logic_right = $unsigned(a) >> shift_amount;
      arithmetic_left = a <<< shift_amount;
      arithmetic_right = $signed(a) >>> shift_amount;
    end
    else begin
      logic_left = 'b0; 
      logic_right = 'b0; 
      arithmetic_left = 'b0; 
      arithmetic_right = 'b0; 
    end
  end
endmodule

// testbench
module barrel_shifter_tb;
  
  parameter WIDTH = 8;
  
  reg signed [WIDTH-1:0] 		  a;
  reg [$clog2(WIDTH)-1:0] shift_amount;
  reg 					  enable;
  wire [WIDTH-1:0] 	      logic_left;
  wire [WIDTH-1:0] 	      logic_right;
  wire [WIDTH-1:0] 	      arithmetic_left;
  wire [WIDTH-1:0] 	      arithmetic_right;
  
  // instantation
  barrel_shifter #(.WIDTH(WIDTH)) dut_inst (.a(a),
                                            .shift_amount(shift_amount),
                                            .enable(enable),
                                            .logic_left(logic_left),
                                            .logic_right(logic_right),
                                            .arithmetic_left(arithmetic_left),
                                            .arithmetic_right(arithmetic_right)
                                           );
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    
    $display("--------- Barrel Shifter -------");
    $monitor("Time=%0dt | a = %0d(%b) | enable = %0d | shift amount = %0d | logic_left = %b | logic_right = %b | arithmetic_left = %b | arithmetic_right = %b",  $time, a, a, enable, shift_amount, logic_left, logic_right, arithmetic_left, arithmetic_right);
    
    // test stimulus
    a = 118;
    shift_amount = 3;
    enable = 0;			#4;
    
    repeat(5) begin
      a = $random;
      shift_amount = $random;
      enable = $random;			#2;
    end
    
    #4;
    $finish;
  end
endmodule
