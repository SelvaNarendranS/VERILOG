// binary to gray

// DUT
module binary2gray #(parameter WIDTH = 8) (
  input [WIDTH-1:0]  binary,
  output [WIDTH-1:0] gray
);
  
  assign gray = binary ^ (binary >> 1); 
    
endmodule

// testbench
module binary2gray_tb;
  
  parameter WIDTH = 8;
  
  reg [WIDTH-1:0] binary;
  wire [WIDTH-1:0] gray;
  
  // instantation
  binary2gray #(.WIDTH(WIDTH)) dut_inst (.binary(binary),
                                            .gray(gray)
                                           );
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    
    $display("--------- Binary to gray -------");
    $monitor("Time=%0dt | binary = %0d(%b) | gray = %0d(%b)",  $time, binary, binary, gray, gray);
    
    // test stimulus    
    repeat(5) begin
      binary = $random;		#2;
    end
    
    #4;
    $finish;
  end
endmodule
