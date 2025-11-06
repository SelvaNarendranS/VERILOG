module top_module( 
    input [255:0] in,
    input [7:0] sel,
    output out );

    always @(*) begin  
        for(integer i = 0; i < 256; i++) begin
            case(sel)
                i : out = in[i];  
            endcase
        end
    end                // Select one bit from vector in[]. The bit being selected can be variable. 
    								  // assign out = in[sel];
    
endmodule
