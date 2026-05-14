// 8:3 priority encoder

// dut
module encoder_8_3 #(parameter WIDTH = 8,
                     parameter OUT_WIDTH = $clog2(WIDTH)) (
  input [WIDTH-1:0]data_in,
  output reg [OUT_WIDTH-1:0] data_out,
  output reg valid
);
  integer i;
  
  always @(*) begin
    data_out = {OUT_WIDTH{1'b0}};
    valid    = 1'b0;
    
    for(i = WIDTH-1; i >= 0; i = i-1) begin // msb has highest priority
      if(valid == 1'b0 && data_in[i]) begin
        data_out = i[OUT_WIDTH-1:0];
        valid    = 1'b1;
      end
    end
  end
  
endmodule

// testbench
module encoder_8_3_tb;
  
  parameter WIDTH = 8;
  parameter OUT_WIDTH = $clog2(WIDTH); 
  
  reg [WIDTH-1:0] data_in;
  wire [OUT_WIDTH-1:0] data_out;
  wire valid;
  
  integer i;
  
  // instantation
  encoder_8_3 #(.WIDTH(WIDTH),
                .OUT_WIDTH(OUT_WIDTH)) 
  dut_inst(.data_in(data_in),
           .data_out(data_out),
           .valid(valid)
          );
  
  initial begin
    i = 0;
    
    $dumpfile("dump.vcd");
    $dumpvars;
    
    $display("---- %0d:%0d encoder -----", WIDTH, OUT_WIDTH);
    $monitor("time = %0t | data_in = %b | data_out = %b | valid = %0d", $time, data_in, data_out, valid);
    
    // test stimulus
    repeat( 2 ** WIDTH) begin
      data_in = i;	#2;
      i = i + 1;
    end
    
    $finish;
  end
endmodule
