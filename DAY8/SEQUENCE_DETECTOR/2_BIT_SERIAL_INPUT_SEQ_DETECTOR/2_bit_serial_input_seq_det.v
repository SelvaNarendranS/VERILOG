// Mealy fsm for data[1:0] = 10 → 01 → 11 → 00  sequence detector
 
module mealy(
	input clk, reset, 
	input [1:0]data,
	output reg detected);

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
			state <= s2;
		else
			state <= next;
	end

	// next state combinational block
	always @(*) begin
		detected = 0;
		case(state)
			s0 : next = (data == 2'b10) ? s1 : s0;
			s1 : next = (data == 2'b01) ? s2 : (data == 2'b10) ? s1 : s0;
			s2 : next = (data == 2'b11) ? s3 : (data == 2'b10) ? s1 : s0;
			s3 : begin 
				if(data == 2'b00) begin
					next = s3;
					detected = 1;
				end
				else
					next = s0;
			end
			default : next = s0;
		endcase
	end

endmodule
