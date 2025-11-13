module top_module(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg [63:0] q);   
    
    always @(posedge clk) begin
        if(load)
            q <= data;
        else if(ena) begin
        	case(amount)
            	0: q <= q <<< 1;				// shift left by 1 bit.
                1: q <= q <<< 8;    			// shift left by 8 bits.
                2: q <= $signed(q) >>> 1;  	   	// shift right by 1 bit.
                3: q <= $signed(q) >>> 8;		//shift right by 8 bits.
               	endcase
      	end
        else
                q <= q;
    end         

endmodule
