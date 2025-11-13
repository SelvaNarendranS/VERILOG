// Create a task to simulate a left circular shift of a register value

module left_shift;
	reg [4:0]in;

	initial begin
		in = 5'b10110;
		$monitor("Time = %0t | in = %b", $time, in);
		
		left_shift_register; #5;		
		left_shift_register; #5;
		left_shift_register; #5;
		left_shift_register; #5;

		#20 $finish;
	end

	// Task definition
	task left_shift_register;
		begin
			in = {in[3:0],in[4]};
		end
	endtask

endmodule

