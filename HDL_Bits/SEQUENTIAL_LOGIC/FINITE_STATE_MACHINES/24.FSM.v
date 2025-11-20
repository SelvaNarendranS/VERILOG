module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);
    // states
    parameter a = 0,
    		  b = 1;
    reg state, next;
    reg [1:0]count3, count2;
    
    // Flip flop sequential block
    always @(posedge clk) begin
        if(reset)
            state <= a;
        else
            state <= next;
    end
    
    // count calculation 
    always @(posedge clk) begin
        if(reset) begin
            count3 <= 0;   // 3 clock pulse counter
        	count2 <= 0;   // count 2 1's in 3 clock pulse
        end
        else begin
            if(state == b) begin
                if(count3 == 3) begin
                    count3 = 0;
					count2 = 0; 
                end
                if(w==1)
                        count2 = count2 + 1;
            count3 = count3 + 1;
            end
        end
    end
                        
    // next state combinational block
    always @(*) begin
        case(state)
            a : next = (s) ? b : a;
            b : next = b;
        endcase
    end
    
    // output
    assign z = ((count2 == 2) & (count3 == 3));        
                
endmodule
