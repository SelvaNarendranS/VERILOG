module top_module (
    input clk,
    input [2:0] y,
    input x,
    output Y0,
    output z
);
    // state
    parameter [2:0] y0 = 0,
    				y1 = 1,
    				y2 = 2,
    				y3 = 3, 
    				y4 = 4;
    reg [2:0]state, next;
    
    // Sequential Block (The FSM's flip-flops)
	always @(posedge clk) begin
    	state <= next;
	end
    
    // next state combinational block
    always @(*) begin
        case(y)
            y0 : next = (x) ? y1 : y0;
            y1 : next = (x) ? y4 : y1;
            y2 : next = (x) ? y1 : y2;
            y3 : next = (x) ? y2 : y1;
            y4 : next = (x) ? y4 : y3;
        endcase
    end
    
    // output
	assign z = (y == 3'd3) || (y == 3'd4);
    assign Y0 = next[0];

endmodule
