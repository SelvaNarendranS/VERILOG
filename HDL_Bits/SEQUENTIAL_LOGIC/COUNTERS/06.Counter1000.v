module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
);
    wire [3:0]s0, m0, h0;
    
    assign c_enable = {(m0 == 4'd9) &(s0 == 4'd9), (s0 == 4'd9), 1'd1};
    assign OneHertz = ((h0 == 4'd9) && (m0 == 4'd9) && (s0 == 4'd9));
    bcdcount counter0 (clk, reset, c_enable[0], s0);
    bcdcount counter1 (clk, reset, c_enable[1], m0);
    bcdcount counter2 (clk, reset, c_enable[2], h0);

endmodule
