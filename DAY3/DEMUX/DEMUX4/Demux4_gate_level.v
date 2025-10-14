// Gate level implementation

module demux4(
input a,
input [1:0]select_line,
output [3:0]b);

wire snot1, snot0;

	not(snot1, select_line[1]);
	not(snot0, select_line[0]);
	and(b[3], snot1, snot0, a);
	and(b[2], snot1, select_line[0], a);
	and(b[1], select_line[1], snot0, a);
	and(b[0], select_line[1], select_line[0], a);
	
endmodule