/* Q2. Synchronous Up/Down Counter with Load
Implement a parameterized synchronous up/down counter with a parallel load feature.
Specifications:
•	Parameters: WIDTH (default 8)
•	Inputs: clk, rst, up_down (1=up, 0=down), load, data_in[WIDTH-1:0]
•	Outputs: count[WIDTH-1:0], overflow, underflow
•	When load=1, counter loads data_in on next clock edge
•	Overflow and underflow flags pulse for one clock cycle
*/

module up_down_counter #(parameter WIDTH = 8)(
  input clk, rst, up_down, load,
  input [WIDTH-1:0] data_in,
  output reg [WIDTH-1:0] count,
  output reg overflow, underflow
);
  
  always @(posedge clk) begin
    if(rst) begin
      count <= 0;
      overflow <= 0; 
      underflow <= 0;
    end
    else begin
      overflow <= 0; 
      underflow <= 0;
      
      if(load) begin
        count <= data_in;
      end
      else if (up_down) begin
        if(count == (2**WIDTH)-1)
          overflow <= 1;
        count <= count + 1'b1;
      end
      
      else begin
        if(count == 0)
          underflow <= 1;
        count <= count - 1'b1;
      end
    end
  end
  
endmodule

module tb;
  parameter WIDTH = 8;
  reg clk, rst, up_down, load;
  reg [WIDTH-1:0] data_in;
  wire [WIDTH-1:0] count;
  wire overflow, underflow;
  
  up_down_counter #(8) inst (clk, rst, up_down, load, data_in, count, overflow, underflow);
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    
    rst = 1;
    up_down = 0;
    load = 0;
    data_in = 0;		#12;
    
    rst = 0;
    data_in = 23;
    load = 1;			#7;
    
    @(posedge clk);
    load = 0;
    up_down = 1;		
    @(posedge overflow);
    
    @(posedge clk);
    up_down = 0;
    @(posedge underflow);
    
    #50;
    $finish;
  end
endmodule
