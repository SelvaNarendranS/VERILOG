// Gate level implementation

module demux2(
input a,
input select_line,
output [1:0]b);

wire not1;

	not(not1, select_line);
	and(b[0], not1, a);
	and(b[1], select_line, a);

endmodule