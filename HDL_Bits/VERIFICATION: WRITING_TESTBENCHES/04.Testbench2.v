module top_module();
    wire     out;
    reg      clk;
    reg      in;
    reg [2:0]s;
    
    // instantation
    q7 dut (.clk(clk), .in(in), .s(s), .out(out));
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        s = 2;
        in = 0; #10;
        
        s = 6;
        in = 0; #10;
        
        s = 2;
        in = 1; #10;
        
        s = 7;
        in = 0; #10;
        
        s = 0;
        in = 1; #30;
        
        s = 0;
        in = 0; #10;
    end
endmodule
