// 1. Design a Digital Stopwatch in Verilog that counts elapsed time in seconds and milliseconds. The stopwatch should include start, stop, reset, and display functionality, and be suitable for implementation on an FPGA.

module stopwatch(
  input clk, rst, start, stop,
  output reg [6:0] milli_second, 
  output reg [5:0] second, 
  output reg [5:0] minute
); 
  reg [15:0] count;
  wire tick;
  
  always @(posedge clk) begin
    if(rst) begin
      count <= 0;
    end
    else if(count == 49_999)
      count  <= 0;
    else
      count <= count + 1'b1;
  end
  
  assign tick = (count == 49_999);
   
  
  always @(posedge clk) begin
    if(rst) begin
      milli_second <= 0;
      second <= 0;
      minute <= 0;
    end
    else begin
      if(start && !stop) begin
        if(milli_second == 99) begin
          milli_second <= 'b0;
          if(second == 60) begin
            second <= 'b0;
            if(minute == 60) begin
              minute <= 0;
            end
            else begin
              minute <= minute + 1'b1;
            end
          end
          else begin
            second <= second + 1'b1;
          end
        end
        else begin
          milli_second <= milli_second + 1'b1;
        end
      end
    end
  end
  
endmodule
