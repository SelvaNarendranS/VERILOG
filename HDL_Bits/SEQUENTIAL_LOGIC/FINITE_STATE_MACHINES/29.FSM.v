module top_module (
    input clk,
    input reset,     // synchronous reset
    input w,
    output z);
    
    // state
    parameter [3:1] a = 0,
    				b = 1,
    				c = 2,
    				d = 3,
    				e = 4,
    				f = 5;
    reg [3:1]state, next;
    
    // Flip flop sequential block
    always @(posedge clk) begin
        if(reset)
            state <= a;
        else
            state <= next;
    end
    
    // next state combinational block
    always @(*) begin
        case(state)
            a : next = (w) ? a : b;
            b : next = (w) ? d : c;
            c : next = (w) ? d : e;
            d : next = (w) ? a : f;
            e : next = (w) ? d : e;
            f : next = (w) ? d : c;
        endcase
    end
    
    // output
    assign z = ((state == e) || (state == f));
    
endmodule
