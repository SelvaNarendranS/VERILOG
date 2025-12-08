// parameterized True Dual port ram test bench(256*16) (2 ports has unique input, output ports but shared memory
module dual_port_ram_tb;
	parameter WIDTH = 16, 
		  DEPTH = 256;
	reg clk;

	// Port A
       	reg a_rw;
	reg [ADDRESS - 1:0]a_w_addr;
	reg [ADDRESS - 1:0]a_r_addr;
	reg [WIDTH - 1:0]a_indata;
	wire [WIDTH - 1:0]a_outdata;

	// Port B
        reg b_rw;
        reg [ADDRESS - 1:0]b_w_addr;
        reg [ADDRESS - 1:0]b_r_addr;
        reg [WIDTH - 1:0]b_indata;
        wire [WIDTH - 1:0]b_outdata;

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
	dual_port_ram #(.WIDTH(WIDTH), .DEPTH(DEPTH)) dut(.clk(clk), .a_rw(a_rw), .a_w_addr(a_w_addr), .a_r_addr(a_r_addr), .a_indata(a_indata), .a_outdata(a_outdata), .b_rw(b_rw), .b_w_addr(b_w_addr), .b_r_addr(b_r_addr), .b_indata(b_indata), .b_outdata(b_outdata));

	// clock generation
	initial clk = 0;
	always #5 clk = ~clk;

	always @(posedge clk) begin
		$display("Time = %0t | clk = %0d | a_rw = %0d | a_w_addr = %0d | a_indata = %0d | b_rw = %0d | b_w_addr = %0d | b_indata = %0d | a_r_addr = %0d | a_outdata = %0d | b_r_addr = %0d | b_outdata = %0d", $time, clk, a_rw, a_w_addr, a_indata, b_rw, b_w_addr, b_indata, a_r_addr, a_outdata, b_r_addr, b_outdata);
	end

	task write_a;
		begin
			// Port a write data
			$display("------- Port a Write mode -----------");
			a_rw = 1;
			for(integer i = 0; i < DEPTH; i++) begin
				a_w_addr = i;
				a_indata = $random; #10;
			end
		end
	endtask

	task read_a;
		begin
			// Port A read data
			$display("------- Port a read mode -----------");
               	 	a_rw = 0;
			a_indata = 0;
                	for(integer j = 0; j < DEPTH; j++) begin
                		a_r_addr = j;
                        	#10;
                	end
		end
	endtask

	task write_b;
		begin
			// Port B write data
			$display("------- Port B Write mode -----------");
			b_rw = 1;
			for(integer k = 0; k < DEPTH; k++) begin
				b_w_addr = k;
				b_indata = $random; #10;
			end
		end
	endtask

	task read_b;
		begin
			// Port B read data
			$display("------- Port B read mode -----------");
               	 	b_rw = 0;
			b_indata = 0;
                	for(integer l = 0; l < DEPTH; l++) begin
                		b_r_addr = l;
                        	#10;
                	end
		end
	endtask

	task write_conflict;
		begin
			// checking WRITE-CONFLICT CONDITIONS (if both ports try to write at same address)
			$display("\n------- write Conflict Test (A and B write to Addr 120) -----------");
			a_rw = 1;
			b_rw = 1;
			a_w_addr = 120;
			b_w_addr = 120;
			a_indata = 1234;
			b_indata = 4321; #10;
			$display("a_indata = %0d | b_indata = %0d", a_indata, b_indata);

			// Read the WRITE-CONFLICT CONDITION
			$display("\n------- read checking - write Conflict Tested address (A and B write to Addr 120) -----------"); 
			a_rw = 0;
			a_r_addr = 120; #10;

			b_rw = 0;
			b_r_addr = 120; #10;	
		end
	endtask

	initial begin
		$dumpfile("dump.vcd");
		$dumpvars;

		// initialize
		// port A
		a_rw = 1;
		a_w_addr = 0;
		a_r_addr = 0;
		a_indata = 0;

		// port B
		b_rw = 1;
		b_w_addr = 0;
		b_r_addr = 0;
		b_indata = 0; #10;
	
		write_a; #10;
		read_a;
		
		write_b; #10;
		read_b;

		#10;
		write_conflict;
		
	#21; 
	$finish;
	end
endmodule