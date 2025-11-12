// Using Task that accepts an 8-bit input and outputs its binary reversed form.

module reverse;
    reg [7:0]in;
    reg [0:7]out;

    // Task definition
    task reverse_number;
	    input [7:0]in;
	    output [0:7]out;
	    integer i;
        begin
		for(i = 0;i < 8; i = i+1) begin
		       out = {out[1:7],in[i]};
	       end	      
        end
    endtask

    initial begin
	in = 8'd12;
	reverse_number(in, out);   // task call 
	$display("time = %0t | in = %b | Result = %b", $time, in, out);	
	#50 $finish;
    end
endmodule


