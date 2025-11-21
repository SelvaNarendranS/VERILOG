// Write a module with multiple always blocks assigning to the same variable—explain why it's wrong and fix it.

module multiple_always_fix;
    	reg clk, a, b;
	reg sel;
	reg c;
	//reg c_sela, c_selb;

	// clock generation
	initial clk = 0;
	always #5 clk = ~clk;

    	/*  -------- wrong code --------------

	always @(posedge clk) begin           
        	c <= a;        
	end

    	always @(posedge clk) begin   // Assigning values to same variable by 2 always block is wrong
        	c <= b;        
	end*/  

	 //--------- correction possiblities ---------------------
	 //------- Fix 1 combine 2 always block to one block
	 always @(posedge clk) begin           
        	if(~sel)
			c <= a;
		else        
        		c <= b;        
	end

	/* ------- Fix 2 use combinational OR logic if intended behavior
	assign c = (sel) ? a : b */

	/* ------- Fix 3 combine 2 always block to one block
	 always @(posedge clk) begin           
        	if(~sel)
			c_sela <= a;
		else        
        		c_selb <= b;        
	end 
	assign c = (~sel) ? a : b  */

	initial begin
		c = 0;
	
		$monitor("Time = %0t | clk = %d | a = %d | b = %d | c = %d | sel = %d", $time, clk, a, b, c, sel);

		sel = 0;
		a = 1; 
		b = 0; #3;

		#8
		sel = 1;
		a = 1; 
		b = 0; #2;

	#13 $finish;
	end
endmodule
