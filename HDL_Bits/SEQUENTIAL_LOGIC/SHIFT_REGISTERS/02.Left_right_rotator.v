module top_module(
    input clk,
    input load,
    input [1:0] ena,
    input [99:0] data,
    output reg [99:0] q);  
    
    always @(posedge clk) begin
		if(load || ena) begin
            if(load)
                q <= data;
            else if(ena) begin
                case(ena)
                	0: q <= q;
                    1: q <= {q[0], q[99:1]};      // input rotates by right
                    2: q <= {q[98:0], q[99]};     // input rotates by left
                    3: q <= q;
                endcase
            end
        end
    end         
    
endmodule
