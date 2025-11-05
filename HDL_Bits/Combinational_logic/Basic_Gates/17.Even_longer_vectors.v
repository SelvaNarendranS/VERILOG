module top_module( 
    input [99:0] in,
    output [98:0] out_both,
    output [99:1] out_any,
    output [99:0] out_different );
    
    integer i;
    
    always @(*) begin
        for(i = 99; i > -1; i--) begin
            if(i < 99)
                out_both[i] = in[i] & in[i+1];
            if(i < 100 && i > 0)
                out_any[i] = in[i] | in[i-1];
            if(i < 100)
                out_different[i] = in[i] ^ in[(i+1)%100];
        end
    end
    
endmodule
