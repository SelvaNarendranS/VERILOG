// Create a function that performs a logical AND on all bits of a bus.

module logicaout;
	reg [7:0]a;
	wire out;
	
	assign out = logic_a(a); // Function call

	initial begin
		a = 8'd12;		 
		#2 $display("time = %0t | a = %d | logic and = %d",$time, a, out);

		a = 8'd255;		 
		#2 $display("time = %0t | a = %d | logic and = %d",$time, a, out);

	end

// Function definition
function logic_a;
	input [7:0]x;
	integer i;

	begin
		logic_a = 1'b1;
		for(i = 0; i < 8; i++) begin 
			 logic_a = logic_a & x[i];
		end
	end
endfunction

endmodule	



