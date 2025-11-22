// Implement an n-bit data bus multiplexer using generate.

module n_bit_mux;
	parameter mux      = 8;  // number of bus
	parameter insize   = 8;  // width of each bus
	parameter inselect = 3;
	reg [insize-1:0]data[mux-1:0];
	reg [inselect-1:0]select;
	reg [insize-1:0]out;

	wire [insize-1:0] selected_term [mux-1:0];

	genvar i;
	generate 
		for(i = 0; i < mux; i = i+1) begin : n_mux
			assign selected_term[i] = (select == i) ? data[i] : {insize{1'b0}};
		end
	endgenerate

	//assign out = selected_term[0] | selected_term[1] | selected_term[2] | selected_term[3];
	always @(*)begin
		out = 0;
		for(integer i = 0; i < mux; i++) begin
			out =out |selected_term[i];
		end
	end


	initial begin 

		// initialize
		for(integer j = 0; j < mux; j++) begin
			data[j] = $random;
			$write("data[%0d] = %0d | ", j, data[j]);
		end

		$monitor("Time = %0t | select = %d | out = %d", $time, select, out);
		
		for(integer k = 0; k < mux; k++) begin
			select = k; #4;
		end

		#10 $finish;
	end
endmodule
