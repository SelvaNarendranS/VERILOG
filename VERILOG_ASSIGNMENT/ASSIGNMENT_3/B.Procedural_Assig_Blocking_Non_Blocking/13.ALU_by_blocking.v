// Create a simple ALU module using only blocking assignments.

module alu;
	reg [4:0]a, b;
	reg [1:0]select;
	reg [5:0]result;

	always @(*) begin
		case(select)
			0 : result = a + b;
			1 : result = a - b;
			2 : result = a & b;
			3 : result = a | b;
			default : result = 1'bz;
		endcase
	end

	always @(*)
		$display("Time = %0t, A = %b(%d), B = %b(%d), select = %b(%d) '%s', result = %b(%d)",$time, a, a, b, b, select, select, ((select == 00) ? "add" : (select == 01) ? "sub" : (select == 2'b10) ? "bitwise and" : (select == 2'b11) ? "bitwise or" : "None"), result, result);

	initial begin

		// test case
		for (integer i = 0; i < 4; i = i + 1) begin
			a = $random; 
            		b = $random; 
            		select = i; #5;
		end

	#7 $finish;
	end

endmodule

