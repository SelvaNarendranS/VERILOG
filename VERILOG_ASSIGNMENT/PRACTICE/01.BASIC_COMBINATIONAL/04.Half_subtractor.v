// half_subtractor

// DUT
module half_subtractor(
  input a,
  input b,
  output [1:0] assign_out,			// {borrow, difference}
  output reg [1:0] always_out		// {borrow, difference}
);
  
  // Data flow modeling
  assign assign_out[0] = a ^ b;		// difference
  assign assign_out[1] = ~a & b;	// borrow
  
  // behavioral modeling
  always @(*) begin
    always_out = {(~a & b), (a ^ b)};
  end
  
endmodule

// TESTBENCH
module half_subtractor_tb;
  wire [1:0] assign_out;
  wire [1:0] always_out;
  reg a;
  reg b;
  
  // instantation
  half_subtractor dut_inst(.a(a), 
                      .b(b),
                      .assign_out(assign_out),
                      .always_out(always_out)
                     );
  
  initial begin
    $dumpfile ("dump.vcd");
    $dumpvars(0, half_subtractor_tb);
    
    $display("----- Half subtractor --------");
    $monitor("time = %0t | a = %0b | b = %0b | assign difference = %0b | assign borrow = %0b | always difference = %0b | always borrow = %0b", 
             $time, a, b,
             assign_out[0], assign_out[1], 
             always_out[0], always_out[1]);
    
    // test stimulus
    a = 0; b = 0; 	#2;
    a = 0; b = 1; 	#2;
    a = 1; b = 0; 	#2;
    a = 1; b = 1; 	#2;
    
    $finish;
  end
  
endmodule
