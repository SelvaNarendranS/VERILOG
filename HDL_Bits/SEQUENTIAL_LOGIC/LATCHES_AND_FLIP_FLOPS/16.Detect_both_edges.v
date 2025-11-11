module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    wire [7:0]notin;
    always @(posedge clk) begin
        notin <= in;
        	anyedge <= notin ^ in;
    end
endmodule
