// Convert Gray code to Binary using generate loop structure.

module gray_to_binary;
    reg  [3:0] a;
    wire [3:0] b;

    assign b[3] = a[3];

    genvar i;
    generate
        for (i = 2; i >= 0; i = i - 1) begin : G2B
            assign b[i] = b[i+1] ^ a[i];
        end
    endgenerate

    initial begin
        $monitor("Time=%0t | a=%b | b=%b", $time, a, b);

        a = 4'b0000; #5;
        a = 4'b0001; #5;
        a = 4'b0010; #5;
        a = 4'b0011; #5;
        a = 4'b1100; #5;
        a = 4'b0101; #5;
        a = 4'b1010; #5;
        a = 4'b1111; #5;

        $finish;
    end

endmodule
