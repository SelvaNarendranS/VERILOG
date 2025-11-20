module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);
   
    /* // FSM build by sequence detector
    // states
    parameter [3:0] s0 = 0,
    				s1 = 1,
    				s2 = 2,
    				s3 = 3,
    				s4 = 4,
    				s5 = 5,
    				s6 = 6,
    				s7 = 7,
    				s8 = 8,
    				s9 = 9;
    reg [3:0]state, next_state;
    
    
    // Flip Flop sequential block
    always @(posedge clk) begin
        if(reset)
            state <= s0;
        else
            state <= next_state;
    end
    
    // Combinational block next state assigning
    always @(*) begin
        next_state = 1'bx;
        case(state)
            s0 : next_state = (in) ? s1 : s0;  // idle
            s1 : next_state = (in) ? s2 : s0;  // 1
            s2 : next_state = (in) ? s3 : s0;  // 11
            s3 : next_state = (in) ? s4 : s0;  // 111
            s4 : next_state = (in) ? s5 : s0;  // 1111
            s5 : next_state = (in) ? s7 : s6;  // 11111
            s6 : next_state = (in) ? s1 : s0;  // disc 111110
            s7 : next_state = (in) ? s9 : s8;  // 111111
            s8 : next_state = (in) ? s1 : s0;  // flag 1111110
            s9 : next_state = (in) ? s9 : s0;  // error 1111111..
        endcase
    end
    
    // output
    assign disc = (state == s6);
    assign flag = (state == s8);
    assign err  = (state == s9);
*/
    // FSM build by count b/w states
    // states
    parameter [2:0] idle = 0,
    			  centre = 1,
    				disc_s = 2,
    				flag_s = 3,
    				err_s  = 4;
    reg [2:0]state, next;
    reg [3:0]count;
    
    // Flip Flop sequential block
    always @(posedge clk) begin
        if(reset)
            state <= idle;
        else
            state <= next;
    end
    
    // Count calculation
    always @(posedge clk) begin
        if(reset) begin
            count <= 1'd0;
        end
        else begin
            if(state != centre)
                count <= 1'd0;
            else if(in)
                count <= count + 1'b1;
        end
    end
    
    // Combinational block next state assigning
    always @(*) begin
        next = state;
        case(state)
            idle   : next = (in) ? centre : idle;
            centre : begin 
                if(in) begin 
                    if(count > 4)
                        next = err_s;
                    else
                        next = centre;
                end
                else begin
                    if(count == 4)
                        next = disc_s;
                    else if(count == 5)
                        next = flag_s;
                    else
                        next = idle;
                end
            end
          disc_s  : next = (in) ? centre : idle;
          flag_s  : next = (in) ? centre : idle;
          err_s   : next = (in) ? err_s : idle;
        endcase     
    end

        // output
        assign disc = (state == disc_s);
        assign flag = (state == flag_s);
        assign err  = (state == err_s);
        
endmodule
