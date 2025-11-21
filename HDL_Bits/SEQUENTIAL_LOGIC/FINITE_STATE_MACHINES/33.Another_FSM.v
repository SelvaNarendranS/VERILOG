module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output f,
    output g
); 
    // states
    parameter [3:0] a      = 0,
    				b      = 1,
    				c      = 2,
    				start  = 3,
    				zero   = 4,
    				stop   = 5,
    				y0     = 6,
    				y1     = 7,
    				y0done = 8,
    				done   = 9;
    reg [3:0]state, next;
    
    // Flip flop sequential block
    always @(posedge clk) begin
        if(!resetn)
            state <= a;
        else
            state <= next;
    end
    
    // Next state combinational block
    always @(*) begin
        case(state)
            a     : next = (resetn) ? b : a ;
            b     : next = c;
            c     : next = (x) ? start : c;
            start : next = (x) ? start : zero;
            zero  : next = (x) ? stop : c;
            stop  : next = (y) ? y1 : y0;
            y0    : next = (y) ? done : y0done;
            y1    : next = done;
            y0done: next = y0done;
            done  : next = done;
        endcase
    end
          
    // output
    assign f = (state == b);
    assign g = ((state == stop) || (state == done) || (state == y0) || (state == y1));
            
endmodule
