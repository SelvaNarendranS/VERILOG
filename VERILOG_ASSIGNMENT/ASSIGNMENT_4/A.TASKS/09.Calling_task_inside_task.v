// Demonstrate a task calling another task (e.g., double_add_task calling add_task).

// Addition of four 8-bit numbers

module add_8bit;
	reg [7:0]a, b, c, d;
	reg [8:0]sum;

	initial begin
		a = 8'd50; b = 8'd90; c = 8'd75; d = 8'd30;
		addition2(a, b, c, d, sum);  // Task call
		#10 $finish;
	end

// Task definition
task addition1;
	input [7:0]a, b;
	output [8:0]add1;
		
	begin
		add1 = a + b;
	end
endtask

task addition2;
        input [7:0]a, b, c, d;
        output [8:0]sum;
	reg [8:0]add1, add2;

        begin
                addition1(a, b, add1);
		add2 = c + d;
		sum = add1 + add2;
                $display("time = %0t | a = %d | b = %d | c = %d | d = %d | sum = %d",$time, a, b, c, d, sum);
        end
endtask

endmodule	


