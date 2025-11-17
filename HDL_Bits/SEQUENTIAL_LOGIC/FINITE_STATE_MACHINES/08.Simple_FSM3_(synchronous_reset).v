module top_module(
    input clk,
    input in,
    input reset,
    output out); //

    // State transition logic
    parameter A = 0,
    		  B = 1,
              C = 2,
    		  D = 3;
    reg [1:0]state, next_state;

    // State flip-flops with synchronous reset
    always @(posedge clk) begin
        if(reset)
            state <= A;
        else
            state <= next_state;
    end
    
    always @(*) begin
        next_state = 1'bx;
        case(state) 
            A : next_state = (in == 0) ? A : B;
            B : next_state = (in == 0) ? C : B;
            C : next_state = (in == 0) ? A : D;
            D : next_state = (in == 0) ? C : B;
        endcase
    end
    
    // Output logic
    assign out = (state == D);

endmodule
