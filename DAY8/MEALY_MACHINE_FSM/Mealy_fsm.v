// Mealy fsm for 1010 sequence detector(non overlapping)
 
module mealy_fsm(
	input clk, reset, data,
	output detected);

	// states
	parameter [1:0] s0 = 0,
			s1 = 1,
			s2 = 2,
			s3 = 3;
	reg [1:0]state, next;

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
			s1 : next = (data) ? s1 : s2;
			s2 : next = (data) ? s3 : s0;
			s3 : next = (data) ? s1 : s0;
			default : next = s0;
		endcase
	end

	// output
	assign detected = ((state == s3) & (data == 1'b0));

endmodule
