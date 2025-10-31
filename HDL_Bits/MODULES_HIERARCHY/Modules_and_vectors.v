module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
    
    wire [7:0]dff0, dff1, dff2;
    wire [7:0]mux4[3:0];
    
    // instantiation
    my_dff8 df0(.clk(clk), .d(d), .q(dff0));
    my_dff8 df1(.clk(clk), .d(dff0), .q(dff1));
    my_dff8 df2(.clk(clk), .d(dff1), .q(dff2));
    
    assign mux4[0] = d;
    assign mux4[1] = dff0;
    assign mux4[2] = dff1;
    assign mux4[3] = dff2;
    
    /*always @(*) begin
        case (sel) 
            2'b00 : q = d;
       		2'b01 : q = dff0;
        	2'b10 : q = dff1;
            2'b11 : q = dff2;
        endcase
    end*/
    assign q = mux4[sel];
        

endmodule
