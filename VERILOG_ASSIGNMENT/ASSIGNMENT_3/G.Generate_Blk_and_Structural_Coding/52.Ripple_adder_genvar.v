// Design a 4-bit ripple-carry adder using generate and full_adder module.

module ripple_carry_adder;
reg [3:0]a, b; 
reg cin; 
wire [4:0]sum; 
wire [4:0]c;
	assign c[0] = cin;

	// intantiate of 4 full adder
	genvar i;
	generate
	for (i = 0; i < 4; i = i+1) begin : rca
		full_adder rc( .a(a[i]), .b(b[i]), .cin(c[i]), .sum(sum[i]), .cout(c[i+1]));
	end
	endgenerate
	
	assign sum[4] = c[4];	

	initial begin
	
	$monitor("Time = %0t | a = %b(%d) | b = %b(%d) | cin = %b | sum = %b(%d) | cout = %b", $time, a,a, b,b, cin, sum,sum, c[4]);
		
	// combinations
	a = 4'b1101; b = 4'b1110; cin = 1'b0; #5;
	a = 4'b1101; b = 4'b1110; cin = 1'b1; #5;

	$finish; 
	end

endmodule

module full_adder (
input a, b, cin,
output reg sum, cout);

	always @(a or b or cin) 
	begin
	  sum = a ^ b ^ cin;
	  cout = (a & b) | cin & (a ^ b);
	end

endmodule