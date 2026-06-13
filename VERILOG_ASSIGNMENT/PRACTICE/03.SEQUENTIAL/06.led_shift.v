/*
Implement a 4-bit shift register that shifts a pattern across 4 LEDs. 
Requirements: 
Input: clk, rst, shift_in 
Output: led[3:0] 
Shift every 0.5 seconds */

module led_blink #(parameter freq = 50_000_000)(
  input clk, rst,
  output reg tick
);
  reg [$clog2(freq/2)-1:0] count;
  
  always @(posedge clk) begin
    if(rst) begin
      tick <= 0;
      count <= 'b0;
    end
    else begin
      if(count == (freq/2) - 1) begin
        tick <= 1;
        count <= 'b0;
      end
      else begin
        tick <= 0;
        count <= count + 1'b1;
      end
    end
  end
endmodule

module led_shift (
  input clk, rst, shift_in,
  output reg [3:0]led
);

  always @(posedge clk) begin
    if(rst) 
      led <= 4'b0001;			// default 1st led is on
    else begin
      if(shift_in)
        led <= {led[2:0], led[3]};
    end
  end
endmodule


module tb;
  parameter freq = 50_000_000;
  reg clk, rst;
  wire shift_in;
  wire [3:0]led;
  
  led_blink #(50_000_000) inst(.clk(clk), .rst(rst), .tick(shift_in));
  led_shift inst_sft (.clk(clk), .rst(rst), .shift_in(shift_in), .led(led));
  
  initial begin
    clk = 0;
    forever #10 clk = ~clk;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    
    $monitor("led = %0d", led);
    
    rst = 1;	#22;
    
    rst = 0; #14;
    
    wait(led[3] == 1);
    #50;
    
    wait(led[3] == 0);
    #50;
    $finish;
  end
endmodule
