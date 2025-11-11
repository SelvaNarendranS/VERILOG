module top_module (
    input clk,
    input d,
    output q
);
	wire previ_q,present_q;
    
    always @(posedge clk) begin
        previ_q <= d;
    end
    
    always @(negedge clk) begin
        present_q <= d;
    end
    
    assign q = (clk) ? previ_q : present_q;
        
endmodule
