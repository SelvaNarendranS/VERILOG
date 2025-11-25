// 20. Implement 4x1 Mux using continuous assignments, i.e. Data flow model.
/*
a. Assign Y = S1 ? (S0 ? i3 : i2) : (S0 ? i1 : i0);
i. Do not code assign inside always  */

module data_flow_4_1;
	reg i0, i1, i2, i3;
	reg S0, S1;
	wire Y;

	wire [3:0] data_in;
    	wire [1:0] select_in;
    
    	assign data_in = {i3, i2, i1, i0};
    	assign select_in = {S1, S0};

	assign Y = S1 ? (S0 ? i3 : i2) : (S0 ? i1 : i0); 

	initial begin
		$monitor("Time = %0t | Data: %b | Select: %b | Output Y = %b", $time, data_in, select_in, Y);

	// Test case
	{i0 ,i1, i2, i3} = 4'b1101; #1;
	{S0, S1} = 2'b00; #2;
	{S0, S1} = 2'b01; #2;
	{S0, S1} = 2'b10; #2;
	{S0, S1} = 2'b11; #2;

	$finish;
	end
endmodule
