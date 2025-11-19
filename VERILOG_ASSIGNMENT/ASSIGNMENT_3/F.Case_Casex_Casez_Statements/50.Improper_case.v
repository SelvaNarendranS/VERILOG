// Show how improper use of casex can lead to incorrect matching.

module wrong_casex;
    reg [2:0] in;
    reg out;

    always @(*) begin
        casex (in)
            3'b1x0: out = 1;   // 100 or 110
            3'b0x0: out = 0;   // 000 or 010
            default: out = 0;
        endcase
    end

	initial begin

	$monitor("Time = %0t, in = %b | out = %b", $time, in, out);

	// 16 - Conditions(only testing 4)
	in = 3'b110; #2;
	in = 3'b010; #3;
	in = 3'b111; #3;

	$finish;
	end

endmodule

