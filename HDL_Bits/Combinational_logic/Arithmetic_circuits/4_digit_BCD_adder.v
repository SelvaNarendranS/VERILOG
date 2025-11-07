module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    
    wire [4:0]carry;
    assign carry[0] = cin;
    
    genvar i;
    generate
        for(i = 0; i < 4; i++) begin : fbcda
            bcd_fadd bcd_instan(.a(a[4*i +:4]), .b(b[4*i +:4]), .cin(carry[i]), .cout(carry[i+1]), .sum(sum[4*i +:4]));
        end
    endgenerate
    
    assign cout =carry[4];

endmodule

