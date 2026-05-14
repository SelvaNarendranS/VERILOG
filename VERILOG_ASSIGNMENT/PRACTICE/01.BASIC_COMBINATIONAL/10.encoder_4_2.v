// 4:2 encoder

// dut
module encoder_4_2(
  input [3:0]data_in,
  output reg [1:0] data_out,
  output reg valid
);
  
  always @(*) begin
    valid = 1'b1;
    
    case(data_in)
      4'b0001 : data_out = 2'b00;
      4'b0010 : data_out = 2'b01;
      4'b0100 : data_out = 2'b10;
      4'b1000 : data_out = 2'b11;
      default : begin
        data_out = 2'b00;
        valid    = 1'b0;
      end
    endcase
  end
  
endmodule

// testbench
module encoder_4_2_tb;
  reg [3:0] data_in;
  wire [1:0] data_out;
  wire valid;
  
  // instantation
  encoder_4_2 dut_inst(.data_in(data_in),
                       .data_out(data_out),
                       .valid(valid)
                      );
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    
    $display("---- 4:2 encoder -----");
    $monitor("time = %0t | data_in = %b | data_out = %b | valid = %0d", $time, data_in, data_out, valid);
    
    // test stimulus
    data_in = 4'b0000;		#2;
    data_in = 4'b0001;		#2;
    data_in = 4'b0010;		#2;
    data_in = 4'b0100;		#2;
    data_in = 4'b1000;		#2;
    data_in = 4'b1110;		#2;
    
    $finish;
  end
endmodule
