module top_module (
    input clk,
    input areset,
    input x,
    output z
); 

    parameter [1:0] idle  = 0,
    				start = 1,
   					comp  = 2;
    reg [1:0] state, next;

    // Flip Flop sequential block
    always @(posedge clk or posedge areset) begin
        if(areset) 
            state <= idle;
        else
            state <= next;
    end
    
    // Next state combinational block
    always @(*) begin
        next = state;
        case(state)
            idle  : next = (x) ? start : idle;
            start : next = (x) ? comp : start;
            comp  : next = (x) ? comp : start;
            default : next = idle;
        endcase
    end
    
    // output
    assign z = (state == start);
    
endmodule
