module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done);
    
    parameter s0 = 0,  // byte1
    		  s1 = 1,  // byte2
    		  s2 = 2,  // byte3
    		  s3 = 3;  // done
    reg [1:0]state, next;

    // State transition logic (combinational)
    always @(*) begin
        case(state)
            s0 : next = (in[3]) ? s1 : s0;
            s1 : next = (in[3] || ~in[3]) ? s2 : s2;
            s2 : next = (in[3] || ~in[3]) ? s3 : s3;
            s3 : next = (in[3]) ? s1 : s0;
        endcase
    end
            
    // State flip-flops (sequential)
    always @(posedge clk) begin
        if(reset)
            state <= s0;
         else
             state <= next;
    end
         
    // Output logic
    assign done = (state == s3);

endmodule
