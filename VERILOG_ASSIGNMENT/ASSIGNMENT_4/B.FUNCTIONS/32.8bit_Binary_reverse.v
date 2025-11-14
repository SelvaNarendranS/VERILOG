// Create a function to reverse the bits of an input.

module reverse;
    reg [7:0]in;
    wire [0:7]out;

	assign out = reverse_number(in);   // function call 

    initial begin
	in = 8'd12;
	$monitor("time = %0t | in = %b | Result = %b", $time, in, out);	
	#50 $finish;
    end

// function definition
    function [0:7] reverse_number;
	    input [7:0]in;
	    integer i;
	    reg [0:7]temp; 
        begin
		temp = 1'b0;
		for(i = 0;i < 8; i = i+1) begin
		       temp = {temp[1:7],in[i]};
	       end	
	reverse_number = temp;      
        end
    endfunction
endmodule


