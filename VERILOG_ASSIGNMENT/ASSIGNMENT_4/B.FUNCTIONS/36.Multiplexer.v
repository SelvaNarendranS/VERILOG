// Create a function that implements a multiplexer (selects 1 of 4 inputs).

module multiplexer;
	reg [3:0]a, b, c, d;
	reg [1:0]select;
	wire [3:0]out;
	
	assign out = mux(a, b, c, d, select); // Function call

	initial begin
		$monitor("time = %0t | a = %d,%d,%d,%d | select line = %d | Result = %d",$time, a, b, c, d, select, out);


		a = 4'd12; b = 4'd14; c = 4'd4; d = 4'd1;
		select = 2'd0;  #2;
		select = 2'd1;  #2;
		select = 2'd2;  #2;
		select = 2'd3;  #2;
 
	end

// Function definition
function [3:0]mux;
	input [3:0]x, y, z, f;
	input [1:0]sel;
		
	begin
		case(sel)
			0 : mux = x;
			1 : mux = y;
			2 : mux = z;
			3 : mux = f;
		endcase		
	end
endfunction

endmodule	


