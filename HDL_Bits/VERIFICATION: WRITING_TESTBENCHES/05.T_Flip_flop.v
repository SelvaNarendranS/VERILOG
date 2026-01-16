module top_module ();
    wire q;
    reg clk;
    reg reset;
    reg t;
    
    // instantation
    tff dut(.clk(clk), .reset(reset), .t(t), .q(q));
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin    
        // reset
        reset = 0; #5
        reset = 1; #5;
        reset = 0; #5;
    end

    // input t - test case 
    always @(posedge clk) begin
        if(reset)
            t <= 1'b0;
        else
            t <= 1'b1;
    end
    
endmodule
