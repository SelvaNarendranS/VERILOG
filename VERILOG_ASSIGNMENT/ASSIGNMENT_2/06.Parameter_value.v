// 6. What will be the value of the parameter constant for the instance DUT in the top module from the below snippet?
/*
module test;
	parameter WIDTH=8;
endmodule
module top;
	test #(16) OUT ( ) ;
endmodule
*/

// ANS:

module test;
	parameter WIDTH=8;
endmodule
module top;
	parameter WIDTH = 8;
	test #(16) OUT( ) ;   // Parameter override: #(16) overrides the first parameter declared in module test
	initial $display("Width = %0d", OUT.WIDTH); // To display instance value 
endmodule