// Use nested if statements to implement an encoder.

module encoder_if;
reg [3:0]a;
reg [1:0]b;

	always@(*) begin
		if(a == 4'd1)
			b = 2'b00;
		else if(a == 4'd2)
			b = 2'b01;
		else if(a == 4'd4)
                        b = 2'b10;
		else if(a == 4'd8)
                        b = 2'b11;
		else
                        b = 2'b00;
	end	

	initial begin
		$monitor("Time = %0t | a = %b |  b = %b ", $time, a, b,);

		// conditions
		a = 4'b0001; #5
        	a = 4'b0010; #5
        	a = 4'b0100; #5
        	a = 4'b1000; #5

	$finish;
	end

endmodule 