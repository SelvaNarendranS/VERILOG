module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right);

    parameter LEFT=0, RIGHT=1;
    reg state, next_state;

    always @(*) begin
        next_state = 1'bx; 			// State transition logic
        case(state)
            LEFT  : next_state = (((bump_left == 1) &&(bump_right == 0)) || (bump_left && bump_right)) ? RIGHT : LEFT;
            RIGHT : next_state = (((bump_left == 0) &&(bump_right == 1)) || (bump_left && bump_right)) ? LEFT : RIGHT;
        endcase
    end

    always @(posedge clk, posedge areset) begin
        if(areset)				// State flip-flops with asynchronous reset
            state <= LEFT;
        else
            state <= next_state;
    end

    // Output logic
    assign walk_left  = (state == LEFT);
    assign walk_right = (state == RIGHT);

endmodule
