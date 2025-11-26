// 24. What value will be displayed for acc at the end of the code execution?
/*
reg [3:0] acc;
	initial begin
		acc = 4'b0001;
		while (acc < 4'b1000) begin
		acc = acc + 1;
	end
	$display("acc = %b", acc);
	end		*/

// ANS:

module acc_out;
reg [3:0] acc;
	initial begin
		acc = 4'b0001;
		while (acc < 4'b1000) begin
		acc = acc + 1;
	end
	$display("acc = %b", acc); 		// acc = 1000
	end
endmodule