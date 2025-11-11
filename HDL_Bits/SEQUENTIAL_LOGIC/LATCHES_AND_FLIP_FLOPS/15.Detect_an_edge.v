module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    wire [7:0]delay ;
    always @(posedge clk) begin
        delay <= in;
        pedge <= in & (~delay);
    end

endmodule
