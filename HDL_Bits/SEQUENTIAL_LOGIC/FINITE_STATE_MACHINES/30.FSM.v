module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    input w,
    output z
);

    // state
    parameter [2:0] a = 0,
    				b = 1,
    				c = 2,
    				d = 3,
    				e = 4,
    				f = 5;
    reg [2:0]state, next;
    
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
            a : next = (w) ? b : a;
            b : next = (w) ? c : d;
            c : next = (w) ? e : d;
            d : next = (w) ? f : a;
            e : next = (w) ? e : d;
            f : next = (w) ? c : d;
        endcase
    end
    
    // output
    assign z = ((state == e) || (state == f));
    
endmodule
