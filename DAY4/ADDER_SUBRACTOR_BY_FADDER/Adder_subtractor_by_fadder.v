// Behavioral model 

// Full adder

module full_adder(
input a, b, cin,
output reg sum, cout);

	always @(*) 
	begin
		sum = a ^ b ^ cin;
		cout = a & b | ((a ^ b) & cin);
	end

endmodule


// Adder subtractor by Full adder


module adder_subtractor_by_fadder(
input [3:0]a, b,
input select, 		  // select = addition - '0' or subraction - '1'
output [4:0]final_out);   // 4-bit result + carry/borrow

wire [3:0]cout, b_xor;
wire carry_out;

	assign b_xor = b ^ {4{select}}; // 1's complement of b
	
	// instantation of fadder

	full_adder asfa1(.a(a[0]), .b(b_xor[0]), .cin(select), .sum(final_out[0]), .cout(cout[0]));
	full_adder asfa2(.a(a[1]), .b(b_xor[1]), .cin(cout[0]), .sum(final_out[1]), .cout(cout[1]));
	full_adder asfa3(.a(a[2]), .b(b_xor[2]), .cin(cout[1]), .sum(final_out[2]), .cout(cout[2]));
	full_adder asfa4(.a(a[3]), .b(b_xor[3]), .cin(cout[2]), .sum(final_out[3]), .cout(cout[3]));

	// combine final result and carry/borrow
	assign final_out[4] = cout[3];

endmodule
