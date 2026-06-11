/* Q3. Carry Lookahead Adder using generate
Design a 16-bit Carry Lookahead Adder (CLA) using the generate construct. Implement the generate (G) and propagate (P) logic.
Specifications:
•	Inputs: a[15:0], b[15:0], cin
•	Outputs: sum[15:0], cout, overflow
•	Generate G and P signals for each bit using a genvar loop
•	Compare simulation results against a behavioral reference model
•	Use $display to print intermediate G and P values in simulation  */

module cla(
  input [15:0] a, b, 
  input cin,
  output [15:0] sum,
  output cout, overflow
);
  
  wire [15:0]p, g;
  wire [16:0] c;
  assign c[0] = cin;
  
  genvar i;
  generate
    for(i = 0; i <= 15; i++) begin : cla_add
      assign p[i] = a[i] ^ b[i];
      assign g[i] = a[i] & b[i];
      
      assign sum[i] = p[i] ^ c[i];
      assign c[i+1] = g[i] | (p[i] & c[i]);
    end
  endgenerate
  
  assign cout = c[16];
  assign overflow = (c[15] ^ c[16]);
  
endmodule

module tb;
  reg [15:0]a, b; 
  reg c;
  wire [15:0]sum;
  wire carry, overflow;
  
  cla inst (a, b, c, sum, carry, overflow);
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    
    a = 0;
    b = 0;
    c = 0; #2;
    
    
    a = 65532;
    b = 4; 
    c = 1;		#4;
    
  end
endmodule
