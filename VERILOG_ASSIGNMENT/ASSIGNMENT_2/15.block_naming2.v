// 15. Which block executes in the below snippet and justify the reason.
/*
reg [3:0]a= 4'b110x;
	initial begin
		if (a!==4'b1100) begin: B1
		end
		else begin: B2 end
	end	*/

// ANS:

module block_naming2;
reg [3:0]a= 4'b110x;
	initial begin
		if (a!==4'b1100) begin: B1
			$display("(a!==4'b1100) so Block B1");
		end
		else begin: B2 
			$display("(a===4'b1100) so Block B2");
		end
	end
endmodule