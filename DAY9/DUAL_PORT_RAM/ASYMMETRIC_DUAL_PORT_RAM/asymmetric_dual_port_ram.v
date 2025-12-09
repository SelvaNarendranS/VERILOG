// parameterized Asymmetric Dual port ram (256*16) (2 ports has unique input, output ports but shared memory but different bit size)
module dual_port_ram #(parameter WIDTH_A = 16, WIDTH_B = 8, DEPTH = 256)(
	input clk,

	// Port A
       	input a_rw,
	input [ADDRESS - 1:0]a_w_addr,
	input [ADDRESS - 1:0]a_r_addr,
	input [WIDTH_A - 1:0]a_indata,
	output reg [WIDTH_A - 1:0]a_outdata,

	// Port B
        input b_rw,
        input [ADDRESS - 1:0]b_w_addr,
        input [ADDRESS - 1:0]b_r_addr,
        input [WIDTH_B - 1:0]b_indata,
        output reg [WIDTH_B - 1:0]b_outdata);

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

	reg [WIDTH_A - 1:0]memory[DEPTH - 1:0];		// 256 locations each has 16 bit data

	always @(posedge clk) begin
		if((a_rw && b_rw) || (a_w_addr == b_w_addr)) begin
			memory[a_w_addr] <= a_indata;	// port A write has highest priority
		end
		else begin
			if(a_rw)
				memory[a_w_addr] <= a_indata; // port a write
			if(b_rw)
				memory[b_w_addr][15 :8] <= b_indata; // port b write (8 bit MSB side of memory)
				//memory[b_w_addr] <= b_indata;      // port b write (8 bit LSB side of memory)
		end
		a_outdata <= memory[a_r_addr];	  	     // Synchronous Port a read 
		b_outdata <= memory[b_r_addr][15 :8];        // Synchronous Port b read (8 bit MSB side of memory)
		// b_outdata <= memory[b_r_addr];            // Synchronous Port b read (8 bit LSB side of memory)
	end
endmodule

