// 2. Write RTL code to generate a 60% duty-cycle output clock using a counter-based approach, where a function calculates HIGH-time and LOW-time counts based on a programmable period.

module duty_cycle_clk #(parameter FREQ = 50_000_000
                        parameter REQ = 1_000) (
  input clk, rst, 
  output reg out_clk
);
  localparam divider = (FREQ / REQ);
  localparam percent_on = (divider * 0.6);
  localparam percent_off = divider - percent_on;
  
  reg [$clog2(divider):0]count;
  reg [$clog2(percent_on):0]count_on;
  reg [$clog2(percent_off):0]count_off;
  
  always @(posedge clk) begin
    if(rst) begin
      out_clk <= 0;
    end
    else begin
      if(count == divider - 1) begin
        if(count_off == percent_off - 1) begin
          out_clk <= ~out_clk;
        end
        else if(count_on == percent_on -1) begin
          out_clk <= ~out_clk;
        end
       
      else
        out_clk <= out_clk + 1'b1;
    end
  end
  
endmodule
