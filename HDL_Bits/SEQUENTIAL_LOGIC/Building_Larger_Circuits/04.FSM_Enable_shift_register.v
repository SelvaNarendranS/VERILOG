module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);
    
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
        
     always @(*) begin
         case(state)
             idle : begin
                 next = start;
                 shift_ena = 1'b1;
             end
             start : begin
                 next = look;
                 shift_ena = 1'b1;
             end
             look : begin
                 next = find;
                 shift_ena = 1'b1;
             end
             find : begin
                 next = stop;
                 shift_ena = 1'b1;
             end
             stop : begin
                 next = stop;
                 shift_ena = 1'b0;
             end
         endcase
     end
        
endmodule
