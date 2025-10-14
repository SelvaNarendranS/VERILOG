// Behavioral level Modelling

// 1*2 demux

module demux2(
input a,
input select_line, 
output reg [1:0]b);

	always@(*) begin

		b = 2'b00;	
		case(select_line)
	
		1'b0 : b[0] = a;
		1'b1 : b[1] = a;
		default : b = 2'b00;
	
		endcase
	end

endmodule

// combine 3 1*2 demux to get 1*4 demux
// Hierarchy 1*4 mux

module demux4(
input a,
input [1:0]select_line,
output [3:0]b);

wire dmux0,dmux1;

	assign dmux0 = a & ~select_line[1];
	assign dmux1 = a & select_line[1];

	//intantiate

	demux2 m1( .a(dmux0), .select_line(select_line[0]), .b(b[1:0]));

	demux2 m2( .a(dmux1), .select_line(select_line[0]), .b(b[3:2]));


endmodule


