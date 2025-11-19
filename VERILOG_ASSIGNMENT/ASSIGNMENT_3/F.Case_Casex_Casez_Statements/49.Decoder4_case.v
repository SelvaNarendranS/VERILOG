// Simulate a bus decoder using case with default statement.

module decoder4_case;
reg [2:0]a;
reg [3:0]b;

	always @(*) begin

		case(a)
		3'b001: b = 4'b0001;
        	3'b010: b = 4'b0010; 
        	3'b011: b = 4'b0100;
		3'b100: b = 4'b1000; 
		default b = 4'b0000;
		endcase
	end

	initial begin
	
	$monitor("Time = %0t | a = %b |  b = %b |( b[3] = %b | b[2] = %b | b[1] = %b | b[0] = %b )", $time, a, b, b[3], b[2], b[1], b[0]);

	// conditions
	a = 3'b001; #5
        a = 3'b010; #5
        a = 3'b011; #5
        a = 3'b100; #5
        a = 3'b101; #5

	$finish;
	end


endmodule 
	
