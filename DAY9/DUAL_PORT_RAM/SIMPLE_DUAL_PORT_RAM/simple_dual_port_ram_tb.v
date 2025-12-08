// dual port ram (256 * 16) test bench (each port for Write, Read)
module dual_port_ram_tb;
	parameter WIDTH = 16,
		  DEPTH = 256;
	reg clk, rw;
	reg [ADDRESS - 1:0]w_addr;
	reg [ADDRESS - 1:0]r_addr;
	reg [WIDTH - 1:0]indata;
	wire [WIDTH - 1:0]outdata;

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

	// instantation
	dual_port_ram #(.WIDTH(WIDTH), .DEPTH(DEPTH)) dut(.clk(clk), .rw(rw), .w_addr(w_addr), .r_addr(r_addr), .indata(indata), .outdata(outdata));

	// clock generation
	initial clk = 0;
	always #5 clk = ~clk;

	always @(posedge clk) begin
		if(rw)
			$display("Time = %0t | clk = %0d | rw = %0d | w_addr = %0d | indata = %0d", $time, clk, rw, w_addr, indata);
		else
			$display("Time = %0t | clk = %0d | rw = %0d | r_addr = %0d | outdata = %0d",  $time, clk, rw, r_addr, outdata);
	end

	task write;
		begin
			// write data
			$display("------- Write mode -----------");
			rw = 1;
			for(integer i = 0; i < DEPTH; i++) begin
				w_addr = i;
				indata = $random; #10;
			end
		end
	endtask

	task read;
		begin
			// read data
			$display("------- read mode -----------");
               	 	rw = 0;
			indata = 0;
                	for(integer i = 0; i < DEPTH; i++) begin
                		r_addr = i;
                        	#10;
                	end
		end
	endtask

	initial begin
		$dumpfile("dump.vcd");
		$dumpvars;

		// initialize
		rw = 1;
		w_addr = 0;
		r_addr = 0;
		indata = 0; #10;
	
		write; #10;
		read;		
		
	#21; 
	$finish;
	end
endmodule



