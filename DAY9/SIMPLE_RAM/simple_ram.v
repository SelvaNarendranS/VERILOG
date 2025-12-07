// Simple ram (16*8)
module simple_ram(
	input clk, rw,
	input [3:0]addr,
	input [7:0]indata,
	output reg [7:0]outdata);

	reg [7:0]memory[15:0];		// 16 locations each has 8 bit data

	always @(posedge clk) begin
		if(rw)
			memory[addr] <= indata;   // Write
		//outdata <= memory[addr];	  // Synchronous read 
	end

	always @(*) begin
    		if (!rw)
        		outdata = memory[addr];	   // Asynchronous Read 
    		else
       	 		outdata = outdata;
	end

endmodule

