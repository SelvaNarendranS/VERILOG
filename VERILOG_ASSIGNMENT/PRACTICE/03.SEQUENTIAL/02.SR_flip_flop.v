// SR flip flop

// DUT

// Behavioral model
module sr_ff(
  input clk,
  input rst,
  input s,
  input r,
  output reg q,
  output q_bar
);
  
  always @(posedge clk) begin
    if(rst) begin
      q <= 0;
    end
    else begin
      case({s, r})
        2'b00 : q <= q;		// no change
        2'b01 : q <= 1'b0;	// reset
        2'b10 : q <= 1'b1;	// set
        2'b11 : q <= 1'bx;	// not defined
      endcase
    end
  end
  
  assign q_bar = ~q;
endmodule

// Test bench
module sr_ff_tb;
  reg clk;
  reg rst;
  reg s;
  reg r;
  wire q;
  wire q_bar;
  integer i;
  
  // instantiation
  sr_ff sr_inst(.clk(clk),
                .rst(rst),
                .s(s),
                .r(r),
                .q(q),
                .q_bar(q_bar)
               );
  
  // clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  initial begin
    
    $monitor("time = %0t | clk = %0d | rst = %0d | s = %0d | r = %0d | q = %0d | q_bar = %0d", $time, clk, rst, s, r, q, q_bar);
    
    // stimuli generation
    // initialize
    rst = 0;
    s = 0;
    r = 1;		#12;		//reset
    
    // reset release
    rst = 0;	#2;
    
    for(i = 0; i <= 4; i++) begin
      {s, r} = i[1:0];		#10;
    end
    
    #20;
    $finish;
  end
  
endmodule
