// Using Task that calculates the factorial of a number using a loop

module factorial;
    reg [7:0]in;
    reg [20:0]out;

    // Task definition
    task factorial_number;
	    input [7:0]in;
	    output [20:0]out;
	    reg [15:0]product;
	    integer i;
        begin
            	product = 1;
		for(i = in;i > 0; i = i-1) begin
		       product = product * i;
	       end	
	out = product;       
        end
    endtask

    initial begin
	in = 8'd5;
	factorial_number(in, out);   // task call 
	$display("time = %0t | in = %d | Result = %d", $time, in, out);	
	#50 $finish;
    end
endmodule

