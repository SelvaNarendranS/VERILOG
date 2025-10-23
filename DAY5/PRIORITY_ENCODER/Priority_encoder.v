// Behavioral model

module priority_encoder4_2 (
input [3:0]a,
input enable,
output reg [1:0]b,
output reg v);

	always @(a or enable) 
	begin
	 if(enable) 
	 begin
	  if (a == 4'b0000) 
	  begin
		v = 0;
		b = 2'bxx;
	  end

	  else begin
        	casez (a)
         	 4'b1???: begin b = 2'b11; v = 1; end // Highest priority a3
          	 4'b01??: begin b = 2'b10; v = 1; end
          	 4'b001?: begin b = 2'b01; v = 1; end
         	 4'b0001: begin b = 2'b00; v = 1; end // Lowest priority a0
         	 default: begin b = 2'bxx; v = 0; end
       		 endcase
      	  end
          end 
    	else begin
      	   b = 2'bzz;
     	   v = 0;
	end
	end

endmodule 
	