// mux 4:1 

// DUT

module mux_2_1 #(parameter WIDTH = 8)(
  input [WIDTH-1:0] a, 
  input [WIDTH-1:0] b,
  input select,
  output reg [WIDTH-1:0] case_y
);
  
  // behavioural modeling - case
  always @(*) begin
    case(select) 
      1'b0 : case_y = a;
      1'b1 : case_y = b;
      default : case_y = 'd0;
    endcase
  end
  
endmodule

// top module -- hierarchical structure
module mux_4_1 #(parameter WIDTH = 8)(
  input [WIDTH-1:0] a, 
  input [WIDTH-1:0] b,
  input [WIDTH-1:0] c,
  input [WIDTH-1:0] d,
  input [1:0]select,
  output [WIDTH-1:0] y
);
  wire[WIDTH-1:0] sel0, sel1;
  
  // instantation
  mux_2_1 #(.WIDTH(WIDTH)) inst_in0(.a(a), .b(b), .select(select[0]), .case_y(sel0));
  mux_2_1 #(.WIDTH(WIDTH)) inst_in1(.a(c), .b(d), .select(select[0]), .case_y(sel1));
  mux_2_1 #(.WIDTH(WIDTH)) inst_main(.a(sel0), .b(sel1), .select(select[1]), .case_y(y));
  
endmodule


// TESTBENCH
module mux_4_1_tb #(parameter WIDTH = 8);
  reg [WIDTH-1:0] a; 
  reg [WIDTH-1:0] b;
  reg [WIDTH-1:0] c; 
  reg [WIDTH-1:0] d;
  reg [1:0]select;
  wire [WIDTH-1:0] y;
  
  // instantation
  mux_4_1 #(.WIDTH(WIDTH)) dut_inst (
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .select(select),
    .y(y)
  );
  
  initial begin
    integer i;
    
    $dumpfile("dump.vcd");
    $dumpvars;
    
    $display("---- 4:1 MUX -----");
    $monitor("time = %0t | a = %0d | b = %0d | c = %0d | d = %0d | select = %0d | y = %0d", $time, a, b, c, d, select, y);
    
    // test stimulus
    repeat(2) begin
      {a, b, c, d} = $random;
      for(i=0; i < 4; i++) begin
        select = i;  #2;
      end
    end
    
    $finish;
  end
  
endmodule
