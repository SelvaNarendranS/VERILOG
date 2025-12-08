// parameterized Single port ram (256*16)
module singleport_ram #(parameter WIDTH = 16, DEPTH = 256)(
	input clk, rw,
	input [ADDRESS - 1:0]addr,
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


	reg [WIDTH - 1:0]memory[DEPTH - 1:0];		// 16 locations each has 8 bit data

	always @(posedge clk) begin
		if(rw) begin
			memory[addr] <= indata;   // Write
			outdata      <= 0;
		end
		outdata <= memory[addr];	  // Synchronous read 
	end

	/*always @(*) begin
    		if (!rw)
        		outdata = memory[addr];	   // Asynchronous Read 
    		else
       	 		outdata = outdata;
	end*/

endmodule


