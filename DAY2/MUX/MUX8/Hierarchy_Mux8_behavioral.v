// Behavioral level Modelling

// module 4*1 mux

module mux4(
input [3:0]a,
input [1:0]select_line,
output reg b);

	always@(*) begin
	
		case(select_line)
	
		2'b00 : b = a[3];
		2'b01 : b = a[2];
		2'b10 : b = a[1];
		2'b11 : b = a[0];
		default : b = 2'b00;
	
		endcase
	end

endmodule

// Behavioral level Modelling
// 2*1 mux

module mux2(
input [1:0]a,
input select_line, 
output reg b);

	always@(*) begin
	
		case(select_line)
	
		1'b0 : b = a[0];
		1'b1 : b = a[1];
		default : b = 1'b0;
	
		endcase
	end

endmodule


// combine 2 4*1 mux and one 2*1 to get 8*1 mux
// Hierarchy 8*1 mux

module mux8(
input [7:0]a,
input [2:0]select_line,
output b);

wire mx1, mx2;

	//intantiate of two 4*1 mux

	mux4 mu1( .a(a[7:4]), .select_line(select_line[1:0]), .b(mx1));

	mux4 mu2( .a(a[3:0]), .select_line(select_line[1:0]), .b(mx2));

	// connecting 2 muxs to 2*1 mux

	mux2 mu3( .a({mx1, mx2}), .select_line(select_line[2]), .b(b));

endmodule
