module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire carry;
    wire [31:0]xorg;
    
    assign xorg = {32{sub}} ^ b; 
    add16 one( a[15:0], xorg[15:0], sub, sum[15:0], carry);
    add16 two( a[31:16], xorg[31:16], carry, sum[31:16],);   

endmodule
