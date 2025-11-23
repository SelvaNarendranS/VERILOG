// What is the value of y in binary format in the below snippet?

module binary_value_y;
	reg [5:0] y;
	
	initial begin
		y= 'Ox2;     // y in binary = xxx010
		$display("y in binary = %b", y);
	end
endmodule