module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input [3:1] r,   // request
    output [3:1] g   // grant
); 
    // states
    parameter [3:1] a = 0, //3'b000,
    				b = 1, //3'b001,
    				c = 2, //3'b010,
    				d = 3; //3'b011;
    reg [2:0]state, next;
    
    // Flip flop sequential block
    always @(posedge clk) begin
        if(!resetn)
            state <= a;
        else
            state <= next;
    end
    
    // next states combinational block
    always @(*) begin
        next = state;
        case(state)
            a : next = (r[1]) ? b : (r[2] & ~r[1]) ? c : ((~r[1]) & ~r[2] & r[3] ? d : a);
            b : next = (r[1]) ? b : a;
            c : next = (r[2]) ? c : a;
            d : next = (r[3]) ? d : a;
            default : next = a;
        endcase
    end
    
    // output
    assign g = {(state == d), (state == c), (state == b)};

endmodule
