// Use a while loop to shift a register left until MSB is 1.

module shift_until_msb;
	reg [7:0]data;
	integer count;

	initial begin 
		data = 8'b0000_0110;
		count = 0;

		while(data[7] == 0) begin
			data = data << 1;
			count = count + 1;
		end	

		$display("Shifted %0d times, result = %b", count, data);

	end
endmodule
