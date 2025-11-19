// Implement a 4:1 mux using case statement.

module mux4_case;
reg [3:0]a;
reg [1:0]select_line;
reg b;

	always@(*) begin
	
		case(select_line)
	
		2'b00 : b = a[3];
		2'b01 : b = a[2];
		2'b10 : b = a[1];
		2'b11 : b = a[0];
		default : b = 2'b00;
	
		endcase
	end

	initial begin

	$monitor("Time = %0t, a = %b select line = %b, b = %b", $time, a, select_line, b);

	// 16 - Conditions(only testing 4)
	a = 4'b1010;
	select_line = 2'b00;  #5 
	select_line = 2'b01;  #5 
	select_line = 2'b10;  #5 
	select_line = 2'b11;  #5

	$finish;
	end

endmodule