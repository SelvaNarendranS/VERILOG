module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
	// States
    parameter start = 0,
   			  comp  = 1;
    reg state, next;
  
    // Flip Flop sequential block
    always @(posedge clk or posedge areset) begin
        if(areset)
            state <= start;
        else
            state <= next;
    end
    
    // Next state combinational block
    always @(*) begin
        next = state;
        z = 0;
        case(state)
            start : begin
                if(x) begin
                    next = comp;
                    z = 1;
                end
                else begin
                    next = start;
                    z = 0;
                end
            end
          
            comp : begin
                if(x) begin
                    next = comp;
                    z = 0;
                end
                else begin
                    next = comp;
                    z = 1;
                end
            end
        endcase
    end 
    
endmodule
