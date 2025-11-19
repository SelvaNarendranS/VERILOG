// Extend the above to 4:1 mux using nested if...else.

module mux2_if;
reg [3:0]a;
reg [1:0]select_line; 
reg b;

	always@(*) begin
		if(select_line == 2'b00)
			b = a[0];
		else if(select_line == 2'b01)
			b = a[1];
		else if(select_line == 2'b10)
                        b = a[2];
		else
                        b = a[3];	
	end

	initial begin
	$monitor("Time = %0t, a = %b select line = %b, b = %b", $time, a, select_line, b);

	// Conditions

	a = 4'b1010; 
	select_line = 2'b00;  #5 
	select_line = 2'b01;  #5 
	select_line = 2'b10;  #5 
	select_line = 2'b11;  #5


	$finish;
	end
endmodule
