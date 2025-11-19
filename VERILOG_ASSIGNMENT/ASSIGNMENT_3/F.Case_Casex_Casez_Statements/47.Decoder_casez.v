// Use casez to implement a pattern-matching decoder.

module decoder4_casez;
reg [2:0]a;
reg [3:0]b;

	always @(*) begin

		casez(a)
		3'b1z0: b = 4'b0001;  // 110 or 100
        	3'b0?1: b = 4'b0010;  // 011 or 001
        	3'b??0: b = 4'b0100;  // x x 0
		default b = 4'b1000;
		endcase
	end

	initial begin
	
	$monitor("Time = %0t | a = %b |  b = %b |( b[3] = %b | b[2] = %b | b[1] = %b | b[0] = %b )", $time, a, b, b[3], b[2], b[1], b[0]);

	// conditions
	a = 3'b100; #5
        a = 3'b101; #5
        a = 3'b110; #5
        a = 3'b111; #5

	$finish;
	end


endmodule 
	
