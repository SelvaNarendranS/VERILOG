// Gate level implementation

module nor_gate( input a, b, output c);

  //assign c = ~(a | b);
  nor (c, a, b);

endmodule

/*
module nand_gate( input a, b, output c);
wire y;
  // assign c = ~(a & b);
  and(y , a, b);
  not(c, y);

endmodule
*/
