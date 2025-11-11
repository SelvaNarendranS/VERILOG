module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    wire [31:0] previous_in;
    //assign previous_in = in;
    
    always @(posedge clk) begin
        if(reset)
            out <= 1'b0;
        else begin
            out <= out | (previous_in & ~in);   
        end
        previous_in <= in;
    end

endmodule
