// Asynchronous FIFO testbench - Pointer with Extra MSB method
`timescale 1ns / 1ps

module async_fifo_tb;
  
  // parameter
  parameter WIDTH = 8;
  parameter DEPTH = 16;
  
  // write domain
  reg 				 wr_clk;
  reg 				 wr_rst;
  reg 				 wr_en;
  reg [WIDTH -1 :0]	data_in;
  wire 				full;

  // read domain
  reg 				 rd_clk;
  reg 				 rd_rst;
  reg 				 rd_en;
  wire [WIDTH -1 :0] data_out;
  wire 				 empty;
  
   integer i, j;
  
  // initialization 
  async_fifo #(.WIDTH(WIDTH),
               .DEPTH(DEPTH)) 
  dut (.wr_clk(wr_clk), 
       .wr_rst(wr_rst), 
       .wr_en(wr_en), 
       .data_in(data_in),
       .full(full),
       .rd_clk(rd_clk),
       .rd_rst(rd_rst), 
       .rd_en(rd_en), 
       .data_out(data_out),
       .empty(empty));
  
  // write domain clock generation
  initial begin
    wr_clk = 0;
    forever #5 wr_clk = ~wr_clk;
  end
  
  // read domain clock generation
  initial begin
    rd_clk = 0;
    forever #7 rd_clk = ~rd_clk;
  end
  
  // full condition
  task full_condition();
    begin
    $display("----------- WRITE condition -----------------");
    
    // write stimuli generation
    wr_en  = 1;
    for(j = 0; j < DEPTH; j++) begin
      @(negedge wr_clk);
      data_in = $random;
      
      @(posedge wr_clk);
      #1;		// wait for display
      $display("Time = %0t | wr_rst = %0d | wr_en = %0d | data_in = %d(%b) | full = %0d", $time, wr_rst, wr_en, data_in, data_in, full);
    end
    
    @(negedge wr_clk);
    wr_en = 0;
    data_in = 0;
    $display("----------- WRITE FINISHED -----------------");
   end
  endtask
  
  
  task empty_condition();
  begin
    $display("\n----------- READ condition -----------------");
    
    repeat(4) @(posedge rd_clk);		// wait for synchronization
    
    // read stimuli generation
    for(i = 0; i < DEPTH +1; i++) begin
      @(negedge rd_clk);
      rd_en  = 1;
      
      @(posedge rd_clk)
      
    $display("Time = %0t | rd_rst = %0d | rd_en = %0d | data_out = %d(%b) | empty = %0d", $time, rd_rst, rd_en, data_out, data_out, empty);
    end
    
    @(negedge rd_clk);
    rd_en = 0;
    $display("----------- READ FINISHED -----------------");
  end
  endtask
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    
    
    // initialization
    wr_rst  = 1;
    wr_en   = 0;
    data_in = 0;
    rd_rst  = 1;
    rd_en   = 0;
    #20;
    
    // Applying Active Low Reset
    wr_rst = 0; rd_rst = 0;
    $display("Time = %0t | wr_rst = %0d | rd_rst = %0d", $time, wr_rst, rd_rst);
    #20;
    
    // Release Reset
    wr_rst = 1; rd_rst = 1;
    $display("Time = %0t | wr_rst = %0d | rd_rst = %0d", $time, wr_rst, rd_rst);
    #20;
    
    full_condition();
    #15;
    
    empty_condition();
    #15;
    
    #100 $finish;
  end
endmodule