// Synchronous FIFO - Method 3: Counter-Based FIFO
module sync_fifo #(parameter DEPTH = 16, WIDTH = 8, ADDR = 4)
   		    (input  clk,
             input  reset,
             input  wr_en,
             input  rd_en,
             input  [WIDTH - 1:0]data_in,
             output reg [WIDTH - 1:0]data_out,
             output full,
             output empty);
  
  reg [WIDTH - 1:0]mem[DEPTH-1:0];			// memory 
  reg [ADDR:0] wr_ptr, rd_ptr;			    // write and read pointer
  
  // extra counter logic for counter based FIFO
  reg [ADDR:0]count;						// counter  
  
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
  
  // FIFO full and empty calculation on counter updation
  always @(posedge clk) begin
    if(reset)
      count <= 0;
    else begin
      case({(wr_en && !full), (rd_en && !empty)})
        2'b10 : count <= count + 1;		// write counter updation
        2'b01 : count <= count - 1;		// read counter updation
        default : count <= count;
      endcase
    end
  end
  
  // FIFO full and empty condition based on counter
  assign empty = count == 0;				// empty condition
  assign full  = count == DEPTH;			// full condition
  
endmodule