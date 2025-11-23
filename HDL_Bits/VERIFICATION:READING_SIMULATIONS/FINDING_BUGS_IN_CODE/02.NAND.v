module top_module (input a, input b, input c, output out);

    wire save;
    andgate inst1 (save, a, b, c, 1, 1);
    assign out = ~save;

endmodule
