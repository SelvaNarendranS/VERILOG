module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);

    wire [3:0]ones, tens, hundred, thousand;
    wire [3:0]enable;
    
    assign enable ={(hundred == 4'd9 && tens == 4'd9 && ones == 4'd9), (tens == 4'd9 && ones == 4'd9), (ones == 4'd9), 1'b1};
    assign ena = enable[3:1];
        
    bcdcounter count1(.clk(clk), .rst(reset), .enable(enable[0]), .q(ones));
    bcdcounter count10(.clk(clk), .rst(reset), .enable(ena[1]), .q(tens));
    bcdcounter count100(.clk(clk), .rst(reset), .enable(ena[2]), .q(hundred));
    bcdcounter count1000(.clk(clk), .rst(reset), .enable(ena[3]), .q(thousand));
    assign q = {thousand, hundred, tens, ones};
    
endmodule

module bcdcounter(
    input clk, rst, enable,
    output reg [3:0]q);
    
    always @(posedge clk) begin
        if(rst)
            q <= 4'd0;
        else if(enable)
            if(q == 4'd9)
                q <= 4'd0;
        	else
            	q <= q + 4'd1;
    end
    
endmodule
