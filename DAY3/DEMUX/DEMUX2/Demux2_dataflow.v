// Dataflow level Modelling

module demux2(
input a,
input select_line, 
output [1:0]b);

	//assign b[0] = (~select_line & a); // Boolean expression
	//assign b[1] = (select_line & a); // Boolean expression 
	assign b = select_line ? {a, 1'b0} : {1'b0, a} ; // By conditional operator 

endmodule


