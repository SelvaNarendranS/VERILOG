// Gate level implementation

module xnor_gate(input a, b, output c);

  // assign c = ~(a ^ b);
  xnor(c, a, b); //ab - 11/00 = 1

endmodule
