module top_module();
    wire      out;
    reg [1:0] in;

    // instantation
    andgate dut(.in(in), .out(out));
    initial begin
        in = 0; #10;
        in = 1; #10;
        in = 2; #10;
        in = 3; #10;
    end
endmodule
