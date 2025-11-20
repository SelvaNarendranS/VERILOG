module top_module (
    input [3:1] y,
    input w,
    output Y2);

    // state
    parameter [3:1] a = 0,
    				b = 1,
    				c = 2,
    				d = 3,
    				e = 4,
    				f = 5;
    reg [3:1]next;
    
    // next state combinational block
    always @(*) begin
        case(y)
            a : next = (w) ? a : b;
            b : next = (w) ? d : c;
            c : next = (w) ? d : e;
            d : next = (w) ? a : f;
            e : next = (w) ? d : e;
            f : next = (w) ? d : c;
        endcase
    end
    
    // output
    assign Y2 = next[2];
    
endmodule
