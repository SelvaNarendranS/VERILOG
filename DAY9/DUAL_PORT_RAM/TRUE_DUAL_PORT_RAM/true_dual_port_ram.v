// parameterized True Dual port ram (256*16) (2 ports has unique input, output ports but shared memory)
module dual_port_ram #(parameter WIDTH = 16, DEPTH = 256)(
	input clk,

	// Port A
       	input a_rw,
	input [ADDRESS - 1:0]a_w_addr,
	input [ADDRESS - 1:0]a_r_addr,
	input [WIDTH - 1:0]a_indata,
	output reg [WIDTH - 1:0]a_outdata,

	// Port B
        input b_rw,
        input [ADDRESS - 1:0]b_w_addr,
        input [ADDRESS - 1:0]b_r_addr,
        input [WIDTH - 1:0]b_indata,
        output reg [WIDTH - 1:0]b_outdata);

	// Address calculation
	function integer log2;
		input integer value;
		integer i;
		begin
			for(i = 0; value > 0; i++)
				value = value >> 1;
			log2 = i;
		end
	endfunction

	localparam ADDRESS = log2(DEPTH);

	reg [WIDTH - 1:0]memory[DEPTH - 1:0];		// 256 locations each has 16 bit data

	always @(posedge clk) begin
		if((a_rw && b_rw) || (a_w_addr == b_w_addr)) begin
			memory[a_w_addr] <= a_indata;	// port A write has highest priority
		end
		else begin
			if(a_rw)
				memory[a_w_addr] <= a_indata; // port a write
			if(b_rw)
				memory[b_w_addr] <= b_indata; // port b write
		end
		a_outdata <= memory[a_r_addr];	  	     // Synchronous Port a read 
		b_outdata <= memory[b_r_addr];               // Synchronous Port b read
	end
endmodule
