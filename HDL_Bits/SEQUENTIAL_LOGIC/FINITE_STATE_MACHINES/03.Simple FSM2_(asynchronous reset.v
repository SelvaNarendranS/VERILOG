module top_module(
    input clk,
    input areset,    // Asynchronous reset to OFF
    input j,
    input k,
    output out);  

    parameter OFF=0, ON=1; 
    reg state, next_state;

    always @(*) begin
        next_state <= 1'bx;		// State transition logic
        case(state)
            ON  : next_state <= (k == 1) ? OFF : ON;
            OFF : next_state <= (j == 1) ? ON : OFF;
        endcase
    end

    always @(posedge clk, posedge areset) begin
        if(areset)			// State flip-flops with asynchronous reset
            state <= OFF;
        else
            state <= next_state;
    end

    // Output logic
    assign out = (state == ON);

endmodule
