// Write a module that toggles a 1-bit signal using initial and always blocks.

module toggle_1bit;
	reg a_initial; 
	reg a_always;

	// initial block
	initial begin
		a_initial = 1'b0;
		forever #5 a_initial = ~a_initial;
	end

	// Always block
	initial	a_always <= 1'b0;
	always #5 a_always <= ~a_always;		

	initial begin
		$monitor("a_initial = %b | a_always = %b", a_initial, a_always);

		#23 $finish;
	end
endmodule
