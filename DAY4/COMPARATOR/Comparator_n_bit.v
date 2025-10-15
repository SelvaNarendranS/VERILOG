// Behavoiral model

`define SIZE 8

module comparator(
input [`SIZE-1:0]a, b,
output reg greater, equal, less);

	always @(*) begin 

	{greater, equal, less} = 3'b000;

	if (a > b)   // a greater than b 
	  greater = 1;	

	else if (a == b) // a equal to b
	  equal = 1;

	else if (a < b) // a less than b 
	  less = 1;

	end

endmodule
