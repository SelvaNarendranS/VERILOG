// 4 bit carry look ahead adder Test bench

`timescale 1ns/1ps

module cla_tb;
wire [4:0]sum;
wire cout;
reg [3:0]a, b;
reg cin;

	// instantiation 
	cla cla0(.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

	initial begin 
		$monitor("Time = %0t | A = %b(%d) | B = %b(%d) | cin = %b | Sum = %b(%d) | Carry = %b ", $time, a, a, b, b, cin, sum, sum, cout);
		$dumpfile("Carry_look_ahead_adder_dump.vcd");
		$dumpvars(2, cla_tb, cla_tb.cla0);

		repeat(16) begin
		a = $random % 16;
		b = $random % 16;
	        cin = $random % 2;	#10;
		end

		$finish;
	end
endmodule
