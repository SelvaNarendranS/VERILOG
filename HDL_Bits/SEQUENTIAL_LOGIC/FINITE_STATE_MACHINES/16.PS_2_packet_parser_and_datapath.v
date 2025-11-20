module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done);
    
    parameter s0 = 0,  // byte1
    		  s1 = 1,  // byte2
    		  s2 = 2,  // byte3
    		  s3 = 3;  // done
    reg [1:0]state, next;
    reg [23:0]out_data;

    // State transition logic (combinational)
    always @(*) begin
        case(state)
            s0 : next = (in[3]) ? s1 : s0;
            s1 : next = s2 ;
            s2 : next = s3;
            s3 : next = (in[3]) ? s1 : s0;
        endcase
    end
            
    // State flip-flops (sequential)
    always @(posedge clk) begin
        if(reset) begin
            state <= s0;
            out_data <= 24'd0;
        end
         else begin
             state <= next;
             out_data <= {out_data[15:8], out_data[7:0], in};
         end        
    end
         
    // Output logic
    assign done = (state == s3);
    // New: Datapath to store incoming bytes.
    assign out_bytes = (state == s3) ? out_data : 24'b0;

endmodule
