// N-bit and or operation using task

module operation_Nbit;
	parameter N = 4;
        reg [N-1:0]a, b;
        reg  [N-1:0]and_op, or_op;

        initial begin
                a = $random; b = $random;
                and_N(a, b, and_op);  // And Task call
		or_N(a, b, or_op);    // Or Task call
        end

// And Task definition
task and_N;
        input [N-1:0]a, b;
        output [N-1:0]and_op;

        begin
                and_op = a & b;
          	$display("time = %0t | a = %d | b = %d | And = %d",$time, a, b, and_op);
        end
endtask


// Or Task definition
task or_N;
        input [N-1:0]a, b;
        output [N-1:0]or_op;

        begin
                or_op = a | b;
          	$display("time = %0t | a = %d | b = %d | or = %d",$time, a, b, or_op);
        end
endtask

endmodule

