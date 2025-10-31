module top_module ( input clk, input d, output q );
    
    wire [1:0]dffq;
    my_dff(.clk(clk), .d(d), .q(dffq[0]));
    my_dff(.clk(clk), .d(dffq[0]), .q(dffq[1]));
    my_dff(.clk(clk), .d(dffq[1]), .q(q));

endmodule
