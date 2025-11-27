// structural_modelling 
module comparator_1bit(
    input a, b,
    output equal, greater, less
);

    wire nota, notb;

    xnor(equal, a, b);  // 1 if a == b
    not(nota, a);
    not(notb, b);

    and(greater, a, notb);  // a > b
    and(less, nota, b);     // a < b

endmodule


module comparator_2bit;
    reg  [1:0] a, b;
    wire equal, greater, less;
    wire [1:0] e, g, l;
    wire eq_stage, g_temp, l_temp;

    // 1-bit comparisons
    comparator_1bit c0(a[0], b[0], e[0], g[0], l[0]);
    comparator_1bit c1(a[1], b[1], e[1], g[1], l[1]);

    // combine results
    and (equal, e[1], e[0]);                           
    and (eq_stage, e[1], g[0]);
    or  (greater, g[1], eq_stage);                  
    and (l_temp, e[1], l[0]);
    or  (less, l[1], l_temp);

    always @(*) begin
        $display("Time = %0t | a = %b | b = %b | %s",$time, a, b,(equal ? "Equal" : greater ? "Greater" : less ? "Less" : "Error"));
    end

    initial begin
        repeat(15) begin
            a = $random % 4;
            b = $random % 4;
            #10;
        end
        #20 $finish;
    end
endmodule
