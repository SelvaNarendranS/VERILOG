// Moore fsm for 1101 sequence detector(non overlapping)
 
module moore_fsm(
	input clk, reset, data,
	output detected);

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
			state <= next;
	end

	// next state combinational block
	always @(*) begin
		case(state)
			s0 : next = (data) ? s1 : s0;
			s1 : next = (data) ? s2 : s0;
			s2 : next = (data) ? s2 : s3;
			s3 : next = (data) ? s4 : s0;
			s4 : next = (data) ? s1 : s0;
			default : next = s0;
		endcase
	end

	// output
	assign detected = (state == s4);

endmodule
