// Handshake

// DUT

module master #(parameter WIDTH = 8) (
  input clk,
  input rst,
  input start_en,
  input [WIDTH-1:0] data_in,
  input ready,
  output reg valid,
  output reg [WIDTH-1:0] data_out
);
  
  always @(posedge clk) begin
    if(rst) begin
      valid <= 0;
      data_out <= 0;
    end
    else begin
      if(start_en) begin
        valid    <= 1'b1;
        data_out <= data_in;
      end
      
      // valid is set to high till ready = 1
      else if(valid && ready) begin
        valid <= 0;				// handshake completed
      end
    end
  end
  
endmodule


module slave #(parameter WIDTH = 8) (
  input clk,
  input rst,
  input start_en,
  input [WIDTH-1:0] data_in,
  input valid,
  output reg ready,
  output reg [WIDTH-1:0] data_out
);
  
  always @(posedge clk) begin
    if(rst) begin
      ready <= 0;
    end
    else begin
      if(start_en) begin
        ready <= 1'b1;
      end
      
      // capture data and deassert ready signal
      if(ready && valid) begin
		ready <= 0;				// handshake complete
        data_out <= data_in;
      end
    end
  end
  
endmodule
          

// testbench
module handshake_tb;
  
  parameter WIDTH = 8;
  
  reg clk;
  reg rst;
  
  // master
  reg 			   master_start_en;
  reg [WIDTH-1:0]  master_data_in;
  
  // slave
  reg 			   slave_start_en;
  wire [WIDTH-1:0] slave_data_out;
  
  wire 			   bus_ready;
  wire 			   bus_valid;
  wire [WIDTH-1:0] bus_data_in;
  
  reg [1:0] scenario_id;
  
  // instantation
  // master
  master #(.WIDTH(WIDTH)) mast_inst (.clk(clk),
                                     .rst(rst),
                                     .start_en(master_start_en),
                                     .data_in(master_data_in),
                                     .ready(bus_ready),
                                     .valid(bus_valid),
                                     .data_out(bus_data_in)
                                    );
  
  // slave
  slave #(.WIDTH(WIDTH)) slv_inst (.clk(clk),
                                    .rst(rst),
                                    .start_en(slave_start_en),
                                   .data_in(bus_data_in),
                                   .ready(bus_ready),
                                   .valid(bus_valid),
                                    .data_out(slave_data_out)
                                   );
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  initial begin
    
    $display("------ Handshake mechanism -------");
    $monitor("Time: %0tns |  scenario: %s | Reset: %b | Valid: %b | Ready: %b | Data_in: %d | Data_out = %0d", $time, (scenario_id == 2'd1) ? "READY before VALID" :
       (scenario_id == 2'd2) ? "READY after VALID " :
             (scenario_id == 2'd3) ? "VALID & READY Same" : "IDLE/RESET", rst, bus_valid, bus_ready, master_data_in, slave_data_out);
    
    
    $dumpfile("dump.vcd");
    $dumpvars;
    
    // test stimulus
    
    // reset
    @(posedge clk);
    rst = 1; 		
    master_start_en	= 0;
    master_data_in	= 0;
    slave_start_en	= 0;			#6;
    
    ready_before_valid;		#11;
    ready_after_valid;		#11;
    ready_valid_same_clk;	#11;
      
    #15;
    $finish;
  end
  
  task ready_before_valid;
    scenario_id = 0;
    
    @(posedge clk);
    slave_start_en	= 1;
    
    @(posedge clk);
    rst = 0;
    master_start_en	= 1;  master_data_in	= $random; 			#16;
    
    slave_start_en	= 0;
  endtask
    
  
  task ready_after_valid; 
    scenario_id = 1;
      
    @(posedge clk);
    rst = 0;
    master_start_en	= 1;
	master_data_in	= $random; 
      
    @(posedge clk);
    slave_start_en	= 1;			#16;
      
    slave_start_en	= 0;
  endtask
    
  
  task ready_valid_same_clk;
    scenario_id = 2;
    
    @(posedge clk);
    rst = 0;
    master_start_en	= 1;
    master_data_in	= $random;
    slave_start_en	= 1; 			#16;
      
    slave_start_en	= 0;
  endtask
  
endmodule
