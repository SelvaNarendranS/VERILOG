// 4:2 encoder

// dut
module priority_encoder_4_2(
  input [3:0]data_in,
  output reg [1:0] data_out,
  output reg valid
);
  
  always @(*) begin
    valid = 1'b1;
    
    casez(data_in)
      4'b0001 : data_out = 2'b00;		// LSB has highest priority
      4'b001? : data_out = 2'b01;
      4'b01?? : data_out = 2'b10;
      4'b1??? : data_out = 2'b11;		
      default : begin
        data_out = 2'b00;
        valid    = 1'b0;
      end
    endcase
  end
  
endmodule

// testbench
module priority_encoder_4_2_tb;
  reg [3:0] data_in;
  wire [1:0] data_out;
  wire valid;
  
  integer i;
  
  // instantation
  priority_encoder_4_2 dut_inst(.data_in(data_in),
                       .data_out(data_out),
                       .valid(valid)
                      );
  
  initial begin
    i = 0;
    
    $dumpfile("dump.vcd");
    $dumpvars;
    
    $display("---- 4:2 priority encoder -----");
    $monitor("time = %0t | data_in = %b | data_out = %b | valid = %0d", $time, data_in, data_out, valid);
    
    // test stimulus
    repeat(32) begin
      data_in = i;	#2;
      i = i + 1;
    end
    
    $finish;
  end
endmodule
