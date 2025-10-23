// Behavioral Model

// master D latch
module dlatch(
input clk, d, rst, // clk == clock
output reg q,
output q_bar);

	always @(clk or d or rst)
	begin
		if(rst)
		   q <= 0;
		else
			if(clk) 
			   q <= d;
	end
	assign q_bar = ~q;

endmodule 

// slave SR latch 
// Behavioral model 

module srlatch(
input s, r, rst, clk, // clk == clock
output reg q,
output q_bar);

	always @(*) begin
	  if(rst)
		q <= 1'b0;
	  else if(clk) begin
		case({s, r}) 
		  2'b00 : q <= q;  // no change
		  2'b01 : q <= 1'b0;  // reset
		  2'b10 : q <= 1'b1;  // set
		  2'b11 : q <= 1'bx;  // not defined
	        endcase
	   end
	end
	assign q_bar = ~q;

endmodule

// posedge master slave configuration by D & SR latch

module pmsc(
input clk, master_d, rst,
output q, q_bar); 

wire dq, dq_bar, dclk, not_clk;

	assign not_clk = ~clk;

	// instantiation of master and slave latch 
	dlatch dl1(.clk(not_clk), .d(master_d), .rst(rst), .q(dq), .q_bar(dq_bar)); // master

	assign dclk = ~not_clk;

	srlatch srl1(.clk(dclk), .s(dq), .r(dq_bar), .rst(rst), .q(q), .q_bar(q_bar));  // slave

endmodule


