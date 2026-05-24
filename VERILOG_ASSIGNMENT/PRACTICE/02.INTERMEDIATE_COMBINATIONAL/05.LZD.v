// leading zero detector

// dut
module lzd #(parameter WIDTH = 8) (
  input [WIDTH-1:0] a,
  output reg [$clog2(WIDTH):0] zero		// total zero from MSB to first high
);
  integer i;
  reg found1;
  
  always @(*) begin
    // default
    found1 = 0;
    zero   = WIDTH;
    
    for(i = WIDTH-1; i >= 0; i--) begin
      if((a[i] == 1'b1) && !found1) begin
        zero = (WIDTH-1) - i;
        found1 = 1'b1;
      end
    end
  end
  
endmodule

// testbench
module lzd_tb;
  
  parameter WIDTH = 8;
  
  reg [WIDTH-1:0] a;
  wire [$clog2(WIDTH):0] zero;
  
  // instantation
  lzd #(.WIDTH(WIDTH)) dut_inst (.a(a),
                                         .zero(zero)
                                        );
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    
    $display("--------- Leading zero detector -------");
    $monitor("Time=%0d | a = (%b) | zero = %0d",  $time, a, zero);
    
    // test stimulus
    
    a = 8'b0000_0000; #2;		// all zero case
    
    a = 8'b1111_1111; #2;		// all high case
    
    repeat(5) begin
      a = $random;		#2;
    end
    
    #4;
    $finish;
  end
endmodule
