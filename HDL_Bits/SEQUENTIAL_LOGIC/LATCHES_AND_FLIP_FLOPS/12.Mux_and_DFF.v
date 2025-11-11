module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
    always @(posedge clk) begin
        case({E, L})
            0 : Q <= Q;
            1 : Q <= R;
            2 : Q <= w;
            3 : Q <= R;
        endcase
    end

endmodule
