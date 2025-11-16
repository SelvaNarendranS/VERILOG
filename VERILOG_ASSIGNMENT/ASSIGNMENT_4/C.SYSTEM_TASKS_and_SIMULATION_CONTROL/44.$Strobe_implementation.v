// Implement $strobe to display values at the end of simulation timestep.

module strobe_eg;
	reg a, b, c;

	//assign c = a + b;

	initial begin
		a = 1'b1; b = 1'b0;

		#2 a = 1'b0;
		#2 b = 1'b1;

		$display("[$display] time = %0t | a=%b b=%b c=%b", $time, a, b, c);
        	$strobe ("[$strobe ] time = %0t | a=%b b=%b c=%b", $time, a, b, c);

		c = a + b;	

        #2 $finish;
    end
endmodule