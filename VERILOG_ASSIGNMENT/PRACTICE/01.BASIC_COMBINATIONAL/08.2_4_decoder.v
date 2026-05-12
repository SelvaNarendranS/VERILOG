// decoder 2:4

// dut -- One-hot outputs
module decoder_2_4(
  input [1:0] data_in,
  output reg [3:0] data_out
);
  
  always @(*) begin
    case(data_in)
      2'b00 : data_out = 4'b0001;
      2'b01 : data_out = 4'b0010;
      2'b10 : data_out = 4'b0100;
      2'b11 : data_out = 4'b1000;
      default : data_out = 4'b0000;
    endcase
  end
  
endmodule

// testbench 

module decoder_2_4_tb;
  reg [1:0] data_in;
  wire [3:0] data_out;
  
  // instantation
  decoder_2_4 inst_dut (.data_in(data_in),
                        .data_out(data_out)
                       );
  
  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars;
    
    $display("---- 2:4 decoder -----");
    $monitor("time = %0t | data_in = %b | data_out = %b", $time, data_in, data_out);
    
    // test stimulus
    data_in = 2'b00; #2;
    data_in = 2'b01; #2;
    data_in = 2'b10; #2;
    data_in = 2'b11; #2;
    
    $finish;
  end
endmodule
