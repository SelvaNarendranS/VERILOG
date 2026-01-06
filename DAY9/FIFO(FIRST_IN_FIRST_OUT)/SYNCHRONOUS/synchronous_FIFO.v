// Synchronous FIFO - Method 1: Pointer Comparison with “One Slot Empty”
module sync_fifo #(parameter DEPTH = 16, WIDTH = 8, ADDR = 4)
   		    (input  clk,
             input  reset,
             input  wr_en,
             input  rd_en,
             input  [WIDTH - 1:0]data_in,
             output reg [WIDTH - 1:0]data_out,
             output full,
             output empty);
  
  reg [WIDTH - 1:0]mem[DEPTH -1:0];		// memory 
  reg [ADDR - 1:0] wr_ptr, rd_ptr;			// write and read pointer
  
  always @(posedge clk) begin				// Write condition
    if(reset) begin
      wr_ptr   <= 0;
    end
    else begin
      if(wr_en && !full) begin
        mem[wr_ptr] <= data_in;
        wr_ptr      <= wr_ptr + 1'b1;
      end
    end
  end
  
  always @(posedge clk) begin				// Read condition
    if(reset) begin
      rd_ptr   <= 0;
      data_out <= 0;
    end
    else begin
      if(rd_en && !empty) begin
        data_out <= mem[rd_ptr];
        rd_ptr   <= rd_ptr + 1'b1;
      end
    end
  end
  
  assign full  = ((wr_ptr + 1'b1) == rd_ptr);		// full condition
  assign empty = (wr_ptr == rd_ptr);			// empty condition
  
endmodule