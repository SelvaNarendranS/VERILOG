// Synchronous FIFO - Method 2: Pointer with Extra MSB (Wrap Bit / Toggle Bit)
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
  reg [ADDR:0] wr_ptr, rd_ptr;			        // write and read pointer
  							// pointer bit size(WIDTH) has an aditional bit -- for 4 bit means allocated as 5 bit --- extra bit on MSB
  
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
  
  assign empty = (wr_ptr == rd_ptr);					// empty condition
  assign full  = (((wr_ptr[ADDR]) != (rd_ptr[ADDR])) && 
                  ((wr_ptr[ADDR-1:0]) == (rd_ptr[ADDR-1:0])));		// full condition     --- both MSB bits differs and other remaining bits are same
  									// wr_ptr = 1_0001,  rd_ptr = 0_0001 -- full condition --- MSB differs b/w read & write ptr remaining are same
  
endmodule