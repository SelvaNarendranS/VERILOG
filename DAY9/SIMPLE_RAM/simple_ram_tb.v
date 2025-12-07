// Simple ram (16 *8) test bench
module simple_ram_tb;
	reg clk, rw;
	reg [3:0]addr;
	reg [7:0]indata;
	wire [7:0]outdata;

	// instantation
	simple_ram dut(.clk(clk), .rw(rw), .addr(addr), .indata(indata), .outdata(outdata));

	// clock generation
	initial clk = 0;
	always #5 clk = ~clk;

	always @(posedge clk) begin
		if(rw)
			$display("Time = %0t | clk = %0d | rw = %0d | addr = %0d | indata = %0d", $time, clk, rw, addr, indata);
		else
			$display("Time = %0t | clk = %0d | rw = %0d | addr = %0d | outdata = %0d",  $time, clk, rw, addr, outdata);
	end

	initial begin
		$dumpfile("dump.vcd");
		$dumpvars;
		
		// initialize
		rw = 1;
		addr = 0;
		indata = 0; #10;

		// write data
		$display("------- Write mode -----------");
		rw = 1;
		for(integer i = 0; i < 16; i++) begin
			addr = i;
			indata = $random; #10;
		end

		// read data
		$display("------- read mode -----------");
                rw = 0;
                for(integer i = 0; i < 16; i++) begin
                	addr = i;
                        #10;
                end
		
	#21; 
	$finish;
	end
endmodule

