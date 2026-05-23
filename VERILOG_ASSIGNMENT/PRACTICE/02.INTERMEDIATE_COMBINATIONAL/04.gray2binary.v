// binary to gray

// DUT
module gray2binary #(parameter WIDTH = 8) (
  input [WIDTH-1:0]  gray,
  output [WIDTH-1:0] binary
);
  
  assign binary[WIDTH-1] = gray[WIDTH-1];
  
  genvar i;
  generate    
    for(i = WIDTH-2; i >= 0; i--) begin : binary_conv
      assign binary[i] = (binary[i+1] ^ gray[i]);
    end
  endgenerate
      
endmodule

// testbench
module gray2binary_tb;
  
  parameter WIDTH = 8;
  
  reg [WIDTH-1:0] gray;
  wire [WIDTH-1:0] binary;
  
  // instantation
  gray2binary #(.WIDTH(WIDTH)) dut_inst (.gray(gray),
                                         .binary(binary)
                                        );
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    
    $display("--------- Gray to Binary -------");
    $monitor("Time=%0d | gray = %0d(%b) | binary = %0d(%b)",  $time, gray, gray, binary, binary);
    
    // test stimulus    
    repeat(5) begin
      gray = $random;		#2;
    end
    
    #4;
    $finish;
  end
endmodule
