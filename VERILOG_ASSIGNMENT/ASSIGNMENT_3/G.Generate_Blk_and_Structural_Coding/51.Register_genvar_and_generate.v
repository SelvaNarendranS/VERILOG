// Use generate and genvar to initialize an 8-bit register array. 

// Top module
module register_genvar;
parameter N = 8;
reg clk, rst, enable; 
reg [N-1:0]a;
wire [N-1:0]f;

wire [N-1:0]d_in;

	// enable = 1 means register in active state
	assign d_in = enable ? a : f;  

	// instantiation of D flip flop
	genvar i;
	generate
	for (i = 0; i < N; i = i+1) begin : reg_bits
		dff d_inst(.clk(clk), .rst(rst), .d(d_in[i]), .q(f[i]));
	end
	endgenerate

	initial clk = 0;
	always #5 clk = ~clk;


	initial begin 

		$monitor("Time = %0t | clk = %b | rst = %b | enable = %b | A = %b | F = %b ",$time, clk, rst, enable, a, f);

		// initial reset 
		rst = 1;
		enable = 1;
		a   = 0; #5;

		// Deassert reset
		rst = 0; #15;

		repeat(15) begin
			a = $random; #4;
		end

		// checking enable 
		repeat(2) begin
			enable = 0;
			a = $random; #4;
		end
		
		enable = 1;
		a = $random; #4;
		
		#13 $finish;
	end

endmodule

module dff( 
input clk, d, rst,
output reg q,
output q_bar);

	always @(posedge clk or posedge rst)
	begin
	   if(rst) // rst = active high reset
		q <= 1'b0;
	   else
		q <= d;
	end
	assign q_bar = ~q;

endmodule 


