module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 
    
    // states 
    parameter [1:0] idle  = 0,
    				start = 1,
   					stop  = 2;
    reg [1:0] state, next;

    // Flip Flop sequential block
    always @(posedge clk or negedge aresetn) begin
        if(!aresetn) 
            state <= idle;
        else
            state <= next;
    end
    
    // Next state combinational block
    always @(*) begin
        next = state;
        case(state)
            idle  : next = (x) ? start : idle;
            start : next = (x) ? start : stop;
            stop  : next = (x) ? start : idle;
            default : next = idle;
        endcase
    end
    
    // output
    assign z = ((state == stop) && (x));
    
endmodule
