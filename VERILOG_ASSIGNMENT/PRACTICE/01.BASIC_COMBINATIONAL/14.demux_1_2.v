// demux 1:2 

// DUT
module demux_1_2 #(parameter WIDTH = 8)(
  input [WIDTH-1:0] a, 
  input select,
  output [2*WIDTH-1:0] assign_y,
  output reg [2*WIDTH-1:0] if_else_y,
  output reg [2*WIDTH-1:0] case_y
);
  
  // data_flow modeling
  assign assign_y[WIDTH-1:0] = (!select) ? a : 1'b0;		// ternary operator
  assign assign_y[2*WIDTH-1:WIDTH] = (select) ? a : 1'b0;
  
  // behavioural modeling - if_else
  always @(*) begin
    if_else_y = '0;
    if(!select)
      if_else_y[WIDTH-1:0] = a;
    else
      if_else_y[2*WIDTH-1:WIDTH] = a;
  end
  
  // behavioural modeling - case
  always @(*) begin
    case(select) 
      1'b0 : begin
        case_y[WIDTH-1:0] = a;
        case_y[2*WIDTH-1:WIDTH] = '0;
      end
      
      1'b1 : begin
        case_y[2*WIDTH-1:WIDTH] = a;
        case_y[WIDTH-1:0] = 'b0;
      end
      
      default : begin 
        case_y = 'd0;
      end
    endcase
  end
  
endmodule

// TESTBENCH

module demux_1_2_tb #(parameter WIDTH = 8);
  reg [WIDTH-1:0] a;
  reg select;
  wire [2*WIDTH-1:0] assign_y;
  wire [2*WIDTH-1:0] if_else_y;
  wire [2*WIDTH-1:0] case_y;
  
  // instantation
  demux_1_2 #(.WIDTH(WIDTH)) dut_inst (
    .a(a),
    .select(select),
    .assign_y(assign_y),
    .if_else_y(if_else_y),
    .case_y(case_y)
  );
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    
    $display("---- 1:2 DEMUX -----");
    $monitor("Time=%0t | Sel=%b | In=%h || Assign_Y(H_L)=%h_%h | IfElse_Y(H_L)=%h_%h | Case_Y(H_L)=%h_%h", $time, select, a, assign_y[2*WIDTH-1:WIDTH], assign_y[WIDTH-1:0],if_else_y[2*WIDTH-1:WIDTH], if_else_y[WIDTH-1:0],case_y[2*WIDTH-1:WIDTH], case_y[WIDTH-1:0]);
    
    // test stimulus
    repeat(5) begin
      a = $random;
      select = 0; #2;
      select = 1; #2;
    end
    
    $finish;
  end
  
endmodule
