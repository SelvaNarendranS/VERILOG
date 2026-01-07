// Synchronous FIFO - Method 4: Shift-Register FIFO (Small Depth - (2–8 entries))
module sync_fifo #(parameter DEPTH = 16, WIDTH = 8, ADDR = 4)
   		    (input  clk,
             input  reset,
             input  wr_en,
             input  rd_en,
             input  [WIDTH - 1:0]data_in,
             output reg [WIDTH - 1:0]data_out,
             output full,
             output empty);
  
  reg [WIDTH - 1:0]fifo[DEPTH-1:0];			// memory 
  
//   no need of read and write pointer
//   reg [ADDR:0] wr_ptr, rd_ptr;			    // write and read pointer
  
  // extra counter logic for counter
  reg [ADDR:0]count;						// counter  
  integer i;
  
  always @(posedge clk) begin				// Write condition
    if(reset) begin
      data_out   <= 0;
    end
    else begin
      if(wr_en && !full) begin
        fifo[count] <= data_in;				// write
      end
    end
  end
  
  always @(posedge clk) begin				// Read condition
    if(reset) begin
      data_out <= 0;
    end
    else begin
      if(rd_en && !empty) begin
        data_out <= fifo[0];					// read the LSB bit
        for(i = 0; i < DEPTH - 1; i++)
          fifo[i] <= fifo[i+1];
      end
    end
  end
  
  // FIFO full and empty calculation on counter updation
  always @(posedge clk) begin
    if(reset)
      count <= 0;
    else begin
      case({(wr_en && !full), (rd_en && !empty)})
        2'b10 : count <= count + 1;		// write counter updation
        2'b01 : count <= count - 1;		// read counter updation
        2'b11 : count <= count;			// both read and write condition no change in count
        default : count <= count;
      endcase
    end
  end
  
  // FIFO full and empty condition based on counter
  assign empty = count == 0;				// empty condition
  assign full  = count == DEPTH;			// full condition
  
endmodule