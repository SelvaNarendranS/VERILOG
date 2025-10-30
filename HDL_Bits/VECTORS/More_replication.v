module top_module (
    input a, b, c, d, e,
    output [24:0] out );//

    // The output is XNOR of two vectors created by 
    // concatenating and replicating the five inputs.
    wire [24:0]ad0,ad1;
    assign ad0 = {5{a, b, c, d, e}};
    assign ad1 = {{5{a}}, {5{b}}, {5{c}}, {5{d}}, {5{e}}};
    assign out = ~(ad0 ^ ad1);

endmodule
