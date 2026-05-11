// mux 2:1 -- data_flow, behavioural modeling

// DUT
module mux_2_1 #(parameter WIDTH = 8)(
  input [WIDTH-1:0] a, 
  input [WIDTH-1:0] b,
  input select,
  output [WIDTH-1:0] assign_y,
  output reg [WIDTH-1:0] if_else_y,
  output reg [WIDTH-1:0] case_y
);
  
  // data_flow modeling
  assign assign_y = (select) ? b : a;		// ternary operator
//     assign assign_y = (~{WIDTH{select}} & a) | ({WIDTH{select}} & b);
  
  // behavioural modeling - if_else
  always @(*) begin
    if(!select)
      if_else_y = a;
    else
      if_else_y = b;
  end
  
  // behavioural modeling - case
  always @(*) begin
    case(select) 
      1'b0 : case_y = a;
      1'b1 : case_y = b;
      default : case_y  = 'd0;
    endcase
  end
  
endmodule

// TESTBENCH

module mux_2_1_tb #(parameter WIDTH = 8);
  reg [WIDTH-1:0] a; 
  reg [WIDTH-1:0] b;
  reg select;
  wire [WIDTH-1:0] assign_y;
  wire [WIDTH-1:0] if_else_y;
  wire [WIDTH-1:0] case_y;
  
  // instantation
  mux_2_1 #(.WIDTH(WIDTH)) dut_inst (
    .a(a),
    .b(b),
    .select(select),
    .assign_y(assign_y),
    .if_else_y(if_else_y),
    .case_y(case_y)
  );
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    
    $display("---- 2:1 MUX -----");
    $monitor("time = %0t | a = %0d | b = %0d | select = %0d | assign_y = %0d, if_else_y = %0d | case_y = %0d", $time, a, b, select, assign_y, if_else_y, case_y);
    
    // test stimulus
    repeat(5) begin
      a = $random;
      b = $random;
      select = 0; #2;
      select = 1; #2;
    end
    
    $finish;
  end
  
endmodule
