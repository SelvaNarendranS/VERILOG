module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 

    parameter LEFT	   = 3'd0, 
    		  RIGHT	   = 3'd1, 
    		  fl 	   = 3'd2, 
    		  fr 	   = 3'd3, 
    		  ld 	   = 3'd4, 
    		  rd       = 3'd5, 
    		  splatter = 3'd6;
    
    reg [2:0]state, next_state;
    reg [8:0]count;    

    always @(*) begin			// State transition logic
        case(state)
            LEFT  : next_state = (ground) ? ((dig) ? ld : ((bump_left) ? RIGHT : LEFT)) : fl;
            RIGHT : next_state = (ground) ? ((dig) ? rd : ((bump_right) ? LEFT : RIGHT)) : fr;
                
            fl : next_state = (ground == 0) ? fl : ((count > 20) ? splatter : LEFT);
            fr : next_state = (ground == 0) ? fr : ((count > 20) ? splatter : RIGHT) ;
            
            ld : next_state = (ground == 0) ? fl : ld;
            rd : next_state = (ground == 0) ? fr : rd;
            splatter : next_state = splatter;  
        endcase
    end

    always @(posedge clk, posedge areset) begin
        if(areset) begin				// State flip-flops with asynchronous reset
            state <= LEFT;
        	count <= 1'b1;
    	end
        else begin
            state <= next_state;
            
            if((state == fl) || (state == fr)) begin
                count <= count + 1'd1;
            end
            else
                count <= 1;
        end
    end

    // Output logic
    assign walk_left  = (state == LEFT);
    assign walk_right = (state == RIGHT);
    assign aaah       = ((state == fl) | (state == fr)); // ~(walk_left || walk_right); 
    assign digging    = ((state == ld) | (state == rd)); //~(walk_left || walk_right || aaah);
    
endmodule
