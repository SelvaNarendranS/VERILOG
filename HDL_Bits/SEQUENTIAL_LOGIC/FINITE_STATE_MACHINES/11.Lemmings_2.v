module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 

    parameter LEFT=0, RIGHT=1, fl = 2, fr = 3;
    reg [1:0]state, next_state;

    always @(*) begin
        next_state = 1'bx; 			// State transition logic
        case(state)
            LEFT  : begin
                next_state = (((bump_left == 1) &&(bump_right == 0)) || (bump_left && bump_right)) ? RIGHT : LEFT;
                if(!ground)
                    next_state = fl;
            end
            
            RIGHT : begin
                next_state = (((bump_left == 0) &&(bump_right == 1)) || (bump_left && bump_right)) ? LEFT : RIGHT;
                if(!ground)
                    next_state = fr;
            end
                
            fl    : next_state = (ground == 0) ? fl : LEFT;
            
            fr    : next_state = (ground == 0) ? fr : RIGHT;
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
    assign aaah       = ((state == fl) || (state == fr)); // ~(walk_left || walk_right); 

endmodule
