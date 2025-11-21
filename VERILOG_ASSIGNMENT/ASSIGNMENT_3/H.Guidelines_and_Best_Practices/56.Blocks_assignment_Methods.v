// Separate combinational and sequential logic using different blocks with correct assignment types.

module moore_fsm;
	reg clk, reset, data;
	wire detected;

	// states
	parameter [2:0] s0 = 0,
			s1 = 1,
			s2 = 2,
			s3 = 3,
			s4 = 4;
	reg [2:0]state, next;

	// Flip flop sequential block
	always @(posedge clk) begin
		if(reset)
			state <= s0;
		else
			state <= next;       // Non blocking assignment in sequential logic
	end

	// next state combinational block
	always @(*) begin
		case(state)
			s0 : next = (data) ? s1 : s0;     // Blocking assignment in combinational logic
			s1 : next = (data) ? s2 : s0;
			s2 : next = (data) ? s2 : s3;
			s3 : next = (data) ? s4 : s0;
			s4 : next = (data) ? s1 : s0;
			default : next = s0;
		endcase
	end

	// output
	assign detected = (state == s4);

	// clocl generation
	initial begin
		clk = 1'b0;
		forever #5 clk = ~clk;
	end

	// Display and test cases
	always @(posedge clk) begin
		$display("Time = %0t | clk = %b | reset = %b | State = %b | data = %b | detected = %b", $time, clk, reset, state, data, detected);
	end

	initial begin

		// reset
		reset = 1'b1;
		data = 1'b0; #10;

		
		// De-assert reset		
		reset = 1'b0; #10;

		// test case
		data = 1'b1; #10;
	       	data = 1'b1; #10;
		data = 1'b0; #10;
		data = 1'b1; #10;
		data = 1'b0; #10;
		data = 1'b1; #10;
		data = 1'b1; #10;
		data = 1'b1; #10;
		data = 1'b0; #10;
		data = 1'b1; #10;
		data = 1'b1; #10;
		data = 1'b0; #10;
		data = 1'b1; #10;
		data = 1'b0; #10;

		#12 $finish;
	end


endmodule
