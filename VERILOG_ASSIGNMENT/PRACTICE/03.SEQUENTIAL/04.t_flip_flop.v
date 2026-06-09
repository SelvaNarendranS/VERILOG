// T flip flop

// DUT

// Behavioral model
module t_ff(
  input clk,
  input rst,
  input t,
  output reg q,
  output q_bar
);
  
  always @(posedge clk) begin
    if(rst) begin
      q <= 0;
    end
    else begin
      case(t)
        1'b0 : q <= q;	// no change
        1'b1 : q <= ~q;	// toggle
      endcase
    end
  end
  
  assign q_bar = ~q;
endmodule

// Test bench
module t_ff_tb;
  reg clk;
  reg rst;
  reg t;
  wire q;
  wire q_bar;
  integer i;
  
  // instantiation
  t_ff t_inst(.clk(clk),
              .rst(rst),
              .t(t),
              .q(q),
              .q_bar(q_bar)
             );
  
  // clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  initial begin
    
    $monitor("time = %0t | clk = %0d | rst = %0d | t = %0d | q = %0d | q_bar = %0d", $time, clk, rst, t, q, q_bar);
    $dumpfile("Dff_dump.vcd");
	$dumpvars;
    
    // stimuli generation
    // initialize
    rst = 1;
    t = 0;		#12;		//reset
    
    // reset release
    rst = 0;	#2;
    
    for(i = 0; i <= 4; i++) begin
      t = i[0];		#10;
    end
    
    #20;
    $finish;
  end
  
endmodule
