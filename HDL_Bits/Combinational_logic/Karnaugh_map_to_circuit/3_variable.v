module top_module(
    input a,
    input b,
    input c,
    output out  ); 

    assign out = a | b | c; // pos
    //assign out = b | (~b & (c | a));  //sop
    
endmodule
