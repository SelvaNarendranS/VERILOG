// Show a waveform that differentiates for, repeat, and forever behaviors.

module Diff_bw_for_repeat_forever;
	reg clk_forever, clk_for, clk_repeat;
	integer i; 

	// initial block
	initial begin 
		clk_forever = 1'b0;
		forever #5 clk_forever = ~clk_forever;     // ------Forever
	end	

	initial begin
		$dumpfile("waves.vcd");
		$dumpvars(0, Diff_bw_for_repeat_forever);

		$monitor("clk_forever = %b |  clk_for = %b |  clk_repeat = %b",clk_forever, clk_for, clk_repeat);
		
		clk_for = 0;
		clk_repeat = 0;

		for(i = 0; i < 8; i++) begin
			#7 clk_for = ~ clk_for;     // ---------for
		end


		repeat(8) begin
			#9 clk_repeat = ~clk_repeat;   // ---------repeat
		end

	#20 $finish;
	end
endmodule
