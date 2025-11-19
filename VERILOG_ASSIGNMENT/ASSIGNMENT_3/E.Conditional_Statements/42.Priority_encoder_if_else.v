// Simulate a logic block using if-else if-else for priority-based selection.

module priority_encoder4_2;
reg [3:0]a;
reg enable;
reg [1:0]b;
reg v;

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
		if(a == 4'b1000)      begin b = 2'b11; v = 1; end // Highest priority a3
		else if(a == 4'b0100) begin b = 2'b10; v = 1; end
		else if(a == 4'b0010) begin b = 2'b01; v = 1; end
		else if(a == 4'b0001) begin b = 2'b00; v = 1; end // Lowest priority a0
		else                  begin b = 2'bxx; v = 0; end
	  end
        end 
    	else begin
      	   b = 2'bzz;
     	   v = 0;
	end
	end

     initial begin
	
	$monitor("Time = %0t | enable = %b | a = %b |  b = %b | v = %b ", $time, enable, a, b, v);

	// conditions
	enable = 0; a = 4'b0000; #5;  // Disabled condition
    	enable = 1; a = 4'b0000; #5;  // No valid input
	a = 4'b0001; #5
        a = 4'b0010; #5
        a = 4'b0100; #5
        a = 4'b1000; #5
        a = 4'b0110; #5
        a = 4'b1110; #5

	enable = 0; #5 // final disable

	$finish;
	end

endmodule 
