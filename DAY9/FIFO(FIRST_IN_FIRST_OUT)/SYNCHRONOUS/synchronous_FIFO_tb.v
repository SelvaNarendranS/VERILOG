// Synchronous FIFO - testbench
module fifo_testbench;
  parameter DEPTH = 16;
  parameter WIDTH = 8;
  parameter ADDR  = 4;
  
  reg  clk;
  reg  reset;
  reg  wr_en;
  reg  rd_en;
  reg  [WIDTH - 1:0]data_in;
  wire [WIDTH - 1:0]data_out;
  wire  full;
  wire  empty;
  
  // instantation
  sync_fifo #(.DEPTH(DEPTH), .WIDTH(WIDTH), .ADDR(ADDR)) 
  dut(.clk(clk),
      .reset(reset),
      .wr_en(wr_en),
      .rd_en(rd_en),
      .data_in(data_in),
      .data_out(data_out),
      .full(full),
      .empty(empty));
  
  initial clk = 0;
  always #5 clk = ~clk;
  
  initial begin
    $monitor("Time = %0t | reset = %0d | wr_en = %0d | data_in = %0d | rd_en = %0d | data_out = %0d | full = %0d | empty = %0d", $time, reset, wr_en, data_in, rd_en, data_out, full, empty);
    
    $dumpfile("dump.vcd");
    $dumpvars;
    
    // initialize
    reset  = 0;
    wr_en  = 0;
    rd_en  = 0;
    data_in = 0;
    @(posedge clk);
    
    
    reset = 1; 		#4;
    repeat(2) @(posedge clk); #1;
    
    reset = 0;
    wr_en = 1;
    for(integer i = 0; i < 15; i++) begin
      @(negedge clk);
      data_in = $random;
    end
    #2;
    
    @(negedge clk);
    wr_en = 0;
    #10; 
    
    data_in = 0;
    for(integer i = 0; i < 15; i++) begin
      @(negedge clk);
      rd_en = 1;
    end
    #2;
    
    #50 $finish;
  end
endmodule   