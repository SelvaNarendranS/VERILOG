module top_module( 
    input [99:0] in,
    output reg [99:0] out
);
    integer i;
    always @(*) begin
        for(i = 99; i > -1; i = i-1) 
            out[99-i] = in[i];
    end    

endmodule
