module mealy_fsm_110010(
  input clk, rst,
  input in,
  output detect
);
  
  localparam [2:0] s0 = 0, s1 = 1, s2 = 2, s3 = 3, s4 = 4, s5 = 5;
  reg [2:0]state, nxt_state;
  
  always @(posedge clk) begin
    if(rst) 
      state <= s0;
    else
      state <= nxt_state;
  end
  
  always @(*) begin
    case(state) 
      s0 : nxt_state = in ? s1 : s0;
      s1 : nxt_state = in ? s2 : s0;
      s2 : nxt_state = !in ? s3 : s2;
      s3 : nxt_state = !in ? s4 : s3;
      s4 : nxt_state = in ? s5 : s0;
      s5 : nxt_state = !in ? s0 : s1;
    endcase
  end
  
  assign detect = ((state == s5) && (!in));
endmodule

module mealy_fsm_110010_tb;
  reg clk, rst, in;
  wire detect;
  
  mealy_fsm_110010 inst (clk, rst, in, detect);
  
  always #5 clk = ~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    
    clk = 0;
    
    $monitor("%0t --- in - %0d --- detect = %0d", $time, in, detect);
    
    rst = 1;
    in = 0;		#12;
    
    @(negedge clk); 
    rst = 0;
    in = 1;
    
    @(negedge clk); 
    in = 1;
    
    @(negedge clk); 
    in = 0;
    
    @(negedge clk); 
    in = 0;
    
    @(negedge clk); 
    in = 1;
    
    @(negedge clk); 
    in = 0;
    
    #40;
    $finish;
  end
endmodule
    
