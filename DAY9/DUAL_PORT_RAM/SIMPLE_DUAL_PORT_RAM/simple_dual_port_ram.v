// parameterized Dual port ram (256*16) (each port for Write, Read)
module dual_port_ram #(parameter WIDTH = 16, DEPTH = 256)(
	input clk, rw,
	input [ADDRESS - 1:0]w_addr,
	input [ADDRESS - 1:0]r_addr,
	input [WIDTH - 1:0]indata,
	output reg [WIDTH - 1:0]outdata);

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
		if(rw) begin
			memory[w_addr] <= indata;   // Write
			outdata      <= 0;
		end
		outdata <= memory[r_addr];	  // Synchronous read 
	end

endmodule



