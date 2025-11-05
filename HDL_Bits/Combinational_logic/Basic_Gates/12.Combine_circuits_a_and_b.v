module IB ( input x, input y, output z );

    assign z = ~(x^y); 
    
endmodule

module IA (input x, input y, output z);
    
    assign z = (x^y) & x;

endmodule
module top_module (input x, input y, output z);
    
    wire org, andg;
    wire[1:0]a, b;
    
    // instantiation
    IA uup0 (.x(x), .y(y), .z(a[0]));
    IB uup1 (.x(x), .y(y), .z(b[0]));
    IA uup2 (.x(x), .y(y), .z(a[1]));
    IB uup3 (.x(x), .y(y), .z(b[1]));
    
    assign org   = a[0] | b[0];
    assign andg = a[1] & b[1];
    assign z = org ^ andg;

endmodule

