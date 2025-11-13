// Write a task that counts the number of 1s in an 8-bit input.

module count_1s;
        reg [7:0]a;
        reg [3:0]out;

        initial begin
                a = 8'd253; 
                count(a, out);  // Tasks call
        end

// Task definition
task count;
        input [7:0]a;
        output [3:0]out;
	reg temp;
	integer i;
	reg [3:0]counter;
        begin
		counter = 0;
		for(i = 0; i < 8; i++) begin
			temp = a[i] ^ 0;
			if(temp)
				counter = counter + 1;
			else
				counter = counter;
		end	
 		out = counter;
          	$display("time = %0t | a = %b | out = %d",$time, a, out);
        end
endtask

endmodule

