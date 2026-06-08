// JK flip flop

// DUT

// Behavioral model
module jk_ff(
  input clk,
  input rst,
  input j,
  input k,
  output reg q,
  output q_bar
);
  
  always @(posedge clk) begin
    if(rst) begin
      q <= 0;
    end
    else begin
      case({j, k})
        2'b00 : q <= q;		// no change
        2'b01 : q <= 1'b0;	// reset
        2'b10 : q <= 1'b1;	// set
        2'b11 : q <= ~q;	// toggle
      endcase
    end
  end
  
  assign q_bar = ~q;
endmodule

// Test bench
module jk_ff_tb;
  reg clk;
  reg rst;
  reg j;
  reg k;
  wire q;
  wire q_bar;
  integer i;
  
  // instantiation
  jk_ff jk_inst(.clk(clk),
                .rst(rst),
                .j(j),
                .k(k),
                .q(q),
                .q_bar(q_bar)
               );
  
  // clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  initial begin
    
    $monitor("time = %0t | clk = %0d | rst = %0d | j = %0d | k = %0d | q = %0d | q_bar = %0d", $time, clk, rst, j, k, q, q_bar);
    
    // stimuli generation
    // initialize
    rst = 0;
    j = 0;
    k = 1;		#12;		//reset
    
    // reset release
    rst = 0;	#2;
    
    for(i = 0; i <= 4; i++) begin
      {j, k} = i[1:0];		#10;
    end
    
    #20;
    $finish;
  end
  
endmodule
