// 8. What will be displayed in the console mode for the below snippet?
/*
reg[13*8:1]s;
initial
	begin
	s = "hello world";
	$display("Value of s= %s",s[104:65]);

end	*/

// ANS: 

module answer;
	reg[13*8:1]s;    // 13 characters * 8 bits = 104 bits -- [104:1]
	initial begin
		s = "hello world";		// Each charactor is 1byte  so, 00 00 hello_world = 13charactor
									    // Null Null string
		$display("Value of s= %s",s[104:65]);
	end
endmodule