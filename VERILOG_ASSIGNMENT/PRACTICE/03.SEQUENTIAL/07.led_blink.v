// Write a Verilog module that blinks an LED at 1 Hz using a 50 MHz clock. The LED must toggle every 0.5 seconds. Inputs are clk and rst, output is led.

module led_blink #(parameter freq = 50_000_000)(
  input clk, rst,
  output reg led
);
  reg [$clog2(freq/2)-1:0] count;
  
  always @(posedge clk) begin
    if(rst) begin
      led <= 0;
      count <= 'b0;
    end
    else begin
      if(count == (freq/2) - 1) begin
        led <= ~led;
        count <= 'b0;
      end
      else
        count <= count + 1'b1;
    end
  end
endmodule

module tb;
  parameter freq = 50_000_000;
  reg clk, rst;
  wire led;
  
  led_blink #(50_000_000) inst(clk, rst, led);
  
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
    
    wait(led == 1);
    #50;
    
    wait(led == 0);
    #50;
    $finish;
  end
endmodule
