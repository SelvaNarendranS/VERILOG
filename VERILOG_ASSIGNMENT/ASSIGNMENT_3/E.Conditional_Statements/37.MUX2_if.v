// Implement a 2:1 multiplexer using if statement.

module mux2_if;
reg [1:0]a;
reg select_line; 
reg b;

	always@(*) begin
		if(select_line == 1'b0)
			b = a[0];
		else
			b = a[1];	
	end

	initial begin
	$monitor("Time = %0t, a[0] = %b, a[1] = %b select line = %b, b = %b", $time, a[0], a[1], select_line, b);

	// Conditions

	a = 2'b00; select_line = 0;  #5
	a = 2'b01; select_line = 0;  #5
	a = 2'b10; select_line = 1;  #5
	a = 2'b11; select_line = 1;  #5

	$finish;
	end
endmodule
