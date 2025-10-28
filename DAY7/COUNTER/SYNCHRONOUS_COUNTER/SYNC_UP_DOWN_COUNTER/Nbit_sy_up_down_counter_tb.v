// N bit synchronous up - counter test bench

`timescale 1ns/1ps

module sy_up_dncnt_tb;
parameter N = 4;
wire [N-1:0]q;
reg clk, rst, enable, up_count, down_count;

	// Instantiation
	sy_up_dncnt #(.N(N)) sudc(.clk(clk), .rst(rst), .q(q), .enable(enable), .up_count(up_count), .down_count(down_count));

	initial clk = 0;
	always #5 clk = ~clk;

	// Task 1 up count display
	task display_up;
		begin
			$display("Time = %0t | clk = %b | rst = %b | enable = %b | up count = %b | q = %b",$time, clk, rst, enable, up_count, q);
		end
	endtask

	// Task 2 down count display 
        task display_down;
                begin
                        $display("Time = %0t | clk = %b | rst = %b | enable = %b | down count = %b | q = %b",$time, clk, rst, enable, down_count, q);
                end
        endtask

	// Task assign 
	
	always @(posedge clk) begin
		if(enable && up_count && !down_count)
			display_up();
		else if(enable && !up_count && down_count)
			display_down();
	end

	initial begin
		$dumpfile("Nbit_sy_up_counter_dump.vcd");
		$dumpvars;

		// initial reset
		rst = 1;
		up_count = 0;
		down_count = 0;
		enable = 0; #5;

		// Deassert reset
		#10 rst = 0;
		
		$display("\n--- Up count ---\n");
		// test case up count
		repeat(16) begin
		up_count = 1;
		enable = 1; #10;
	        end	

		up_count = 0; #1;

		$display("\n--- Down count ---\n");
		// test case up count
		repeat(16) begin
		down_count = 1;
		enable = 1; #10;
	        end

		#40 $finish;
	end
endmodule


