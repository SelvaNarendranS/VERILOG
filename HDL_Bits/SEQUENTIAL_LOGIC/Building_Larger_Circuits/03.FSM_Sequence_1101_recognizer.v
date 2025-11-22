module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);

    // states
    parameter [2:0] idle  = 0,
    				start = 1,
    				look  = 2,
    				find  = 3,
    				stop  = 4;
    reg [2:0]state, next;
    
    // Flip flop sequential block
    always @(posedge clk) begin
        if(reset)
            state <= idle;
        else
            state <= next;
    end
    
    // next state combinational block
    always @(*) begin
        next = state;
        case(state)
            idle  : next = (data) ? start : idle; 
            start : next = (data) ? look : idle; 
            look  : next = (data) ? look : find; 
            find  : next = (data) ? stop : idle;
            stop  : next = stop;
        endcase
    end
    
    // output
    assign start_shifting = (state == stop);
endmodule
