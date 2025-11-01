module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire carry;
    wire [15:0]mux[1:0];
    
    add16 asum( a[15:0], b[15:0], 0, sum[15:0], carry);
    add16 bsum1( a[31:16], b[31:16], 0, mux[0],);
    add16 bsum2( a[31:16], b[31:16], 1, mux[1],);  
    
    assign sum[31:16] = mux[carry];

endmodule
