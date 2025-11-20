module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 
    // states
    parameter [2:0] idle  = 0,
    				start = 1,
    				data  = 2,
    				stop  = 3,
    				error = 4;
    reg [2:0]state, next_state;
    reg [3:0]count;
    
    // State transition logic (combinational)
    always @(*) begin
        case(state)
            idle  : next_state = (~in) ? start : idle;
            start : next_state = data;
            data  : next_state = ((count == 4'd7) ? ((in) ? stop : error) : data);
            error : next_state = (~in) ? error : idle;
            stop  : next_state = (~in) ? start : idle;
            default : next_state = idle;
        endcase
    end

    // State flip-flops (sequential)
    always @(posedge clk) begin
        if(reset) begin
            state <= idle;
            count <= 0;
        end
        else begin
            state <= next_state;
            
            case(state)
                data : begin
                   	count <= count + 1;
                end
                
                stop : begin
                    count <= 0;
                end
                
                default : begin
                    count <= 0;
                end
            endcase
        end
    end
 
    // Output logic
    assign done =(state == stop);
    

endmodule
