// structural_modelling 
// 4-bit ALU Structural Modelling

module alu_4bit(
    	input  [3:0] a, b,
    	input  [1:0] select,
    	output [3:0] f);

    	wire [3:0] andg, org, xorg, add;
    	wire c1, c2, c3, c4;

    	assign andg = a & b;
    	assign org  = a | b;
    	assign xorg = a ^ b;

    	hierarchy_full_adder fa0(a[0], b[0], 1'b0, add[0], c1);
   	hierarchy_full_adder fa1(a[1], b[1], c1,   add[1], c2);
   	hierarchy_full_adder fa2(a[2], b[2], c2,   add[2], c3);
    	hierarchy_full_adder fa3(a[3], b[3], c3,   add[3], c4);

    	mux4 mux0({add[0], andg[0], org[0], xorg[0]}, select, f[0]);
    	mux4 mux1({add[1], andg[1], org[1], xorg[1]}, select, f[1]);
    	mux4 mux2({add[2], andg[2], org[2], xorg[2]}, select, f[2]);
    	mux4 mux3({add[3], andg[3], org[3], xorg[3]}, select, f[3]);

endmodule

// Test bench
module tb;
    reg [3:0] a, b;
    reg [1:0] select;
    wire [3:0] f;

    alu_4bit dut(a, b, select, f);

    always @(*) begin
        $monitor(" Time = %0t | a = %b | b = %b | sel = %b  | f = %b | operation = %s", $time, a, b, select, f, (select == 2'b00) ? "XOR" : (select == 2'b01) ? "OR" : (select == 2'b10) ? "AND" :  (select == 2'b11) ? "ADD" : "Invalid");
    end

    initial begin
        a = 4'b1010; b = 4'b0101;
        select = 2'b00; #10;
        select = 2'b01; #10;
        select = 2'b10; #10;
        select = 2'b11; #10;
        #20 $finish;
    end
endmodule


// Gate level modelling
// module half adder

module half_adder(input a, b, output sum, carry);

	xor(sum, a, b);
	and(carry, a, b);

endmodule

// combining 2 half adder + 1 or gate to make Full adder 
module hierarchy_full_adder(input a, b, c, output sum, carry);

wire sum1, carry1, carry2; // internal wires b/w 2 HF-adders

	// Instantiate two half adders
	half_adder hf1( .a(a), .b(b), .sum(sum1), .carry(carry1));
	half_adder hf2( .a(sum1), .b(c), .sum(sum), .carry(carry2));

	// final carry out
	or(carry, carry1, carry2);

endmodule 


// Gate level implementation
module mux4(
input [3:0]a,
input [1:0]select_line,
output b);

wire and1, and2, and3, and4, snot1, snot0;

	not(snot1, select_line[1]);
	not(snot0, select_line[0]);
	and(and4, snot1, snot0, a[3]);
	and(and3, snot1, select_line[0], a[2]);
	and(and2, select_line[1], snot0, a[1]);
	and(and1, select_line[1], select_line[0], a[0]);
	
	// final output
	or(b, and1, and2, and3, and4);

endmodule

