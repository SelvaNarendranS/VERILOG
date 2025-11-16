// Write a testbench to simulate a register file using loops and arrays.
// Test bench

module store_data_tb;
        reg clk, rw_enable;
        reg [2:0]w_addr;
        reg [2:0]r_addr;
        reg [7:0]w_data;
        wire [7:0]r_data;

	// instantiation
	store_data uup(clk, rw_enable, w_addr, r_addr, w_data, r_data);

	// clock generation
	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end


	// write operation Input address generation
	task write_data;
		integer i;
		begin
                        $display("\n-------------Write mode------------------");
			rw_enable = 1;
			for(i = 0; i < 8; i++) begin
				w_addr = i;
				w_data = i * 10;
				@(posedge clk);
				$display("Time = %0t | clk = %b | rw_enable = %d | w_addr = %b | w_data = %b",$time, clk, rw_enable, w_addr, w_data);
			end
		end
	endtask

	// read operation output address generation
	        task read_data;
                integer i;
                begin
                        $display("\n-------------Read mode------------------");
			rw_enable = 0;
                        for(i = 0; i < 8; i++) begin
                                r_addr = i;
				@(posedge clk);
				$display("Time = %0t | clk = %b | rw_enable = %d | r_addr = %b | r_data = %b", $time, clk, rw_enable, r_addr, r_data);
                        end
                end
	endtask

	initial begin

		// Initialize
        	rw_enable = 0;
        	w_addr = 0;
        	r_addr = 0;
        	w_data = 0; #10;

		write_data; #10;
		read_data; #10;

		#11 $finish;
	end

endmodule
// Design
module store_data(
	input clk, rw_enable,
	input [2:0]w_addr,
	input [2:0]r_addr,
	input [7:0]w_data,
	output reg [7:0]r_data);

	reg [7:0]reg_arr[7:0];

	// write operation
	always @(posedge clk) begin
		if(rw_enable)
		       reg_arr[w_addr] <= w_data;
       end

        // read operation
        always @(posedge clk) begin
        	if(!rw_enable) 
                       r_data <= reg_arr[r_addr];
		else
			r_data <= 8'd0;
       end

endmodule

