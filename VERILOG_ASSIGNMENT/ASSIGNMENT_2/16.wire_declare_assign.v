// 16. What is the value of y in the below expression and justify the reason.
/*
reg [3:0]a= 4'b110x;
wire y = (a== 4'b1100)?1'b1:1'b0;  */

// ANS:

module wire_declare_assign;
reg [3:0]a= 4'b110x;
wire y = (a== 4'b110x)?1'b1:1'b0;
	initial begin
		$display("y = %b", y);   // ans = 0;
	end
endmodule