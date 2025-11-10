// Mealy fsm for 11011 sequence detector(overlapping)
 
module mealy_olap(
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
		if(!reset)
			state <= s0;
		else
			state <= next;
	end

	// next state combinational block
	always @(*) begin
		case(state)
			s0 : next = (data) ? s1 : s0;  // idle state
			s1 : next = (data) ? s2 : s0;  // 1
			s2 : next = (data) ? s2 : s3;  // 1
			s3 : next = (data) ? s4 : s0;  // 110
			s4 : next = (data) ? s2 : s0;  // 1101
			default : next = s0;
		endcase
	end

	// output
	assign detected = ((state == s4) & (data == 1));

endmodule
