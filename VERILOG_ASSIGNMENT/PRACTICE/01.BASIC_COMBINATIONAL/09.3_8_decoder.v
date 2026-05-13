// decoder 3:8

// dut -- One-hot outputs
module decoder_3_8 #(parameter WIDTH = 8)(
  input [$clog2(WIDTH)-1:0] data_in,
  input enable,
  output reg [WIDTH-1:0] data_out
);
  
  always @(*) begin
    // default
    data_out = 0;
    
    if(enable) begin
      data_out = (1'b1 << data_in);
    end
    else
      data_out = 0;
  end
  
endmodule

// testbench 

module decoder_3_8_tb; 
  
  parameter WIDTH = 8;
  parameter ADDR_WIDTH = $clog2(WIDTH);
  
  reg [ADDR_WIDTH-1:0] data_in;
  reg enable;
  wire [WIDTH-1:0] data_out;
  integer i;
  
  // instantation
  decoder_3_8 #(.WIDTH(WIDTH)) inst_dut (
    .data_in(data_in),
    .enable(enable),
    .data_out(data_out)
  );
  
  initial begin 
    i = 0;
    
    $dumpfile("dump.vcd");
    $dumpvars;
    
    $display("---- 3:8 decoder -----");
    $monitor("time = %0t | enable = %0d | data_in = %b | data_out = %b", $time, enable, data_in, data_out);
    
    // test stimulus
    repeat(WIDTH) begin
      enable = $random;
      data_in = i;	#2;
      i = i + 1;
    end
    
    $finish;
  end
endmodule
