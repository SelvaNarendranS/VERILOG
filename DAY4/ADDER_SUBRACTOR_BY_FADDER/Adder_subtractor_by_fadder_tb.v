// Test bench

`timescale 1ns/1ps

module adder_subtractor_by_fadder_tb;
wire [4:0]final_out;
reg [3:0]a, b;
reg select;
integer i;

	// instantation 

	adder_subtractor_by_fadder uut(
		.a(a), 
		.b(b), 
		.final_out(final_out), 
		.select(select)
	);

	// to display signed result
	wire signed [3:0] signed_result = final_out[3:0]; 
	wire carry_borrow = final_out[4];


	initial begin 

	$dumpfile("adder_subtractor_by_fadder.vcd");
	$dumpvars;

	end

	// test cases

	initial begin 
	// test addition

	select = 0;
	for(i = 0; i < 8; i++) 
	begin
		a = $random % 16;
		b = $random % 16; 
		#5;
		$display("Time=%0t | A=%b(%0d) + B=%b(%0d) = Result=%b(%0d) Carry=%b", $time, a, a, b, b, final_out[3:0], final_out[3:0], carry_borrow);
	end

	$display("\n\n");
	// subraction
        
	select = 1;
	for(i = 0; i < 8; i++)
	begin 
		a = $random % 16;
        	b = $random % 16;
		#5;
		$display("Time=%0t | A=%b(%0d) - B=%b(%0d) = Result=%b(Signed %0d) Borrow=%b", $time, a, a, b, b, final_out[3:0], signed_result, carry_borrow);
	end

	#10 $finish;
	end

endmodule
