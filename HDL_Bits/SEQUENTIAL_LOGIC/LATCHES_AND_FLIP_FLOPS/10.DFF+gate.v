module top_module (
    input clk,
    input in, 
    output out);

    always @(posedge clk) begin
        if(in || !in)
            out <= (out ^ in);
    end
endmodule
